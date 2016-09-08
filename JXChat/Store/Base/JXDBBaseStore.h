//
//  JXDBBaseStore.h
//  JXChat
//
//  Created by jinxiao on 9/6/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JXDBManager.h"

@interface JXDBBaseStore : NSObject

/// 数据库操作队列(从TLDBManager中获取，默认使用commonQueue)
@property (nonatomic, strong) FMDatabaseQueue *dbQueue;

/**
 *  表创建
 */
- (BOOL)createTable:(NSString*)tableName withSQL:(NSString*)sqlString;

/*
 *  执行带数组参数的sql语句 (增，删，改)
 */
-(BOOL)excuteSQL:(NSString*)sqlString withArrParameter:(NSArray*)arrParameter;

/*
 *  执行带字典参数的sql语句 (增，删，改)
 */
-(BOOL)excuteSQL:(NSString*)sqlString withDicParameter:(NSDictionary*)dicParameter;

/*
 *  执行格式化的sql语句 (增，删，改)
 */
- (BOOL)excuteSQL:(NSString *)sqlString,...;

/**
 *  执行查询指令
 */
- (void)excuteQuerySQL:(NSString*)sqlStr resultBlock:(void(^)(FMResultSet * rsSet))resultBlock;

@end
