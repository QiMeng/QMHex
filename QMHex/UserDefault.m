//
//  UserDefault.m
//  QMHex
//
//  Created by Lin on 15/5/16.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import "UserDefault.h"

@implementation UserDefault

+ (UserDefault *)shareInstance {
    static UserDefault *__singletion;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        __singletion=[[self alloc] init];
        
    });
    return __singletion;
}

- (void)setDigit:(NSInteger)digit {
    
    
    
}
- (NSInteger)digit {
    return 8;//self.digit;
}


@end
