//
//  UserDefault.h
//  QMHex
//
//  Created by Lin on 15/5/16.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import <Foundation/Foundation.h>

#define GUserDefault [UserDefault shareInstance]

@interface UserDefault : NSObject


+ (UserDefault *)shareInstance;

/**
 *  原码设置位数
 */
@property (nonatomic, assign) NSInteger digit;

@end
