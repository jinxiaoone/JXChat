//
//  JXUserGroup.m
//  JXChat
//
//  Created by jinxiao on 9/5/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXUserGroup.h"

@implementation JXUserGroup

- (id) initWithGroupName:(NSString *)groupName users:(NSMutableArray *)users
{
    if (self = [super init]) {
        self.groupName = groupName;
        self.users = users;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self.groupName = [decoder decodeObjectForKey:@"name"];
    self.users = [decoder decodeObjectForKey:@"users"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.groupName forKey:@"name"];
    [encoder encodeObject:self.users forKey:@"users"];
}

- (NSMutableArray *) users
{
    if (_users == nil) {
        _users = [[NSMutableArray alloc] init];
    }
    return _users;
}

- (NSInteger) count
{
    return self.users.count;
}

- (void)addObject:(id)anObject
{
    [self.users addObject:anObject];
}

- (id) objectAtIndex:(NSUInteger)index
{
    return [self.users objectAtIndex:index];
}

@end
