//
//  JXUser.h
//  JXChat
//
//  Created by jinxiao on 9/2/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import "JXBaseDataModel.h"

@interface JXUser : JXBaseDataModel

/// 用户ID
@property (nonatomic, strong) NSString *userID;

/// 用户名
@property (nonatomic, strong) NSString *username;

/// 昵称
@property (nonatomic, strong) NSString *nikeName;

/// 头像URL
@property (nonatomic, strong) NSString *avatarURL;

/// 头像Path
@property (nonatomic, strong) NSString *avatarPath;

/// 备注名
@property (nonatomic, strong) NSString *remarkName;

/// 界面显示名称
@property (nonatomic, strong, readonly) NSString *showName;


#pragma mark - 列表用
/**
 *  拼音
 *
 *  来源：备注 > 昵称 > 用户名
 */
@property (nonatomic, strong) NSString *pinyin;

@property (nonatomic, strong) NSString *pinyinInitial;

@end
