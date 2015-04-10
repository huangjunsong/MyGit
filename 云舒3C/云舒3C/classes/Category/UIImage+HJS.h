//
//  UIImage+HJS.h
//  云舒3C
//
//  Created by Junsong Huang on 15/2/28.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HJS)
+ (UIImage *)resizeImage:(NSString *)imgName;
+ (UIImage *)resizeImage:(NSString *)imgName LeftCapWidth:(CGFloat)width topCapHeight:(CGFloat)height;
@end
