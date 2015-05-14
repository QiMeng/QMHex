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
    
    _binTextField.leftLabel.text = @"二进制:";
    _octTextField.leftLabel.text = @"八进制:";
    _decTextField.leftLabel.text = @"十进制:";
    _hexTextField.leftLabel.text = @"十六进制:";
    
    
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
    
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    
    if (_binTextField.editing) {
        [self changeTextField:_binTextField];
    }else if (_octTextField.editing){
        [self changeTextField:_octTextField];
    }else if (_decTextField.editing){
        [self changeTextField:_decTextField];
    }else if (_hexTextField.editing){
        [self changeTextField:_hexTextField];
    }
    
    
    
    
    NSLog(@"%s",__func__);
    [self.view endEditing:YES];
}

@end
