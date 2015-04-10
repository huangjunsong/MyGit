//
//  TabBar.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/2.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBar;
@protocol TabBarDelegate <NSObject>


@optional
- (void)tabBar:(TabBar *)tabBar didSelectButtonFrom:(NSUInteger)from to:(NSUInteger)to;

@end

@interface TabBar : UIView
- (void)addTabBarButton:(NSString *)icon selIcon:(NSString *)selIcon name:(NSString *)name;
@property (nonatomic, weak) id<TabBarDelegate> delegate;
@end
