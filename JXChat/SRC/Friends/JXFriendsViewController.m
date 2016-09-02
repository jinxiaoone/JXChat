//
//  JXFriendsViewController.m
//  JXChat
//
//  Created by jinxiao on 9/1/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXFriendsViewController.h"

@interface JXFriendsViewController ()

@end

@implementation JXFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"通讯录";
    
    [self p_initUI];
    
}

- (void)p_initUI
{
//    [self.tableView setLayoutMargins:UIEdgeInsetsMake(0, 10, 0, 0)];
//    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 0)];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_add_friend"] style:UIBarButtonItemStyleDone target:self action:@selector(addContect)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)addContect
{
    NSLog(@"----");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
