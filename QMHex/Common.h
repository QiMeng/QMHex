//
//  Common.h
//  QMHex
//
//  Created by QiMENG on 15/5/5.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject


/**
 *  二进制转换成十进制
 */
+ (NSString *)DecFromBin:(NSString *)aBin;

/**
 *  二进制转换成八进制
 */
+ (NSString *)OctFromBin:(NSString *)aBin;

/**
 *  二进制转换成十六进制
 */
+ (NSString *)HexFromBin:(NSString *)aBin;

/**
 *  八进制转二进制
 */
+ (NSString *)BinFromOct:(NSString *)aOct;

/**
 *  八进制转十进制
 */
+ (NSString *)DecFromOct:(NSString *)aOct;

/**
 *  八进制转十六进制
 */
+ (NSString *)HexFromOct:(NSString *)aOct;

/**
 *  十进制转二进制
 */
+ (NSString *)BinFromDec:(NSString *)aDec;

/**
 *  十进制转八进制
 */
+ (NSString *)OctFromDec:(NSString *)aDec;

/**
 *  十进制转十六进制
 */
+ (NSString *)HexFromDec:(NSString *)aDec;

/**
 *  十六进制转十进制
 */
+ (NSString *)DecFromHex:(NSString *)aHex;

/**
 *  十六进制转二进制
 */
+ (NSString *)BinFromHex:(NSString *)aHex;

/**
 *  十六进制转八进制
 */
+ (NSString *)OctFromHex:(NSString *)aHex;


@end
