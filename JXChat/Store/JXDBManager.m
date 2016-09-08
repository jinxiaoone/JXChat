//
//  JXDBManager.m
//  JXChat
//
//  Created by jinxiao on 9/6/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXDBManager.h"

static JXDBManager *manager;

@implementation JXDBManager

+ (JXDBManager *)sharedInstance
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        NSString *userID = [JXUserHelper shareHelper].userID;
        manager = [[JXDBManager alloc]initWithUserID:userID];
    });
    return manager;
}

- (id)initWithUserID:(NSString *)userID
{
    if (self = [super init]) {
        NSString *commonQueuePath = [NSFileManager pathDBCommon];
        self.commonQueue = [FMDatabaseQueue databaseQueueWithPath:commonQueuePath];
        NSString *menageQueuePath = [NSFileManager pathDBMessage];
        self.messageQueue = [FMDatabaseQueue databaseQueueWithPath:menageQueuePath];
    }
    return self;
}

- (id)init
{
    DDLogError(@"TLDBManager：请使用 initWithUserID: 方法初始化");
    return nil;
}


@end
