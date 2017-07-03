//
//  XcNumberKeypad.m
//  keypad
//
//  Created by lecochao on 2017/7/1.
//  Copyright © 2017年 lecochao. All rights reserved.
//

#import "XcNumberKeypad.h"

@interface XcNumberKeypad ()
@property(nonatomic ,strong) NSArray *keys;
@property(nonatomic ,strong) NSString *txt;
@property (weak, nonatomic) IBOutlet UITextField *showTxt;
//@property(nonatomic ,strong) NSString *safetyTitle;
@property (weak, nonatomic) IBOutlet UIView *AccessoryView;
@end

@implementation XcNumberKeypad

- (void)viewDidLoad {
    [super viewDidLoad];
    _AccessoryView.layer.shadowColor = [UIColor lightGrayColor].CGColor; //shadowColor阴影颜色
    _AccessoryView.layer.shadowOffset = CGSizeMake(0.5f , 0.5f); //shadowOffset阴影偏移x，y向(上/下)偏移(-/+)2
    _AccessoryView.layer.shadowOpacity = 1.f;//阴影透明度，默认0
    _AccessoryView.layer.shadowRadius = 1.0f;//阴影半径
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _txt = @"";
    [self createKeypad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setType:(XcKeyboardType)type
{
    _type = type;
    if (_type == XcKeyboardTypePadSafety) {
        _showTxt.text = @"**<自定义安全键盘>**";
    }
    
}

- (void)createKeypad
{
    //默认键盘
    _keys = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    //随机键位
    if (_type == XcKeyboardTypePadSafety) {
        _keys = [self safetykeys];
    }
    for (int i=0; i<10; i++) {
        UIButton *btn = [self.view viewWithTag:100+i];
        [btn setTitle:_keys[i] forState:UIControlStateNormal];
    }
}

- (NSArray *)safetykeys
{
    NSMutableArray *mkeys = [NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    for (int i=0; i<10; i++) {
        NSInteger n = arc4random()%9;
        NSString *key = mkeys[n];
        [mkeys removeObjectAtIndex:n];
        [mkeys insertObject:key atIndex:0];
    }
    return mkeys;
}
- (IBAction)endAction:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)touchPadAction:(UIButton *)sender {
    
    NSString *key = sender.titleLabel.text;
    _txt = [_txt stringByAppendingString:key];
    if (_type != XcKeyboardTypePadSafety) {
        _showTxt.text = _txt;
    }
    if (_block) {
        _block(_txt);
    }
    
    NSLog(@"key__%@\n txt__%@",key,_txt);
}

- (IBAction)touchPointAction:(id)sender {
    
    _txt = [_txt stringByAppendingString:@"."];
    if (_type != XcKeyboardTypePadSafety) {
        _showTxt.text = _txt;
    }
    if (_block) {
        _block(_txt);
    }
    NSLog(@"txt__%@",_txt);
}
- (IBAction)deleteAction:(id)sender {
    
    if (_txt.length>0) {
        _txt = [_txt substringToIndex:_txt.length-1];
        if (_type != XcKeyboardTypePadSafety) {
            _showTxt.text = _txt;
        }
        if (_block) {
            _block(_txt);
        }
        NSLog(@" txt__%@",_txt);
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
