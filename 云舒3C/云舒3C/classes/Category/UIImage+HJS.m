//
//  UIImage+HJS.m
//  云舒3C
//
//  Created by Junsong Huang on 15/2/28.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "UIImage+HJS.h"

@implementation UIImage (HJS)
#pragma mark 拉伸图片
+ (UIImage *)resizeImage:(NSString *)imgName
{
    UIImage *image = [UIImage imageNamed:imgName];
    return [image stretchableImageWithLeftCapWidth:image.size.width *0.5 topCapHeight:image.size.height *0.5];
}
+ (UIImage *)resizeImage:(NSString *)imgName LeftCapWidth:(CGFloat)width topCapHeight:(CGFloat)height
{
    UIImage *image = [UIImage imageNamed:imgName];
    return [image stretchableImageWithLeftCapWidth:image.size.width *width topCapHeight:image.size.height *height];
}
@end
