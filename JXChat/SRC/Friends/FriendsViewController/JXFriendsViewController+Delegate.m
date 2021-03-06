//
//  JXFriendsViewController+Delegate.m
//  JXChat
//
//  Created by jinxiao on 9/5/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXFriendsViewController+Delegate.h"
#import "JXFriendHeaderView.h"
#import "JXFriendCell.h"

#import "JXNewFriendViewController.h"
#import "JXGroupViewController.h"
#import "JXTagsViewController.h"
#import "JXPublicServerViewController.h"

@implementation JXFriendsViewController (Delegate)

- (void)registerCellClass
{
    [self.tableView registerClass:[JXFriendHeaderView class] forCellReuseIdentifier:@"JXFriendHeaderView"];
    [self.tableView registerClass:[JXFriendCell class] forCellReuseIdentifier:@"JXFriendCell"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    JXUserGroup *group = [self.data objectAtIndex:section];
    return group.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
    JXUserGroup *group = [self.data objectAtIndex:section];
    JXFriendHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"JXFriendHeaderView"];
    [view setTitle:group.groupName];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JXFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@""];
    JXUserGroup *group = [self.data objectAtIndex:indexPath.section];
    JXUser *user = [group objectAtIndex:indexPath.row];
    [cell setUser:user];
    
    if (indexPath.section == self.data.count - 1 && indexPath.row == group.count - 1) {
         [cell setBottomLineStyle:TLCellLineStyleFill];
    } else {
        [cell setBottomLineStyle:indexPath.row == group.count - 1 ? TLCellLineStyleNone : TLCellLineStyleDefault];
    }
    return cell;
}

//拼音首字母检索
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.sectionHeaders;
}

// 检索时空出搜索框
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if (index == 0) {
        [self.tableView scrollRectToVisible:CGRectMake(0, 0, tableView.width, tableView.height) animated:NO];
        return -1;
    }
    return index;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHT_FRIEND_CELL;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return HEIGHT_SCREEN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JXUser *user = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if (indexPath.section == 0) {
        if ([user.userID isEqualToString:@"-1"]) {
            JXNewFriendViewController *newFriendVC = [[JXNewFriendViewController alloc] init];
            [self setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:newFriendVC animated:YES];
            [self setHidesBottomBarWhenPushed:NO];
        }
        else if ([user.userID isEqualToString:@"-2"]) {
            JXGroupViewController *groupVC = [[JXGroupViewController alloc] init];
            [self setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:groupVC animated:YES];
            [self setHidesBottomBarWhenPushed:NO];
        }
        else if ([user.userID isEqualToString:@"-3"]) {
            JXTagsViewController *tagsVC = [[JXTagsViewController alloc] init];
            [self setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:tagsVC animated:YES];
            [self setHidesBottomBarWhenPushed:NO];
        }
        else if ([user.userID isEqualToString:@"-4"]) {
            JXPublicServerViewController *publicServer = [[JXPublicServerViewController alloc] init];
            [self setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:publicServer animated:YES];
            [self setHidesBottomBarWhenPushed:NO];
        }
    }
    else {
        
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



#pragma mark - UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    
}


@end
