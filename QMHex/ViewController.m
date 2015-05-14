//
//  ViewController.m
//  QMHex
//
//  Created by QiMENG on 15/5/5.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import "ViewController.h"
#import "Common.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    float a = -100.001;
    NSString * str = [NSString stringWithFormat:@"%f",a];
    
    NSLog(@"str : %@",str);
    
    
    
    
//    NSLog(@"十进制转二进制");
    NSLog(@"76 : %@",[Common BinFromDec:@"76"]);
//    NSLog(@"54.369 : %@",[Common BinFromDec:@"54.369"]);
//    NSLog(@"0.954 : %@",[Common BinFromDec:@"0.954"]);
//    NSLog(@"54 : %@",[Common BinFromDec:@"54"]);
//    
//    
//    NSLog(@"二进制转十进制");
//    NSLog(@"101000 : %@",[Common DecFromBin:@"101000"]);
//    NSLog(@"11001.01 : %@",[Common DecFromBin:@"11001.01"]);
//    NSLog(@"0.10011 : %@",[Common DecFromBin:@"0.10011"]);
//    NSLog(@"101.11 : %@",[Common DecFromBin:@"101.11"]);
    
//    NSLog(@"二进制转八进制");
//    NSLog(@"1010001101 : %@",[Common OctFromBin:@"1010001101"]);
//    NSLog(@"110110001.11001 : %@",[Common OctFromBin:@"110110001.11001"]);
//    NSLog(@"0.11100011 : %@",[Common OctFromBin:@"0.11100011"]);
//    NSLog(@"1001101.110011 : %@",[Common OctFromBin:@"1001101.110011"]);
//    
//    NSLog(@"二进制转十六进制");
//    NSLog(@"1010001101 : %@",[Common HexFromBin:@"1010001101"]);
//    NSLog(@"110110001.11001 : %@",[Common HexFromBin:@"110110001.11001"]);
//    NSLog(@"0.11100011 : %@",[Common HexFromBin:@"0.11100011"]);
//    NSLog(@"1001101.110011 : %@",[Common HexFromBin:@"1001101.110011"]);
    
    NSLog(@"十六进制转十进制");
    NSLog(@"4E8.3 : (%@)2  (%@)8  (%@)16",
          [Common BinFromHex:@"4E8.3"],
          [Common OctFromHex:@"4E8.3"],
          [Common DecFromHex:@"4E8.3"]);
    
    NSLog(@"AB4.0C1 : (%@)2  (%@)8  (%@)16",
          [Common BinFromHex:@"AB4.0C1"],
          [Common OctFromHex:@"AB4.0C1"],
          [Common DecFromHex:@"AB4.0C1"]);
    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
