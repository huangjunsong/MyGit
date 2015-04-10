//
//  UINavigationItem+HJS.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/3.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "UINavigationItem+HJS.h"

@implementation UINavigationItem (HJS)
- (void)copyItmeTo:(UINavigationItem *)other
{
    self.leftBarButtonItem = other.leftBarButtonItem;
    self.leftBarButtonItems = other.leftBarButtonItems;
    self.rightBarButtonItems = self.rightBarButtonItems;
    self.rightBarButtonItem = other.rightBarButtonItem;
    self.title = other.title;
    self.titleView = other.titleView;
}
@end
