//
//  BuddleView.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/11.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "BuddleView.h"
#import "UIImage+HJS.h"

@interface BuddleView ()
{
    UIImage *_image;
}
@end

@implementation BuddleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(BuddleSelected:) name:UIMenuControllerWillShowMenuNotification object:nil];
    }
    return self;
}
- (void)BuddleSelected:(NSNotification *)Notify
{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIMenuControllerWillShowMenuNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(BuddleDeselected:) name:UIMenuControllerWillHideMenuNotification object:nil];
}
- (void)BuddleDeselected:(NSNotification *)Notify
{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIMenuControllerWillHideMenuNotification object:nil];
}
- (void)drawRect:(CGRect)rect
{
    [_image drawInRect:rect];
    
}
- (void)drawRectWith:(BubbleMessageType)type
{
    NSString *comingText = @"iPhone1coming";
    NSString *outgoingText = @"iPhone1";
    if (isPad) {
        comingText = @"iPad1coming";
        outgoingText = @"iPad1";
    }
    
    if (type == BubbleMessageTypeIncoming) {
        [self createImg:comingText];
    }else
    {
        [self createImg:outgoingText];
    }
    [self setNeedsDisplay];
}
- (void)createImg:(NSString *)Name
{
    if (!_image) {
        _image = [UIImage resizeImage:Name LeftCapWidth:0.5 topCapHeight:0.8];
    }
}
@end
