//
//  XcNumberKeypad.h
//  keypad
//
//  Created by lecochao on 2017/7/1.
//  Copyright © 2017年 lecochao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XcKeyboardType) {
    XcKeyboardTypePadDefault,//默认数字键盘
    XcKeyboardTypePadSafety,//位置变化安全键盘
};

@interface XcNumberKeypad : UIViewController
@property(nonatomic,assign) XcKeyboardType type;
typedef void(^XchangeBlock)(NSString *str);
@property (strong,nonatomic) XchangeBlock block;
@end
