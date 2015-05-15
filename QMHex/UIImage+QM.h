//
//  UIImage+QM.h
//  MengYue
//
//  Created by QiMENG on 1/31/15.
//  Copyright (c) 2015 QiMENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QM)

- (UIImage *)qm_defaultTensileImage;

- (CGFloat)width;
- (CGFloat)height;

#pragma mark - 颜色值转换成图片
+ (UIImage *)createImageWithColor:(UIColor *)color;
+ (UIImage *)createImageWithColor:(UIColor *)color withFrame:(CGRect)aFrame;

@end
