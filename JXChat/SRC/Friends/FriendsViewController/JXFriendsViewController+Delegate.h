//
//  JXFriendsViewController+Delegate.h
//  JXChat
//
//  Created by jinxiao on 9/5/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXFriendsViewController.h"

#define     HEIGHT_FRIEND_CELL      54.0f
#define     HEIGHT_HEADER           22.0f

@interface JXFriendsViewController (Delegate)<UISearchBarDelegate>

- (void)registerCellClass;

@end
