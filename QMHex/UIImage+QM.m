//
//  UIImage+QM.m
//  MengYue
//
//  Created by QiMENG on 1/31/15.
//  Copyright (c) 2015 QiMENG. All rights reserved.
//

#import "UIImage+QM.h"

@implementation UIImage (QM)

- (UIImage *)qm_tensileImageWithLeftCapWidth:(float)width topCapHeight:(float)height {
    
    return [self stretchableImageWithLeftCapWidth:width topCapHeight:height];
}

#pragma mark - 拉伸图片
- (UIImage *)qm_defaultTensileImage {
    
    return [self qm_tensileImageWithLeftCapWidth:self.size.width/2.0 topCapHeight:self.size.height/2.0];
    
}


- (CGFloat)width {
    return self.size.width;
}
- (CGFloat)height {
    return self.size.height;
}


#pragma mark - 颜色值转换成图片
+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

#pragma mark - 颜色值转换成图片
+ (UIImage *)createImageWithColor:(UIColor *)color withFrame:(CGRect)aFrame
{
    CGRect rect =aFrame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}



@end
