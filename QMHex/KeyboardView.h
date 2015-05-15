//
//  KeyboardView.h
//  QMHex
//
//  Created by QiMENG on 15/5/14.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    INT_BIN,
    INT_OCT,
    INT_DEC,
    INT_HEX
}
HexType;


@interface KeyboardView : UIView {
    
    UITextField * _textField;
    NSMutableDictionary * _buttonDic;
    
}
@property (nonatomic, assign) HexType type;

- (instancetype)initWithTextField:(UITextField *)textField;

//判断小数点
- (void)decimalPoint;

@end
