//
//  LabelTextField.m
//  QMHex
//
//  Created by QiMENG on 15/5/14.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import "LabelTextField.h"

#import "KeyboardView.h"

@implementation LabelTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!_leftLabel) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70, self.frame.size.height)];
        label.backgroundColor = [UIColor clearColor];
        label.adjustsFontSizeToFitWidth = YES;
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = self.textColor;
        label.font = self.font;
        _leftLabel = label;
    }
    self.keyboardType = UIKeyboardTypeDefault;
    self.returnKeyType = UIReturnKeyDone;
    self.leftView = _leftLabel;
    self.leftViewMode = UITextFieldViewModeAlways;
    
    self.inputView = [[KeyboardView alloc]initWithTextField:self];
    
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
