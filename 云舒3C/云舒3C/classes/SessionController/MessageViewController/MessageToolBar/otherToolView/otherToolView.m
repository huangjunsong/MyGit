//
//  otherToolView.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/16.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "otherToolView.h"

@implementation otherToolView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//static int imageNum = 0;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setButton];
    }
    return self;
}
- (void)setButton
{
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.backgroundColor = [UIColor clearColor];
    btn1.tag = 1;
    [btn1 setBackgroundImage:[UIImage imageNamed:@"tool1"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.backgroundColor = [UIColor clearColor];
    btn2.tag = 2;
    [btn2 setBackgroundImage:[UIImage imageNamed:@"tool2"] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnSelected:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.backgroundColor = [UIColor clearColor];
    btn3.tag = 3;
    [btn3 setBackgroundImage:[UIImage imageNamed:@"tool3"] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btnSelected:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.backgroundColor = [UIColor clearColor];
    btn4.tag = 4;
    [btn4 setBackgroundImage:[UIImage imageNamed:@"tool4"] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(btnSelected:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn5.backgroundColor = [UIColor clearColor];
    btn5.tag = 5;
    [btn5 setBackgroundImage:[UIImage imageNamed:@"tool5"] forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(btnSelected:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:btn1];
    [self addSubview:btn2];
    [self addSubview:btn3];
    [self addSubview:btn4];
    [self addSubview:btn5];
    int x =(self.frame.size.width - 206)/5;
    int y = (self.frame.size.height - 110)/3;
    [btn1 setFrame:CGRectMake(x, y, 51.5, 51.5)];
    [btn2 setFrame:CGRectMake(2*x+51.5, y, 51.5, 51.5)];
    [btn3 setFrame:CGRectMake(3*x+ 2*51.5, y, 51.5, 51.5)];
    [btn4 setFrame:CGRectMake(4*x+ 3*51.5, y, 51.5, 51.5)];
    [btn5 setFrame:CGRectMake(x, 2*y + 55, 51.5, 51.5)];
}

- (void)btnSelected:(UIButton *)sender
{
    NSLog(@"123");
}
@end
