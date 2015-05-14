//
//  MainTableViewController.m
//  QMHex
//
//  Created by Lin on 15/5/9.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import "MainTableViewController.h"
#import "Common.h"
@implementation MainTableViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _binTextField.leftLabel.text = @"二进：";
    _octTextField.leftLabel.text = @"八进：";
    _decTextField.leftLabel.text = @"十进：";
    _hexTextField.leftLabel.text = @"16进：";
    _originalTextField.leftLabel.text = @"原码：";
    _counterTextField.leftLabel.text = @"反码：";
    _fillTextField.leftLabel.text = @"补码：";
    
    
    float a = -100.001;
    NSString * str = [NSString stringWithFormat:@"%g",a];
    
    NSLog(@"str : %@",str);
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 30;
    }
    
    return 20;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self changeTextField:textField];
    [self.view endEditing:YES];
    return YES;
}

- (void)changeTextField:(UITextField *)textField {
    if (textField == _binTextField) {
        _octTextField.text = [Common OctFromBin:textField.text];
        _decTextField.text = [Common DecFromBin:textField.text];
        _hexTextField.text = [Common HexFromBin:textField.text];
    }
    else if (textField == _octTextField){
        _binTextField.text = [Common BinFromOct:textField.text];
        _decTextField.text = [Common DecFromOct:textField.text];
        _hexTextField.text = [Common HexFromOct:textField.text];
    }
    else if (textField == _decTextField){
        _binTextField.text = [Common BinFromDec:textField.text];
        _octTextField.text = [Common OctFromDec:textField.text];
        _hexTextField.text = [Common HexFromDec:textField.text];
    }
    else if (textField == _hexTextField){
        _binTextField.text = [Common BinFromHex:textField.text];
        _octTextField.text = [Common OctFromHex:textField.text];
        _decTextField.text = [Common DecFromHex:textField.text];
    }
    
    _originalTextField.text = [Common OriginalFromBin:_binTextField.text];
    _counterTextField.text = [Common CounterFromBin:_binTextField.text];
    _fillTextField.text = [Common FillFromBin:_binTextField.text];
    
}
//- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
//    
//    if (_binTextField.editing) {
//        [self changeTextField:_binTextField];
//    }else if (_octTextField.editing){
//        [self changeTextField:_octTextField];
//    }else if (_decTextField.editing){
//        [self changeTextField:_decTextField];
//    }else if (_hexTextField.editing){
//        [self changeTextField:_hexTextField];
//    }
//    
//    [self.view endEditing:YES];
//}

@end
