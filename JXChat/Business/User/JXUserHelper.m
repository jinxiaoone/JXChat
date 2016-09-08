//
//  JXUserHelper.m
//  JXChat
//
//  Created by jinxiao on 9/6/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXUserHelper.h"

static JXUserHelper *helper;

@implementation JXUserHelper

+ (JXUserHelper *)shareHelper
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        helper = [[JXUserHelper alloc] init];
    });
    return helper;
}

- (NSString *)userID
{
    return self.user.userID;
}

- (id) init
{
    if (self = [super init]) {
        self.user = [[JXUser alloc] init];
        self.user.userID = @"1000";
        self.user.avatarURL = @"http://p1.qq181.com/cms/120506/2012050623111097826.jpg";
        self.user.nikeName = @"金世玉";
        self.user.username = @"li-bokun";
        self.user.detailInfo.qqNumber = @"1159197873";
        self.user.detailInfo.email = @"libokun@126.com";
        self.user.detailInfo.location = @"上海 闵行";
        self.user.detailInfo.sex = @"男";
        self.user.detailInfo.motto = @"Hello world!";
        self.user.detailInfo.momentsWallURL = @"http://www.jszhongzhu.com/img/aHR0cDovL2ltZy5wY29ubGluZS5jb20uY24vaW1hZ2VzL3VwbG9hZC91cGMvdHgvd2FsbHBhcGVyLzEzMDEvMDgvYzEvMTcyMjg4OThfMTM1NzYyNzQ2MDEwNl84MDB4NjAwLmpwZw==.jpg";
    }
    return self;
}


@end
