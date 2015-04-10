//
//  UIBarButtonItem+HJS.h
//  云舒3C
//
//  Created by Junsong Huang on 15/2/28.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface  UIBarButtonItem (HJS)
+ (id)itemWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action name:(NSString *)name frame:(CGRect)frame;
@end
