//
//  JXUserHelper.h
//  JXChat
//
//  Created by jinxiao on 9/6/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JXUser.h"

@interface JXUserHelper : NSObject

@property (nonatomic, strong) JXUser *user;

@property (nonatomic, strong, readonly) NSString *userID;

+ (JXUserHelper *)shareHelper;

@end
