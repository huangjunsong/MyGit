//
//  TabBar.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/2.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "TabBar.h"
#import "TabbarButton.h"

@interface TabBar ()
{
    TabbarButton *_selectedButton;
}
@end

@implementation TabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)addTabBarButton:(NSString *)icon selIcon:(NSString *)selIcon name:(NSString *)name
{
    [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_bottom_bgline1"]]];
    TabbarButton *button = [TabbarButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selIcon] forState:UIControlStateSelected];
    [button setTitle:name forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
    
    // 4.重新调整所有按钮的frame
    [self adjustButtonFrames];
    
    // 5.默认选中第0个按钮
    button.tag = self.subviews.count - 1;
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }

}
- (void)adjustButtonFrames
{
    NSUInteger btnCount = self.subviews.count;
    for (int i = 0; i < btnCount; i++) {
        TabbarButton *button = self.subviews[i];
        
        // 设置frame
        CGFloat buttonY = 0;
        CGFloat buttonW = self.frame.size.width / btnCount;
        CGFloat buttonX = i * buttonW;
        CGFloat buttonH = self.frame.size.height;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}
- (void)buttonClick:(TabbarButton *)button
{
    // 1.通知代理
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        [_delegate tabBar:self didSelectButtonFrom:_selectedButton.tag to:button.tag];
    }
    
    // 2.切换按钮状态
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
}


@end
