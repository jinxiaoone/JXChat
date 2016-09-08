//
//  JXGroup.m
//  JXChat
//
//  Created by jinxiao on 9/2/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXGroup.h"
#import "NSString+PinYin.h"

@implementation JXGroup

- (id)init
{
    if (self = [super init]) {
        [JXGroup mj_setupObjectClassInArray:^NSDictionary *{
            return @{ @"users" : @"TLUser" };
        }];
    }
    return self;
}

- (NSInteger)count
{
    return self.users.count;
}

- (void)addObject:(id)anObject
{
    [self.users addObject:anObject];
}

- (id)objectAtIndex:(NSUInteger)index
{
    return [self.users objectAtIndex:index];
}

- (JXUser *)memberByUserID:(NSString *)uid
{
    for (JXUser *user in self.users) {
        if ([user.userID isEqualToString:uid]) {
            return user;
        }
    }
    return nil;
}

- (NSString *)groupName
{
    if (_groupName == nil || _groupName.length == 0) {
        for (JXUser *user in self.users) {
            if (user.showName.length > 0) {
                if (_groupName == nil || _groupName.length <= 0) {
                    _groupName = user.showName;
                }
                else {
                    _groupName = [NSString stringWithFormat:@"%@,%@", _groupName, user.showName];
                }
            }
        }
    }
    return _groupName;
}

- (NSString *)myNikeName
{
    if (_myNikeName.length == 0) {
        _myNikeName = [JXUserHelper shareHelper].user.showName;
    }
    return _myNikeName;
}

- (NSString *)pinyin
{
    if (_pinyin == nil) {
        _pinyin = self.groupName.pinyin;
    }
    return _pinyin;
}

- (NSString *)pinyinInitial
{
    if (_pinyinInitial == nil) {
        _pinyinInitial = self.groupName.pinyinInitial;
    }
    return _pinyinInitial;
}

- (NSString *)groupAvatarPath
{
    if (_groupAvatarPath == nil) {
        _groupAvatarPath = [self.groupID stringByAppendingString:@".png"];
    }
    return _groupAvatarPath;
}

@end
