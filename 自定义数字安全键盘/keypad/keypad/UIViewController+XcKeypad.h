//
//  UIViewController+XcKeypad.h
//  keypad
//
//  Created by lecochao on 2017/7/3.
//  Copyright © 2017年 lecochao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XcNumberKeypad.h"
@interface UIViewController (XcKeypad)

- (void)createKeypadWith:(XcKeyboardType)type
          FirstResponder:(id)inputFR
                  change:(void (^)(NSString *str))block;

@end
