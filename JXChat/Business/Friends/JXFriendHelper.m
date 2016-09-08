//
//  JXFirendHelper.m
//  JXChat
//
//  Created by jinxiao on 9/2/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXFriendHelper.h"
#import "JXDBFriendStore.h"
#import "JXDBGroupStore.h"

static JXFriendHelper *friendHelper = nil;

@interface JXFriendHelper()

@property (nonatomic, strong) JXDBFriendStore *friendStore;

@property (nonatomic, strong) JXDBGroupStore *groupStore;

@end

@implementation JXFriendHelper

+ (JXFriendHelper *)sharedFriendHelper
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        friendHelper = [[JXFriendHelper alloc]init];
    });
    return friendHelper;
}

- (id)init
{
    self = [super init];
    if (self) {
        //初始化好友数据
        self.friendsData = [self.friendStore friendsDataByUid:[JXUserHelper shareHelper].userID];
        self.data = [[NSMutableArray alloc] initWithObjects:self.defaultGroup, nil];
        self.sectionHeaders = [[NSMutableArray alloc] initWithObjects:UITableViewIndexSearch, nil];
        // 初始化群数据
        self.groupsData = [self.groupStore groupsDataByUid:[JXUserHelper shareHelper].userID];
        // 初始化标签数据
        self.tagsData = [[NSMutableArray alloc] init];
        [self p_initTestData];
        
    }
    return self;
}

- (void)p_initTestData
{
    //好友数据
    NSString *path = [[NSBundle mainBundle]pathForResource:@"FriendList" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    NSArray *arr = [JXUser mj_objectArrayWithKeyValuesArray:jsonArray];
    [self.friendsData removeAllObjects];
    [self.friendsData addObjectsFromArray:arr];
    
    //更新好友数据到数据库
    BOOL ok = [self.friendStore updateFriendsData:self.friendsData forUid:[JXUserHelper shareHelper].userID];
    if (!ok) {
        DDLogError(@"保存好友数据到数据库失败!");
    }
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self p_resetFriendData];
    });
    
    // 群数据
    path = [[NSBundle mainBundle] pathForResource:@"FriendGroupList" ofType:@"json"];
    jsonData = [NSData dataWithContentsOfFile:path];
    jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    arr = [JXGroup mj_objectArrayWithKeyValuesArray:jsonArray];
    [self.groupsData removeAllObjects];
    [self.groupsData addObjectsFromArray:arr];
    ok = [self.groupStore updateGroupsData:self.groupsData forUid:[JXUserHelper shareHelper].userID];
    if (!ok) {
        DDLogError(@"保存群数据到数据库失败!");
    }
    
    // !!!生成Group Icon
    for (JXGroup *group in self.groupsData) {
        [JXUIUtility createGroupAvatar:group finished:nil];
    }
}

- (JXUser *)getFriendInfoByUserID:(NSString *)userID
{
    if (userID == nil) {
        return nil;
    }
    for (JXUser *user in self.friendsData) {
        if ([user.userID isEqualToString:userID]) {
            return user;
        }
    }
    return nil;
}

- (JXGroup *)getGroupInfoByGroupID:(NSString *)groupID
{
    if (groupID == nil) {
        return nil;
    }
    for (JXGroup *group in self.groupsData) {
        if ([group.groupID isEqualToString:groupID]) {
            return group;
        }
    }
    return nil;
}

- (void)p_resetFriendData
{
    // 1、排序
    NSArray *serializeArray = [self.friendsData sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        int i;
        NSString *strA = ((JXUser *)obj1).pinyin;
        NSString *strB = ((JXUser *)obj2).pinyin;
        for (i = 0; i < strA.length && i < strB.length; i ++) {
            char a = toupper([strA characterAtIndex:i]);
            char b = toupper([strB characterAtIndex:i]);
            if (a > b) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            else if (a < b) {
                return (NSComparisonResult)NSOrderedAscending;
            }
        }
        if (strA.length > strB.length) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        else if (strA.length < strB.length){
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    // 2、分组
    NSMutableArray *ansData = [[NSMutableArray alloc] initWithObjects:self.defaultGroup, nil];
    NSMutableArray *ansSectionHeaders = [[NSMutableArray alloc] initWithObjects:UITableViewIndexSearch, nil];
    NSMutableDictionary *tagsDic = [[NSMutableDictionary alloc] init];
    char lastC = '1';
    JXUserGroup *curGroup;
    JXUserGroup *othGroup = [[JXUserGroup alloc] init];
    [othGroup setGroupName:@"#"];
    for (JXUser *user in serializeArray) {
        // 获取拼音失败
        if (user.pinyin == nil || user.pinyin.length == 0) {
            [othGroup addObject:user];
            continue;
        }
        
        char c = toupper([user.pinyin characterAtIndex:0]);
        if (!isalpha(c)) {      // #组
            [othGroup addObject:user];
        }
        else if (c != lastC){
            if (curGroup && curGroup.count > 0) {
                [ansData addObject:curGroup];
                [ansSectionHeaders addObject:curGroup.groupName];
            }
            lastC = c;
            curGroup = [[JXUserGroup alloc] init];
            [curGroup setGroupName:[NSString stringWithFormat:@"%c", c]];
            [curGroup addObject:user];
        }
        else {
            [curGroup addObject:user];
        }
        
        // TAGs
        if (user.detailInfo.tags.count > 0) {
            for (NSString *tag in user.detailInfo.tags) {
                JXUserGroup *group = [tagsDic objectForKey:tag];
                if (group == nil) {
                    group = [[JXUserGroup alloc] init];
                    group.groupName = tag;
                    [tagsDic setObject:group forKey:tag];
                    [self.tagsData addObject:group];
                }
                [group.users addObject:user];
            }
        }
    }
    if (curGroup && curGroup.count > 0) {
        [ansData addObject:curGroup];
        [ansSectionHeaders addObject:curGroup.groupName];
    }
    if (othGroup.count > 0) {
        [ansData addObject:othGroup];
        [ansSectionHeaders addObject:othGroup.groupName];
    }
    
    [self.data removeAllObjects];
    [self.data addObjectsFromArray:ansData];
    [self.sectionHeaders removeAllObjects];
    [self.sectionHeaders addObjectsFromArray:ansSectionHeaders];
    if (self.dataChangeBlock) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.dataChangeBlock(self.data, self.sectionHeaders, self.friendCount);
        });
    }
}


#pragma mark - Getter
- (JXUserGroup *)defaultGroup
{
    if (_defaultGroup == nil) {
        JXUser *item_new = [[JXUser alloc] init];
        item_new.userID = @"-1";
        item_new.avatarPath = @"friends_new";
        item_new.remarkName = @"新的朋友";
        JXUser *item_group = [[JXUser alloc] init];
        item_group.userID = @"-2";
        item_group.avatarPath = @"friends_group";
        item_group.remarkName = @"群聊";
        JXUser *item_tag = [[JXUser alloc] init];
        item_tag.userID = @"-3";
        item_tag.avatarPath = @"friends_tag";
        item_tag.remarkName = @"标签";
        JXUser *item_public = [[JXUser alloc] init];
        item_public.userID = @"-4";
        item_public.avatarPath = @"friends_public";
        item_public.remarkName = @"公共号";
        _defaultGroup = [[JXUserGroup alloc] initWithGroupName:nil users:[NSMutableArray arrayWithObjects:item_new, item_group, item_tag, item_public, nil]];
    }
    return _defaultGroup;
}

- (NSInteger)friendCount
{
    return self.friendsData.count;
}

- (JXDBFriendStore *)friendStore
{
    if (_friendStore == nil) {
        _friendStore = [[JXDBFriendStore alloc] init];
    }
    return _friendStore;
}

- (JXDBGroupStore *)groupStore
{
    if (_groupStore == nil) {
        _groupStore = [[JXDBGroupStore alloc] init];
    }
    return _groupStore;
}

@end
