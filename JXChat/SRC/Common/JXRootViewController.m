//
//  JXRootViewController.m
//  JXChat
//
//  Created by jinxiao on 9/1/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXRootViewController.h"

#import "JXDiscoverViewController.h"
#import "JXConversationViewController.h"
#import "JXFriendsViewController.h"
#import "JXMineViewController.h"

static JXRootViewController *rootVC = nil;

@interface JXRootViewController ()

@property (nonatomic, strong) JXDiscoverViewController *discoverVC;
@property (nonatomic, strong) JXConversationViewController *conversationVC;
@property (nonatomic, strong) JXFriendsViewController *friendVC;
@property (nonatomic, strong) JXMineViewController *mineVC;

@property (nonatomic, strong) NSArray *childArray;

@end



@implementation JXRootViewController

+ (JXRootViewController *) sharedRootViewController
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        rootVC = [[JXRootViewController alloc] init];
    });
    return rootVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Set childController
    [self setViewControllers:self.childArray];
}

- (id)childViewControllerAtIndex:(NSUInteger)index
{
    return [[self.childViewControllers objectAtIndex:index] rootViewController];
}

- (NSArray *)childArray
{
    if (!_childArray) {
        JXNavigationController *convNavC = [[JXNavigationController alloc]initWithRootViewController:self.conversationVC];
        JXNavigationController *friendNavC = [[JXNavigationController alloc]initWithRootViewController:self.friendVC];
        JXNavigationController *discoverNavC = [[JXNavigationController alloc]initWithRootViewController:self.discoverVC];
        JXNavigationController *mineNavC = [[JXNavigationController alloc]initWithRootViewController:self.mineVC];
        
        _childArray = @[convNavC, friendNavC, discoverNavC, mineNavC];
    }
    return _childArray;
}

- (JXConversationViewController *)conversationVC
{
    if (!_conversationVC) {
        _conversationVC = [[JXConversationViewController alloc]init];
        [_conversationVC.tabBarItem setTitle:@"消息"];
        [_conversationVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_mainframe"]];
        [_conversationVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    }
    return _conversationVC;
}

- (JXFriendsViewController *) friendVC
{
    if (_friendVC == nil) {
        _friendVC = [[JXFriendsViewController alloc] init];
        [_friendVC.tabBarItem setTitle:@"通讯录"];
        [_friendVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_contacts"]];
        [_friendVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
    }
    return _friendVC;
}

- (JXDiscoverViewController *) discoverVC
{
    if (_discoverVC == nil) {
        _discoverVC = [[JXDiscoverViewController alloc] init];
        [_discoverVC.tabBarItem setTitle:@"发现"];
        [_discoverVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_discover"]];
        [_discoverVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    }
    return _discoverVC;
}

- (JXMineViewController *) mineVC
{
    if (_mineVC == nil) {
        _mineVC = [[JXMineViewController alloc] init];
        [_mineVC.tabBarItem setTitle:@"我"];
        [_mineVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_me"]];
        [_mineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_meHL"]];
    }
    return _mineVC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
