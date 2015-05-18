//
//  MainTableViewController.h
//  QMHex
//
//  Created by Lin on 15/5/9.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabelTextField.h"
@interface MainTableViewController : UITableViewController <UITextFieldDelegate>

//进制转换
@property (weak, nonatomic) IBOutlet LabelTextField *binTextField;

@property (weak, nonatomic) IBOutlet LabelTextField *octTextField;

@property (weak, nonatomic) IBOutlet LabelTextField *decTextField;

@property (weak, nonatomic) IBOutlet LabelTextField *hexTextField;

//原码转换
@property (weak, nonatomic) IBOutlet LabelTextField *currentTextField;
//@property (weak, nonatomic) IBOutlet LabelTextField *originalTextField;
//@property (weak, nonatomic) IBOutlet LabelTextField *counterTextField;
//@property (weak, nonatomic) IBOutlet LabelTextField *fillTextField;


@property (weak, nonatomic) IBOutlet UILabel *tureLabel;

@property (weak, nonatomic) IBOutlet UILabel *comLabel;

@property (weak, nonatomic) IBOutlet UILabel *onecomLabel;

@end
