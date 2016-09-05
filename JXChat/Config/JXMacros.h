//
//  JXMacros.h
//  JXChat
//
//  Created by jinxiao on 9/1/16.
//  Copyright © 2016 NO1. All rights reserved.
//

#ifndef JXMacros_h
#define JXMacros_h

#define    SIZE_SCREEN   [UIScreen mainScreen].bounds.size
#define    WIDTH_SCREEN  [UIScreen mainScreen].bounds.size.width
#define    HEIGHT_SCREEN [UIScreen mainScreen].bounds.size.height


#define    BORDER_WIDTH_1PX  ([[UIScreen mainScreen] scale] > 0.0 ? 1.0 / [[UIScreen mainScreen] scale] : 1.0)





#define  JXColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]


#endif /* JXMacros_h */
