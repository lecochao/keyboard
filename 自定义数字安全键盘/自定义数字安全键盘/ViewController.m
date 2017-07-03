//
//  ViewController.m
//  自定义数字安全键盘
//
//  Created by lecochao on 2017/7/1.
//  Copyright © 2017年 lecochao. All rights reserved.
//

#import "ViewController.h"
#import <UIViewController+XcKeypad.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"keypadSource" ofType:@"bundle"];
//    NSBundle *bundle = [NSBundle bundleWithPath:path];
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"keypad" bundle:bundle];
//    XcNumberKeypad *keypad = [sb instantiateViewControllerWithIdentifier:@"XcNumberKeypad"];
//    [self addChildViewController:keypad];
//    _txtField.inputView = keypad.view;
//    _txtField.inputAccessoryView.hidden = YES;
    [self createKeypadWith:XcKeyboardTypePadSafety FirstResponder:_txtField change:^(NSString *str) {
        _txtField.text = str;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
