//
//  JXAppDelegate.m
//  JXChat
//
//  Created by jinxiao on 9/1/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXAppDelegate.h"
#import "JXRootViewController.h"



@implementation JXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    [self initUI];        //configUI
    
    return YES;
}

- (void)initUI
{
    JXRootViewController *rootVC = [JXRootViewController sharedRootViewController];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"application will resign active");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"application did enter background");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"application will enter foreground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"application did become active");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"application will terminate");
}

@end
