//
//  JXDBFriendStore.h
//  JXChat
//
//  Created by jinxiao on 9/6/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXDBBaseStore.h"

@interface JXDBFriendStore : JXDBBaseStore

- (BOOL)updateFriendsData:(NSArray *)friendData
                   forUid:(NSString *)uid;

- (BOOL)addFriend:(JXUser *)user forUid:(NSString *)uid;

- (NSMutableArray *)friendsDataByUid:(NSString *)uid;

- (BOOL)deleteFriendByFid:(NSString *)fid forUid:(NSString *)uid;

@end
