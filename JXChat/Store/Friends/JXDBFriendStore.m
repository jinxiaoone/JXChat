//
//  JXDBFriendStore.m
//  JXChat
//
//  Created by jinxiao on 9/6/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXDBFriendStore.h"
#import "JXDBFriendSQL.h"
#import "JXDBManager.h"

@implementation JXDBFriendStore

- (id)init
{
    if (self = [super init]) {
        self.dbQueue = [JXDBManager sharedInstance].commonQueue;
        BOOL ok = [self createTable];
        if (!ok) {
            DDLogError(@"DB: 好友表创建失败");
        }
    }
    return self;
}

- (BOOL)createTable
{
    NSString *sqlString = [NSString stringWithFormat:SQL_CREATE_FRIENDS_TABLE, FRIENDS_TABLE_NAME];
    return [self createTable:FRIENDS_TABLE_NAME withSQL:sqlString];
}


- (BOOL)updateFriendsData:(NSArray *)friendData
                   forUid:(NSString *)uid
{
    NSArray *oldData = [self friendsDataByUid:uid];
    if (oldData.count > 0) {
        // 建立新数据的hash表，用于删除数据库中的过时数据
        NSMutableDictionary *newDataHash = [[NSMutableDictionary alloc] init];
        for (JXUser *user in friendData) {
            [newDataHash setValue:@"YES" forKey:user.userID];
        }
        for (JXUser *user in oldData) {
            if ([newDataHash objectForKey:user.userID] == nil) {
                BOOL ok = [self deleteFriendByFid:user.userID forUid:uid];
                if (!ok) {
                    DDLogError(@"DBError: 删除过期好友失败");
                }
            }
        }
    }
    
    for (JXUser *user in friendData) {
        BOOL ok = [self addFriend:user forUid:uid];
        if (!ok) {
            return ok;
        }
    }
    
    return YES;
}

- (BOOL)addFriend:(JXUser *)user forUid:(NSString *)uid
{
    NSString *sqlString = [NSString stringWithFormat:SQL_UPDATE_FRIEND, FRIENDS_TABLE_NAME];
    NSArray *arrPara = [NSArray arrayWithObjects:
                        JXNoNilString(uid),
                        JXNoNilString(user.userID),
                        JXNoNilString(user.username),
                        JXNoNilString(user.nikeName),
                        JXNoNilString(user.avatarURL),
                        JXNoNilString(user.remarkName),
                        @"", @"", @"", @"", @"", nil];
    BOOL ok = [self excuteSQL:sqlString withArrParameter:arrPara];
    return ok;
}

- (NSMutableArray *)friendsDataByUid:(NSString *)uid
{
    __block NSMutableArray *data = [[NSMutableArray alloc] init];
    NSString *sqlString = [NSString stringWithFormat:SQL_SELECT_FRIENDS, FRIENDS_TABLE_NAME, uid];
    
    [self excuteQuerySQL:sqlString resultBlock:^(FMResultSet *retSet) {
        while ([retSet next]) {
            JXUser *user = [[JXUser alloc] init];
            user.userID = [retSet stringForColumn:@"uid"];
            user.username = [retSet stringForColumn:@"username"];
            user.nikeName = [retSet stringForColumn:@"nikename"];
            user.avatarURL = [retSet stringForColumn:@"avatar"];
            user.remarkName = [retSet stringForColumn:@"remark"];
            [data addObject:user];
        }
        [retSet close];
    }];
    
    return data;
}

- (BOOL)deleteFriendByFid:(NSString *)fid forUid:(NSString *)uid
{
    NSString *sqlString = [NSString stringWithFormat:SQL_DELETE_FRIEND, FRIENDS_TABLE_NAME, uid, fid];
    BOOL ok = [self excuteSQL:sqlString, nil];
    return ok;
}

@end
