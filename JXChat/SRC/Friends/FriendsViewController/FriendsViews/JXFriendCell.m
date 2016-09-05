//
//  JXFriendCell.m
//  JXChat
//
//  Created by jinxiao on 9/5/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXFriendCell.h"

#define     FRIENDS_SPACE_X         10.0f
#define     FRIENDS_SPACE_Y         9.0f

@interface JXFriendCell()

@property (nonatomic, strong) UIImageView *avatarImageView;

@property (nonatomic, strong) UILabel *usernameLabel;

@property (nonatomic, strong) UILabel *subTitleLabel;

@end


@implementation JXFriendCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.leftSeparatorSpace = FRIENDS_SPACE_X;
        
        [self.contentView addSubview:self.avatarImageView];
        [self.contentView addSubview:self.usernameLabel];
        [self.contentView addSubview:self.subTitleLabel];
        
        [self p_addMasonry];
    }
    return self;
}


- (void)setUser:(JXUser *)user
{
    
}


- (void)p_addMasonry
{
    
}

#pragma mark - Getter
- (UIImageView *)avatarImageView
{
    if (_avatarImageView == nil) {
        _avatarImageView = [[UIImageView alloc] init];
    }
    return _avatarImageView;
}

- (UILabel *)usernameLabel
{
    if (_usernameLabel == nil) {
        _usernameLabel = [[UILabel alloc] init];
        [_usernameLabel setFont:[UIFont systemFontOfSize:17.0f]];
    }
    return _usernameLabel;
}

- (UILabel *)subTitleLabel
{
    if (_subTitleLabel == nil) {
        _subTitleLabel = [[UILabel alloc] init];
        [_subTitleLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [_subTitleLabel setTextColor:[UIColor grayColor]];
        [_subTitleLabel setHidden:YES];
    }
    return _subTitleLabel;
}

@end
