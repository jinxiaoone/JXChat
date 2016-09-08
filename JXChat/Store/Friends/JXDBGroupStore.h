//
//  JXDBGroupStore.h
//  JXChat
//
//  Created by jinxiao on 9/7/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXDBBaseStore.h"

@interface JXDBGroupStore : JXDBBaseStore

- (BOOL)updateGroupsData:(NSArray *)groupData
                  forUid:(NSString *)uid;

- (BOOL)addGroup:(JXGroup *)group forUid:(NSString *)uid;


- (NSMutableArray *)groupsDataByUid:(NSString *)uid;

- (BOOL)deleteGroupByGid:(NSString *)gid forUid:(NSString *)uid;

@end
