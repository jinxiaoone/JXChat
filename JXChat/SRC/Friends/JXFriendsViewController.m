//
//  JXFriendsViewController.m
//  JXChat
//
//  Created by jinxiao on 9/1/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXFriendsViewController.h"

#import "JXSearchController.h"

@interface JXFriendsViewController ()

@property (nonatomic, strong) UILabel *footerLabel;

@property (nonatomic, strong) JXFriendHelper *friendHelper;

@property (nonatomic, strong) JXSearchController *searchController;

@end

@implementation JXFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"通讯录";
    
    [self p_initUI];
    
    //初始化好友数据业务类
    self.friendHelper = [JXFriendHelper sharedFriendHelper];
    
    self.data = self.friendHelper.data;
    self.sectionHeaders = self.friendHelper.sectionHeaders;
    [self.footerLabel setText:[NSString stringWithFormat:@"%ld位联系人",(long)self.friendHelper.friendCount]];
}

- (void)p_initUI
{
//    [self.tableView setLayoutMargins:UIEdgeInsetsMake(0, 10, 0, 0)];
//    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 0)];
    [self.tableView setSeparatorColor:[UIColor colorGrayLine]];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView setSectionIndexColor:[UIColor colorBlackForNavBar]];
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    
    [self.tableView setTableFooterView:self.footerLabel];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_add_friend"] style:UIBarButtonItemStyleDone target:self action:@selector(addContect)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)addContect
{
    NSLog(@"-----");
}


- (JXSearchController *)searchController
{
    if (!_searchController) {
        _searchController = [[JXSearchController alloc]initWithSearchResultsController:self.searchVC];
        _searchController.searchResultsUpdater = self.searchVC;
        _searchController.searchBar.placeholder = @"搜索";
        _searchController.searchBar.delegate = self;
    }
    return _searchController;
}

- (JXFriendSearchViewController *)searchVC
{
    if (!_searchVC) {
        _searchVC = [[JXFriendSearchViewController alloc]init];
    }
    return _searchVC;
}

- (UILabel *)footerLabel
{
    if (!_footerLabel) {
        _footerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 50)];
        [_footerLabel setTextAlignment:NSTextAlignmentCenter
         ];
        [_footerLabel setFont:[UIFont systemFontOfSize:17]];
        [_footerLabel setTextColor:[UIColor grayColor]];
    }
    return _footerLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
