//
//  JXRootViewController.h
//  JXChat
//
//  Created by jinxiao on 9/1/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXTabBarController.h"

@interface JXRootViewController : JXTabBarController

+ (JXRootViewController *) sharedRootViewController;

/**
 *  获取tabbarController的第Index个VC（不是navController）
 *
 *  @return navController的rootVC
 */
- (id)childViewControllerAtIndex:(NSUInteger)index;

@end
