//
//  emojiScrollView.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/16.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "emojiScrollView.h"
#import "emojiView.h"

@interface emojiScrollView()<emojiSelectedDelegate>
{
    emojiView *_view1;
    emojiView *_view2;
    emojiView *_view3;
    
}
@end

@implementation emojiScrollView

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
        [self setBigView];
    }
    return self;
}
- (void)setBigView
{
    NSInteger keyBH = 216;
    if (isPad) {
        keyBH = 236;
    }
    emojiView *view1 = [[emojiView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, keyBH)];
    emojiView *view2 = [[emojiView alloc]initWithFrame:CGRectMake(Screen_width*1, 0, Screen_width, keyBH)];
    emojiView *view3 = [[emojiView alloc]initWithFrame:CGRectMake(Screen_width*2, 0, Screen_width, keyBH)];
    
    _view1 = view1;
     _view2 = view2;
     _view3 = view3;
    [self addSubview:_view1];
    [self addSubview:_view2];
    [self addSubview:_view3];
    view1.delegate =self;
    view2.delegate =self;
    view3.delegate =self;
}

- (void)selectedEmoji:(NSString *)str
{
    [_Mydelegate selectedEmojiBtn:str];
}
@end
