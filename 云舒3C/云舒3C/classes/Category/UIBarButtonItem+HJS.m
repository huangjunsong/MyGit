//
//  UIBarButtonItem+HJS.m
//  云舒3C
//
//  Created by Junsong Huang on 15/2/28.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "UIBarButtonItem+HJS.h"

@implementation UIBarButtonItem (HJS)
- (id)initWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action name:(NSString *)name frame:(CGRect)frame
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:icon];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageNamed:highlighted] forState:UIControlStateHighlighted];
    btn.frame = frame;
//    btn.bounds = (CGRect){CGPointZero, image.size};
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:name forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    return [self initWithCustomView:btn];
}
+ (id)itemWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action name:(NSString *)name frame:(CGRect)frame
{
    return [[self alloc]initWithIcon:icon highlightedIcon:highlighted target:target action:action name:name frame:frame];
}
@end
