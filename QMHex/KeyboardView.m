//
//  KeyboardView.m
//  QMHex
//
//  Created by QiMENG on 15/5/14.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import "KeyboardView.h"
#import "UIImage+QM.h"

#define kKeyboardWidth [UIScreen mainScreen].bounds.size.width
const CGFloat kKeyboardHeight = 250.0f;

@implementation KeyboardView

- (instancetype)initWithTextField:(UITextField *)textField
{
    self = [super initWithFrame:CGRectMake(0.0f, 0.0f, kKeyboardWidth, kKeyboardHeight)];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        _buttonDic = [NSMutableDictionary dictionary];
        _textField = textField;
        
        [self createButtons];
        
        UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.5)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineView];
        
        
    }
    return self;
}

- (void)setType:(HexType)type {
    
    _type = type;
    NSArray * unables = @[];
    switch (_type) {
        case INT_ORI:
        {
            unables = @[@"A",@"B",@"C",@"D",@"E",@"F",
                        @"7",@"8",@"9",
                        @"4",@"5",@"6",//@"+/-",
                        @"2",@"3",@"."];
        }
            break;
        case INT_BIN:
        {
            unables = @[@"A",@"B",@"C",@"D",@"E",@"F",
                        @"7",@"8",@"9",
                        @"4",@"5",@"6",
                        @"2",@"3",];
        }
            break;
        case INT_OCT:
        {
            unables = @[@"A",@"B",@"C",@"D",@"E",@"F",
                        @"9",];
        }
            break;
        case INT_DEC:
        {
            unables = @[@"A",@"B",@"C",@"D",@"E",@"F"];
        }
            break;
        default:
            break;
    }
    
    for (NSString * key in unables) {
        ((UIButton *)_buttonDic[key]).enabled = NO;
    }
    
}

- (void)createButtons
{
    
    float buttonHeight = self.frame.size.height / 5.0f ;
    
    NSArray * letters = @[@"A",@"B",@"C",@"D",@"E",@"F"];
    float buttonWidth = self.frame.size.width / letters.count ;
    for (int index = 0 ;index < letters.count ; index++) {
        [self makeButtonFrame:CGRectMake(buttonWidth * index, 0, buttonWidth, buttonHeight)
                        title:letters[index]
                    imageName:nil];
    }

    NSArray * nums = @[@"7",@"8",@"9",@"CE",
                       @"4",@"5",@"6",@"DE",
                       @"1",@"2",@"3",@"+/-",
                       @"0",@" ",@".",@"=",];
    buttonWidth = self.frame.size.width / 4 ;
    for (int index = 0 ;index < nums.count ; index++) {
        
        if ([nums[index] isEqualToString:@" "]) {
            continue;
        }
        else if ([nums[index] isEqualToString:@"0"]) {
            [self makeButtonFrame:CGRectMake(index%4 * buttonWidth ,  index/4 * buttonHeight + buttonHeight, buttonWidth * 2, buttonHeight)
                            title:nums[index]
                        imageName:nil];
        }else {
            [self makeButtonFrame:CGRectMake(index%4 * buttonWidth ,  index/4 * buttonHeight + buttonHeight, buttonWidth, buttonHeight)
                            title:nums[index]
                        imageName:nil];
        }
    }
    
}

- (void)makeButtonFrame:(CGRect)aRect title:(NSString *)aTitle imageName:(NSString *)aImageName
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = aRect;
    CGFloat fontSize = 25.0f;
    
//    if (![[NSCharacterSet decimalDigitCharacterSet] isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:aTitle]]) {
//        fontSize = 20.0f;
//    }
    
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitle:aTitle forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    
    /**
     *  如果直接使用backgroundimage . 背景图片会遮住线条
     */
    [button setImage:[UIImage createImageWithColor:[UIColor whiteColor] withFrame:button.bounds] forState:UIControlStateNormal];
    [button setImage:[UIImage createImageWithColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0] withFrame:button.bounds] forState:UIControlStateDisabled];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0.5, 0.5, 0.5, 0.5)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -button.frame.size.width, 0, 0)];
    
    
    [button addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    [_buttonDic setObject:button forKey:aTitle];
    
    [self addSubview:button];
}

- (void)touchButton:(UIButton *)button
{
    
    NSString * keyText = button.titleLabel.text;
    
    if ([keyText isEqualToString:@"="]) {
        [_textField resignFirstResponder];
    }
    else if ([keyText isEqualToString:@"CE"]) {
        _textField.text = @"";
    }
    else if ([keyText isEqualToString:@"+/-"]) {
        if ([_textField.text hasPrefix:@"-"]) {
            _textField.text = [_textField.text substringFromIndex:1];
        }else {
            _textField.text = [NSString stringWithFormat:@"-%@",_textField.text];
        }
    }
    else if ([keyText isEqualToString:@"DE"]) {
        if (_textField.text.length > 0) {
            _textField.text = [_textField.text substringToIndex:_textField.text.length -1];
        }
    }
    else if ([keyText isEqualToString:@"."]) {
        if (_textField.text.length > 0) {
            _textField.text = [NSString stringWithFormat:@"%@%@",_textField.text, keyText];;
        }else {
            _textField.text = @"0.";
        }
    }
    else {
        _textField.text = [NSString stringWithFormat:@"%@%@",_textField.text, keyText];;
    }
    
    [self decimalPoint];
    
}
- (void)decimalPoint {
    
    if (_type == INT_ORI) {
        ((UIButton *)_buttonDic[@"."]).enabled = NO;
        return;
    }
    
    NSRange foundObj=[_textField.text rangeOfString:@"."];
    if(foundObj.location ==NSNotFound) {
        ((UIButton *)_buttonDic[@"."]).enabled = YES;
    }else {
        ((UIButton *)_buttonDic[@"."]).enabled = NO;
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    for (UIButton * button in [_buttonDic allValues]) {
        CGPathAddRect(path,NULL, button.frame);
    }

    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextAddPath(currentContext, path);
    [[UIColor clearColor] setFill];
    [[UIColor lightGrayColor] setStroke];
    CGContextSetLineWidth(currentContext,0.5f);
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    CGPathRelease(path);

}


@end
