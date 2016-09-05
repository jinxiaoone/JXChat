//
//  JXFriendCell.h
//  JXChat
//
//  Created by jinxiao on 9/5/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXTableViewCell.h"
#import "JXUser.h"

@interface JXFriendCell : JXTableViewCell

//用户信息
@property (nonatomic, strong) JXUser *user;

@end
