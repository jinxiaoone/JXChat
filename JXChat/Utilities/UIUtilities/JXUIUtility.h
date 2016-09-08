//
//  JXUIUtility.h
//  JXChat
//
//  Created by jinxiao on 9/7/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JXGroup;
@interface JXUIUtility : NSObject

//+ (CGFloat)getTextHeightOfText:(NSString *)text
//                          font:(UIFont *)font
//                         width:(CGFloat)width;

//创建群组头像
+ (void)createGroupAvatar:(JXGroup *)group
                 finished:(void (^)(NSString *groupID))finished;

//+ (void)captureScreenshotFromView:(UIView *)view
//                             rect:(CGRect)rect
//                         finished:(void (^)(NSString *avatarPath))finished;

@end
