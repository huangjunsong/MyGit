//
//  UIView+UIView_MaskView.m
//  MLIgnoreTransparentButton
//
//  Created by Cloudsoar on 14-10-25.
//  Copyright (c) 2014年 molon. All rights reserved.
//

#import "UIView+MaskView.h"

@implementation UIView (MaskView)

inline static CGRect CGRectCenterRectForResizableImage(UIImage *image) {
    return CGRectMake(image.capInsets.left/image.size.width, image.capInsets.top/image.size.height, (image.size.width-image.capInsets.right-image.capInsets.left)/image.size.width, (image.size.height-image.capInsets.bottom-image.capInsets.top)/image.size.height);
}

- (void)setMaskWithImage:(UIImage*)image
{
    //根据
    CALayer *mask = [CALayer layer];
    mask.contents = (id)image.CGImage;
    mask.contentsScale = [UIScreen mainScreen].scale;
    
    //设置拉伸属性，根据capInsets，找到可拉伸的矩形
    CGRect capRect = CGRectCenterRectForResizableImage(image);
    mask.contentsCenter = capRect;
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    mask.frame  = rect;
    self.layer.mask = mask;
}


@end
