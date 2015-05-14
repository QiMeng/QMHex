//
//  LabelTextField.m
//  QMHex
//
//  Created by QiMENG on 15/5/14.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import "LabelTextField.h"

@implementation LabelTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!_leftLabel) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, self.frame.size.height)];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        _leftLabel = label;
    }
    self.keyboardType = UIKeyboardTypeDefault;
    self.returnKeyType = UIReturnKeyDone;
    self.leftView = _leftLabel;
    self.leftViewMode = UITextFieldViewModeAlways;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
