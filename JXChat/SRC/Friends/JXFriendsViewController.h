//
//  JXFriendsViewController.h
//  JXChat
//
//  Created by jinxiao on 9/1/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXTableViewController.h"
#import "JXFriendSearchViewController.h"

@interface JXFriendsViewController : JXTableViewController

@property (nonatomic, weak) NSMutableArray *data;

@property (nonatomic, weak) NSMutableArray *sectionHeaders;

@property (nonatomic, strong) JXFriendSearchViewController *searchVC;

@end
