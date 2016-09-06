//
//  JXDBManager.h
//  JXChat
//
//  Created by jinxiao on 9/6/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>

@interface JXDBManager : NSObject

/**
 *  DB队列（除IM相关）
 */
@property (nonatomic, strong) FMDatabaseQueue *commonQueue;

/**
 *  与IM相关的DB队列
 */
@property (nonatomic, strong) FMDatabaseQueue *messageQueue;

+ (JXDBManager *)sharedInstance;

@end
