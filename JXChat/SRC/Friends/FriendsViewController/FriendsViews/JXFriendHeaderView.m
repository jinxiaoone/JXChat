//
//  JXFriendHeaderView.m
//  JXChat
//
//  Created by jinxiao on 9/5/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXFriendHeaderView.h"

@interface JXFriendHeaderView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation JXFriendHeaderView

- (void) setTitle:(NSString *)title
{
    _title = title;
    [_titleLabel setText:title];
}

@end
