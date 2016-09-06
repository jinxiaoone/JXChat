//
//  JXUser.m
//  JXChat
//
//  Created by jinxiao on 9/2/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXUser.h"
#import "NSString+PinYin.h"

@implementation JXUser

- (id)init
{
    if (self = [super init]) {
        [JXUser mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"detailInfo" : @"JXUserDetail",
                     @"userSetting" : @"JXUserSetting",
                     @"chatSetting" : @"JXUserChatSetting"};
        }];
    }
    return self;
}

- (void)setUsername:(NSString *)username
{
    if ([username isEqualToString:_username]) {
        return;
    }
    _username = username;
    if (self.remarkName.length == 0 && self.nikeName == 0 && self.username > 0) {
        self.pinyin = username.pinyin;
        self.pinyinInitial = username.pinyinInitial;
    }
}

- (void)setNikeName:(NSString *)nikeName
{
    if ([nikeName isEqualToString:_nikeName]) {
        return;
    }
    _nikeName = nikeName;
    if (self.remarkName.length == 0 && self.nikeName.length > 0) {
        self.pinyin = nikeName.pinyin;
        self.pinyinInitial = nikeName.pinyinInitial;
    }
}

- (void)setRemarkName:(NSString *)remarkName
{
    if ([remarkName isEqualToString:_remarkName]) {
        return;
    }
    _remarkName = remarkName;
    if (_remarkName.length > 0) {
        self.pinyin = remarkName.pinyin;
        self.pinyinInitial = remarkName.pinyinInitial;
    }
}

#pragma mark - Getter
- (NSString *)showName
{
    return self.remarkName.length > 0 ? self.remarkName : (self.nikeName.length > 0 ? self.nikeName : self.username);
}

- (JXUserDetail *)detailInfo
{
    if (_detailInfo == nil) {
        _detailInfo = [[JXUserDetail alloc] init];
    }
    return _detailInfo;
}



@end
