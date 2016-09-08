//
//  JXUserChatSetting.h
//  JXChat
//
//  Created by jinxiao on 9/5/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXUserChatSetting : NSObject

@property (nonatomic, strong) NSString *userID;

@property (nonatomic, assign) BOOL top;

@property (nonatomic, assign) BOOL noDisturb;

@property (nonatomic, strong) NSString *chatBGPath;

@end
