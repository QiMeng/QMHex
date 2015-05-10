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


//原码的编码规律可概括为:正数的符号位用 0 表示,负数的符号位用 1 表示,数位 部分则和真值完全一样。
//反码又称为“对 1 的补数”,对于正数,反码和原码相同,对于负数,是将原码数位部分 按位求反。
//补码的表示:正数的补码与原码相同,负数的补码符号位为 1,数值位是将原码按位取 反后末位加 1。(以 8 位二进制数为基准进行表示)

/**
 *  二进制转换成原码
 */
+ (NSString *)OriginalFromBin;
/**
 *  原码转换成反码
 */
+ (NSString *)CounterFromBin;
/**
 *  原码转换成补码
 */
+ (NSString *)FillFromBin;




@end
