//
//  JXUserGroup.h
//  JXChat
//
//  Created by jinxiao on 9/5/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JXUser.h"

@interface JXUserGroup : NSObject

@property (nonatomic, strong) NSString *groupName;

@property (nonatomic, strong) NSMutableArray *users;

@property (nonatomic, assign, readonly) NSInteger count;

- (id) initWithGroupName:(NSString *)groupName users:(NSMutableArray *)users;

- (void)addObject:(id)anObject;

- (id)objectAtIndex:(NSUInteger)index;

@end
