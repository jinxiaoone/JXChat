//
//  JXTableViewCell.h
//  JXChat
//
//  Created by jinxiao on 9/5/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TLCellLineStyle) {
    TLCellLineStyleNone,
    TLCellLineStyleDefault,
    TLCellLineStyleFill,
};

@interface JXTableViewCell : UITableViewCell

/**
 *  左边距
 */
@property (nonatomic, assign) CGFloat leftSeparatorSpace;

/**
 *  右边距，默认0，要修改只能直接指定
 */
@property (nonatomic, assign) CGFloat rightSeparatorSpace;

@property (nonatomic, assign) TLCellLineStyle topLineStyle;
@property (nonatomic, assign) TLCellLineStyle bottomLineStyle;

@end
