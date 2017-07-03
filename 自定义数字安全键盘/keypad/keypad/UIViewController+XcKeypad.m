//
//  UIViewController+XcKeypad.m
//  keypad
//
//  Created by lecochao on 2017/7/3.
//  Copyright © 2017年 lecochao. All rights reserved.
//

#import "UIViewController+XcKeypad.h"

@implementation UIViewController (XcKeypad)

- (void)createKeypadWith:(XcKeyboardType)type
          FirstResponder:(id)inputFR
                  change:(void (^)(NSString *str))block
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"keypadSource" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"keypad" bundle:bundle];
    XcNumberKeypad *keypad = [sb instantiateViewControllerWithIdentifier:@"XcNumberKeypad"];
    if (![inputFR isKindOfClass:[UITextField class]]) {
        [self addChildViewController:keypad];
        UITextField *txt = (UITextField*)inputFR;
        txt.inputView = keypad.view;
        txt.inputAccessoryView.hidden = YES;
    }else if (![inputFR isKindOfClass:[UITextView class]]) {
        [self addChildViewController:keypad];
        UITextField *txt = (UITextField*)inputFR;
        txt.inputView = keypad.view;
        txt.inputAccessoryView.hidden = YES;
    }else{
        return;
    }
    keypad.type = type;
    keypad.block = ^(NSString *str) {
        if (block) {
            block(str);
        }
    };
}

@end
