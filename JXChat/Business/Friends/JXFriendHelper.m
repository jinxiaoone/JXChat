//
//  JXFirendHelper.m
//  JXChat
//
//  Created by jinxiao on 9/2/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXFriendHelper.h"

static JXFriendHelper *friendHelper = nil;

@interface JXFriendHelper()


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
        
        
        
    }
    return self;
}

//- (JXUser *)getFriendInfoByUserID:(NSString *)userID
//{
//    
//}
//
//- (JXGroup *)getGroupInfoByGroupID:(NSString *)groupID
//{
//    
//}


@end
