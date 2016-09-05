//
//  JXFirendHelper.h
//  JXChat
//
//  Created by jinxiao on 9/2/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JXUserGroup.h"
#import "JXGroup.h"

@interface JXFriendHelper : NSObject

/// 好友列表默认项
@property (nonatomic, strong) JXUserGroup *defaultGroup;


#pragma mark - # 好友

/// 朋友数据(原始数据)
@property (nonatomic, strong) NSMutableArray *friendsData;

/// 格式化的好友数据(列表用)
@property (nonatomic, strong) NSMutableArray *data;

/// 格式化好友数据分组标题
@property (nonatomic, strong) NSMutableArray *sectionHeaders;

/// 好友数量
@property (nonatomic, assign, readonly) NSInteger friendCount;

@property (nonatomic, copy) void(^dataChangeBlock)(NSMutableArray *friends, NSMutableArray *headers, NSInteger friendCount);

#pragma mark - group
/// group data
@property (nonatomic, strong) NSMutableArray *groupsData;

#pragma mark - label
/// label data
@property (nonatomic, strong) NSMutableArray *tagsData;


+ (JXFriendHelper *)sharedFriendHelper;

- (JXUser *)getFriendInfoByUserID:(NSString *)userID;

- (JXGroup *)getGroupInfoByGroupID:(NSString *)groupID;

@end
