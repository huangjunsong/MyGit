//
//  emojiView.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/16.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "emojiView.h"
#import "emojiModel.h"
@interface emojiView ()
{
    NSMutableArray *_emojiAry;
}
@end

@implementation emojiView

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
//        NSString *emojiFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"emotionImage.plist"];
//        _emojiDic = [[NSDictionary alloc] initWithContentsOfFile:emojiFilePath];
        _emojiAry = [emojiModel getEmojiAry:[Util getCurrenLanguage]];
        NSInteger pageNum = 3;
        if (isPad) {
            pageNum = 1;
        }
        [self setEmoji:pageNum];
    }
    return self;
}
static int indexNum = 0;
static int deleteBtn = 0;
- (void)setEmoji:(NSInteger)page
{
    NSInteger lineNum = 7;
    NSInteger emojiW = 224;
    if (isPad) {
        lineNum = 17;
        emojiW = 544;
    }
    int  gapLengthH = (self.frame.size.height - 128)/5;
    int gapLengthW = ( self.frame.size.width - emojiW)/lineNum+3;

    for (int i = 0; i < 4; i++) {
 
        for (int y = 0; y < lineNum; y++) {
            

            if ((i == 3&&y == lineNum-1)||(indexNum == _emojiAry.count)) {
                if (deleteBtn == page) {
                    break;
                }
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [button setBackgroundColor:[UIColor clearColor]];
                button.frame=CGRectMake(y*28+gapLengthW*(y + 1) , gapLengthH *(i + 1) + i*28, 28, 28);
                [button setImage:[UIImage imageNamed:@"faceDelete"] forState:UIControlStateNormal];
                button.tag=10000;
                [button addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:button];
                
                deleteBtn++;
                
            }else
            {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [button setBackgroundColor:[UIColor clearColor]];
                button.frame=CGRectMake(y*28+gapLengthW*(y + 1) , gapLengthH *(i + 1) + i*28, 28, 28);
                indexNum++;
                 NSString *imageName = [NSString stringWithFormat:@"%d.png",indexNum];
                UIImage *img = [UIImage imageNamed:imageName];
                [button setBackgroundImage:img forState:UIControlStateNormal];
                button.tag=indexNum;
                [button addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:button];
            }
        }
    }
}
- (void)selected:(UIButton*)sender
{
    if (sender.tag == 10000) {
        [_delegate selectedEmoji:@"删除"];
    }else
    {
        if (sender.tag-1>=_emojiAry.count)
        {
            return;
        }
        
        NSString *str=[_emojiAry objectAtIndex:sender.tag-1];
        
        if ([[Util getCurrenLanguage] isEqualToString:@"en"])
        {
            str=[_emojiAry objectAtIndex:sender.tag-1];
        }
        //NSString *str = [NSString stringWithFormat:@"[##%d]",tag];
        
        [_delegate selectedEmoji:str];
    }
}
@end
