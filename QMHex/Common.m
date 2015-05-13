//
//  Common.m
//  QMHex
//
//  Created by QiMENG on 15/5/5.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import "Common.h"

@implementation Common

#pragma mark - 二进制转
//二进制转换成十进制
+ (NSString *)DecFromBin:(NSString *)aBin {
    
    NSString * strBin = @"";
    NSArray * arr = [aBin componentsSeparatedByString:@"."];
    
    //整数部分
    {
        NSString * strInt = arr[0];
        int intDec = 0;
        int tempDec = 0;
        for (int i = 0; i < strInt.length; i++) {
            tempDec = [[strInt substringWithRange:NSMakeRange(i,1)] intValue];
            intDec =  intDec + tempDec * pow(2, strInt.length - 1 - i);
        }
        strBin = [NSString stringWithFormat:@"%d",intDec];
    }
    //小数部分
    if (arr.count == 2) {
        NSString * strDec = arr[1];
        int tempDec = 0;
        double douDec = 0.0;
        for (int i = 0; i < strDec.length; i++) {
            tempDec = [[strDec substringWithRange:NSMakeRange(i,1)] intValue];
            
            douDec = douDec + tempDec * pow(2, -i-1);
            
        }
        strBin = [NSString stringWithFormat:@"%g",strBin.doubleValue+ douDec];
    }
    return strBin;
}
//二进制转换成八进制
+ (NSString *)OctFromBin:(NSString *)aBin {
    
    NSString * strBin = @"";
    NSArray * arr = [aBin componentsSeparatedByString:@"."];
    //整数部分
    {
        NSString * strInt = arr[0];
        if (strInt.length%3 == 1) {
            strInt = [NSString stringWithFormat:@"00%@",strInt];
        }else if (strInt.length%3 == 2) {
            strInt = [NSString stringWithFormat:@"0%@",strInt];
        }
        
        for (int i=0; i < strInt.length; i+=3) {
            NSString * tempStr = [strInt substringWithRange:NSMakeRange(i,3)];
            int bit = 0;
            for (int j=0; j<tempStr.length; j++) {
                int a = [[tempStr substringWithRange:NSMakeRange(j,1)] intValue];
                bit = bit + a * pow(2, 2-j);
            }
            strBin = [NSString stringWithFormat:@"%@%d",strBin,bit];
        }
    }
    //小数部分
    if (arr.count == 2) {
        NSString * strDec = arr[1];
        if (strDec.length%3 == 1) {
            strDec = [NSString stringWithFormat:@"%@00",strDec];
        }else if (strDec.length%3 == 2) {
            strDec = [NSString stringWithFormat:@"%@0",strDec];
        }
        NSString * tempDec = @"";
        for (int i=0; i < strDec.length; i+=3) {
            NSString * tempStr = [strDec substringWithRange:NSMakeRange(i,3)];
            int bit = 0;
            for (int j=0; j<tempStr.length; j++) {
                int a = [[tempStr substringWithRange:NSMakeRange(j,1)] intValue];
                bit = bit + a * pow(2, 2-j);
            }
            tempDec = [NSString stringWithFormat:@"%@%d",tempDec,bit];
        }
        strBin = [NSString stringWithFormat:@"%@.%@",strBin,tempDec];
    }
    return strBin;
}
//二进制转换成十六进制
+ (NSString *)HexFromBin:(NSString *)aBin {
    NSString * strBin = @"";
    NSArray * arr = [aBin componentsSeparatedByString:@"."];
    //整数部分
    {
        NSString * strInt = arr[0];
        if (strInt.length%4 == 1) {
            strInt = [NSString stringWithFormat:@"000%@",strInt];
        }else if (strInt.length%4 == 2) {
            strInt = [NSString stringWithFormat:@"00%@",strInt];
        }else if (strInt.length%4 == 3) {
            strInt = [NSString stringWithFormat:@"0%@",strInt];
        }
        
        for (int i=0; i < strInt.length; i+=4) {
            NSString * tempStr = [strInt substringWithRange:NSMakeRange(i,4)];
            int bit = 0;
            for (int j=0; j<tempStr.length; j++) {
                int a = [[tempStr substringWithRange:NSMakeRange(j,1)] intValue];
                bit = bit + a * pow(2, 3-j);
            }
            strBin = [NSString stringWithFormat:@"%@%@",strBin,[self hexFromInt:bit]];
        }
    }
    //小数部分
    if (arr.count == 2) {
        NSString * strDec = arr[1];
        if (strDec.length%4 == 1) {
            strDec = [NSString stringWithFormat:@"%@000",strDec];
        }else if (strDec.length%4 == 2) {
            strDec = [NSString stringWithFormat:@"%@00",strDec];
        }else if (strDec.length%4 == 3) {
            strDec = [NSString stringWithFormat:@"%@0",strDec];
        }
        NSString * tempDec = @"";
        for (int i=0; i < strDec.length; i+=4) {
            NSString * tempStr = [strDec substringWithRange:NSMakeRange(i,4)];
            int bit = 0;
            for (int j=0; j<tempStr.length; j++) {
                int a = [[tempStr substringWithRange:NSMakeRange(j,1)] intValue];
                bit = bit + a * pow(2, 3-j);
            }
            tempDec = [NSString stringWithFormat:@"%@%@",tempDec,[self hexFromInt:bit]];

        }
        strBin = [NSString stringWithFormat:@"%@.%@",strBin,tempDec];
    }
    return strBin;
}


#pragma mark - 八进制
//八进制转换成二进制
+ (NSString *)BinFromOct:(NSString *)aOct {
    NSString * dec = [self DecFromOct:aOct];
    return [self BinFromDec:dec];
}
//八进制转十进制
+ (NSString *)DecFromOct:(NSString *)aOct {
    NSArray * arr = [aOct componentsSeparatedByString:@"."];
    
    NSString * lastStr = @"";
    //整数部分
    {
        NSString * strInt = arr[0];
        
        int sum = 0;
        for (int i = 0;i<strInt.length;i++) {
            NSString * temp = [strInt substringWithRange:NSMakeRange(i,1)];
            int bit = [self intFromHex:temp];
            sum = sum + bit * pow(8, strInt.length - 1 - i);
        }
        lastStr = [NSString stringWithFormat:@"%d",sum];
    }
    //小数部分
    if (arr.count == 2) {
        NSString * strDec = arr[1];
        int tempDec = 0;
        double douDec = 0.0;
        for (int i = 0; i < strDec.length; i++) {
            tempDec = [self intFromHex:[strDec substringWithRange:NSMakeRange(i,1)]];
            douDec = douDec + tempDec * pow(8, -i-1);
        }
        lastStr = [NSString stringWithFormat:@"%.16g",lastStr.doubleValue+ douDec];
    }
    return lastStr;
}
//八进制转十六进制
+ (NSString *)HexFromOct:(NSString *)aOct {
    NSString * dec = [self DecFromOct:aOct];
    return [self HexFromDec:dec];
}



#pragma mark - 十进制转
//十进制转换成二进制
+ (NSString *)BinFromDec:(NSString *)aDec {
    NSString * strBIN = @"";
    NSArray * arr = [aDec componentsSeparatedByString:@"."];
    
    //整数部分
    {
        NSString * strInt = arr[0];
        int intDec = strInt.intValue;
        if (intDec == 0) {
            strBIN = @"0";
        }
        while (intDec) {
            strBIN = [NSString stringWithFormat:@"%d%@",intDec%2,strBIN];
            intDec = intDec/2;
        }
    }
    //小数部分
    if (arr.count == 2) {
        NSString * strDec = [NSString stringWithFormat:@"0.%@",arr[1]];
        double douDec = strDec.doubleValue;
        int intCycle = 16;
        NSString * tempDec = @"";
        while (intCycle) {
            douDec = douDec * 2;
            tempDec = [NSString stringWithFormat:@"%@%g",tempDec,floor(douDec)];
            douDec = douDec - floor(douDec);
            intCycle--;
        }
        strBIN = [NSString stringWithFormat:@"%@.%@",strBIN, tempDec];
    }
    return strBIN;
}
//十进制转八进制
+ (NSString *)OctFromDec:(NSString *)aDec {
    NSString * bin = [self BinFromDec:aDec];
    return [self OctFromBin:bin];
}
//十进制转十六进制
+ (NSString *)HexFromDec:(NSString *)aDec {
    NSString * bin = [self BinFromDec:aDec];
    return [self HexFromBin:bin];
}

#pragma mark - 十六进制转
//十六进制转十进制
+ (NSString *)DecFromHex:(NSString *)aHex {
    
    NSArray * arr = [aHex componentsSeparatedByString:@"."];
    
    NSString * lastStr = @"";
    //整数部分
    {
        NSString * strInt = arr[0];
        
        int sum = 0;
        for (int i = 0;i<strInt.length;i++) {
            NSString * temp = [strInt substringWithRange:NSMakeRange(i,1)];
            int bit = [self intFromHex:temp];
            sum = sum + bit * pow(16, strInt.length - 1 - i);
        }
        lastStr = [NSString stringWithFormat:@"%d",sum];
    }
    //小数部分
    if (arr.count == 2) {
        NSString * strDec = arr[1];
        int tempDec = 0;
        double douDec = 0.0;
        for (int i = 0; i < strDec.length; i++) {
            tempDec = [self intFromHex:[strDec substringWithRange:NSMakeRange(i,1)]];
            douDec = douDec + tempDec * pow(16, -i-1);
        }
        lastStr = [NSString stringWithFormat:@"%.16g",lastStr.doubleValue+ douDec];
    }
    return lastStr;
}
//十六进制转二进制
+ (NSString *)BinFromHex:(NSString *)aHex {
    NSString * dec = [self DecFromHex:aHex];
    return [self BinFromDec:dec];
}
//十六进制转八进制
+ (NSString *)OctFromHex:(NSString *)aHex {
    NSString * dec = [self DecFromHex:aHex];
    return [self OctFromDec:dec];
}

+ (NSString *)hexFromInt:(int)aHex {
    
    switch (aHex) {
        case 10:
            return @"A";
            break;
        case 11:
            return @"B";
            break;
        case 12:
            return @"C";
            break;
        case 13:
            return @"D";
            break;
        case 14:
            return @"E";
            break;
        case 15:
            return @"F";
            break;
            
        default:
            return [NSString stringWithFormat:@"%d",aHex];
            break;
    }
    
}
+ (int)intFromHex:(NSString *)aHex {
    
    if ([aHex isEqualToString:@"A"]) {
        return 10;
    }else if ([aHex isEqualToString:@"B"]){
        return 11;
    }else if ([aHex isEqualToString:@"C"]){
        return 12;
    }else if ([aHex isEqualToString:@"D"]){
        return 13;
    }
    else if ([aHex isEqualToString:@"E"]){
        return 14;
    }
    else if ([aHex isEqualToString:@"F"]){
        return 15;
    }else {
        return [aHex intValue];
    }
}



//原码的编码规律可概括为:正数的符号位用 0 表示,负数的符号位用 1 表示,数位 部分则和真值完全一样。
//反码又称为“对 1 的补数”,对于正数,反码和原码相同,对于负数,是将原码数位部分 按位求反。
//补码的表示:正数的补码与原码相同,负数的补码符号位为 1,数值位是将原码按位取 反后末位加 1。(以 8 位二进制数为基准进行表示)
/**
 *  二进制转换成原码
 */
+ (NSString *)OriginalFromBin:(float )aBin{
//    原码的编码规律可概括为:正数的符号位用 0 表示,负数的符号位用 1 表示,数位 部分则和真值完全一样。
    if (aBin > 0) {
        return [NSString stringWithFormat:@""];
    }
    
    
    
    
    return @"";
}
/**
 *  原码转换成反码
 */
+ (NSString *)CounterFromBin:(float )aBin{
    return @"";
}
/**
 *  原码转换成补码
 */
+ (NSString *)FillFromBin:(float )aBin{
    return @"";
}


@end
