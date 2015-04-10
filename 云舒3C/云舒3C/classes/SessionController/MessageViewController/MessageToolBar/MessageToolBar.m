
//
//  MessageToolBar.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/12.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "MessageToolBar.h"
#import "emojiModel.h"
#import "MessageCellTable.h"
#define keybordTime 0.3
@interface MessageToolBar()
{
    UIImageView *_borderImage;
    UIExpandingTextView *_textView;
    UIButton *_addMoreBtn;
    UIButton *_emojiBtn;
    BOOL _emojiISShow;
    BOOL _otherToolISShow;
    BOOL _keyboardISShow;
}
@end

@implementation MessageToolBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setToolBar
{

    _emojiISShow = NO;
    _otherToolISShow = NO;
    _keyboardISShow = NO;
    [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"chat_bottom_bg"]]];
    
    //创建textview
    UIExpandingTextView *textView= [[UIExpandingTextView alloc]initWithFrame:CGRectMake(kToolBarH, (kToolBarH - kTextFieldH) * 0.5, Screen_width - 3 * kToolBarH, kTextFieldH )];
    textView.editable = YES;
    textView.delegate = self;
//    textView.internalTextView.scrollIndicatorInsets = UIEdgeInsetsMake(4.0f, 0.0f, 10.0f, 0.0f);
    [textView.internalTextView setReturnKeyType:UIReturnKeySend];
    textView.maximumNumberOfLines=3;
    _textView = textView;

    //创建边框图片
    _borderImage = [[UIImageView alloc]initWithFrame:CGRectMake(kToolBarH, (kToolBarH - kTextFieldH) * 0.5, Screen_width - 3 * kToolBarH, kTextFieldH)];
    
    _borderImage.contentMode = UIViewContentModeScaleToFill;
    _borderImage.image = [UIImage resizeImage:@"chat_bottom_textfield"];
    
    
    [self addSubview:_borderImage];
    [self addSubview:textView];
    
    UIButton *addMoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addMoreBtn.frame = CGRectMake(Screen_width - kToolBarH, 0, kToolBarH, kToolBarH);
    [addMoreBtn setImage:[UIImage imageNamed:@"TypeSelectorBtn_Black"] forState:UIControlStateNormal];
    [addMoreBtn setImage:[UIImage imageNamed:@"TypeSelectorBtnHL_Black"] forState:UIControlStateHighlighted];
    [self addSubview:addMoreBtn];
    _addMoreBtn = addMoreBtn;
    addMoreBtn.tag = 2;
    [addMoreBtn addTarget:self action:@selector(showToolView:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *emojiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    emojiBtn.frame = CGRectMake(Screen_width - kToolBarH * 2, 0, kToolBarH, kToolBarH);
    [emojiBtn setImage:[UIImage imageNamed:@"ToolViewEmotion"] forState:UIControlStateNormal];
    [emojiBtn setImage:[UIImage imageNamed:@"ToolViewEmotionHL"] forState:UIControlStateHighlighted];
    [self addSubview:emojiBtn];
    _emojiBtn = emojiBtn;
    emojiBtn.tag = 1;
    [emojiBtn addTarget:self action:@selector(showToolView:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *voiceSoundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    voiceSoundBtn.frame = CGRectMake(0, 0, kToolBarH, kToolBarH);
    [voiceSoundBtn setImage:[UIImage imageNamed:@"ToolViewInputVoice"] forState:UIControlStateNormal];
    [voiceSoundBtn setImage:[UIImage imageNamed:@"ToolViewInputVoiceHL"] forState:UIControlStateHighlighted];
    [self addSubview:voiceSoundBtn];
    [self addNotification];
    //NSLog(@"-------%@",NSStringFromCGRect(textView.frame));
}
#pragma mark 显示工具栏方法
- (void)showToolView:(UIButton *)sender
{
    NSInteger keyBH = 216;
    if (isPad) {
        keyBH = 236;
    }

    if (sender.tag == 1) {
        if (_keyboardISShow) {
            [_textView resignFirstResponder];
        }
        [self setEmojiandOtherView];
        
//        [_emoji setEmojiViewWith:keyBH  page:_page];
        CGRect rect = self.frame;
        int H = keyBH + self.frame.size.height + [Util returnNavigationbarHight] ;
        rect.origin.y = Screen_height - H;
        CGRect scroll = _emojiView.frame;
        scroll.size.height = keyBH;
        
        scroll.origin.y = Screen_height - keyBH - [Util returnNavigationbarHight];
        [UIView animateWithDuration:keybordTime animations:^{
            [self setFrame:rect];
            [_emojiView setFrame:scroll];
        }];
        _emojiISShow = YES;
    }else
    {
        if (_keyboardISShow) {
            [_textView resignFirstResponder];
        }
        [self setEmojiandOtherView];
        CGRect rect = self.frame;
        int H = keyBH + self.frame.size.height + [Util returnNavigationbarHight] ;
        rect.origin.y = Screen_height - H;
        CGRect otherT = _otherToolView.frame;
        otherT.size.height = keyBH;
        otherT.origin.y = Screen_height - keyBH - [Util returnNavigationbarHight];
        [UIView animateWithDuration:keybordTime animations:^{
            [self setFrame:rect];
            [_otherToolView setFrame:otherT];
        }];
        _otherToolISShow = YES;
    }
}
- (void)setEmojiandOtherView
{
//    if (_keyboardISShow) {
//        [_textView resignFirstResponder];
//    }
    if (_otherToolISShow) {
        //            CGRect rect = self.frame;
        CGRect otherT = _otherToolView.frame;
        otherT.origin.y = Screen_height;
        [UIView animateWithDuration:keybordTime animations:^{
            [_otherToolView setFrame:otherT];
        }];
        _otherToolISShow = NO;
    }
    if (_emojiISShow) {
        //            CGRect rect = self.frame;
        //            rect.origin.y = Screen_height - self.frame.size.height;
        CGRect scroll = _emojiView.frame;
        scroll.origin.y = Screen_height;
        [UIView animateWithDuration:keybordTime animations:^{
            //                [self setFrame:rect];
            [_emojiView setFrame:scroll];
        }];
        _emojiISShow = NO;
    }
}
#pragma mark 添加通知
- (void)addNotification
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
#pragma  mark 两个通知方法
- (void)keyboardWillShow:(NSNotification *)notify
{
    [self setEmojiandOtherView];
   int keyBoardHeight = (int)( [[[notify userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height);

    CGRect rect = self.frame;
    int H =  rect.size.height + keyBoardHeight + [Util returnNavigationbarHight];
    rect.origin.y = Screen_height - H ;
    CGRect tableRect = _tableView.frame;
    tableRect.size.height =  Screen_height - H;
    [UIView animateWithDuration:keybordTime animations:^{
        [self setFrame:rect];
        [_tableView setFrame:CGRectMake(0, 0, tableRect.size.width, tableRect.size.height)];
    }];
    _keyboardISShow = YES;
    
    //NSLog(@"%@",NSStringFromCGRect(_tableView.frame));
}
- (void)keyboardWillHide:(NSNotification *)notify
{
    CGRect rect = self.frame;
    int H = rect.size.height + [Util returnNavigationbarHight];
    rect.origin.y = Screen_height - H;
    CGRect tableRect = _tableView.frame;
    tableRect.size.height = Screen_height - H;
    [UIView animateWithDuration:keybordTime animations:^{
        self.frame = rect;
        [_tableView setFrame:CGRectMake(0, 0, tableRect.size.width, tableRect.size.height)];
    }];
    _keyboardISShow = NO;
}
#pragma mark 改变输入框的高度
static int j = 40;
- (void)expandingTextView:(UIExpandingTextView *)expandingTextView willChangeHeight:(float)height
{
//    NSLog(@"%f",height);
    
    if ((height - j) > 0) {
        int i = height - j +10;
        CGRect toolRect = self.frame;
        CGRect borderRect = _borderImage.frame;
        toolRect.size.height += i;
        toolRect.origin.y -= i;
        borderRect.size.height += i;
        
        self.frame = toolRect;
        _borderImage.frame = borderRect;
        j = height;
    }
    if ((j  - height)>0) {
        int i = j - height + 10;
        CGRect toolRect = self.frame;
        CGRect borderRect = _borderImage.frame;
        toolRect.size.height -= i;
        toolRect.origin.y += i;
        borderRect.size.height -= i;
        
        self.frame = toolRect;
        _borderImage.frame = borderRect;
        j = height;
    }
    
}
#pragma mark 插入表情方法
- (void)selectedEmojiBtn:(NSString *)str
{
    if ([str isEqualToString:@"删除"]) {
        [self delFace:_textView.text];
    }else
    {
        //当前字符串长度
        NSInteger stringLenth = _textView.text.length;
        //光标位置
        NSString *oldStr = _textView.text;//当前字符串
        NSInteger curIndex = _textView.selectedRange.location;
        if (curIndex<stringLenth) {//光标不在末尾，把表情插入光标所在位置
            
            NSRange range = _textView.selectedRange;//当前光标位置
            NSString *curFrontStr = [oldStr substringToIndex:curIndex];//获取光标之前字符串
            NSString *curBehindStr = [oldStr substringFromIndex:curIndex];//获取光标之后字符串
            //开始插入
            NSString *resultStr = [NSString stringWithFormat:@"%@%@",curFrontStr,str];
            //计算总共插入了多少个字符
            NSInteger addCount = resultStr.length - curFrontStr.length;
            //重置光标位置
            range.location = addCount;
            //合并光标前后字符
            NSString *string = [NSString stringWithFormat:@"%@%@",resultStr,curBehindStr];
            _textView.text = string;
            _textView.selectedRange = range;
        }else//光标在末尾
        {
            NSString *newStr = [NSString stringWithFormat:@"%@%@",oldStr,str];
            _textView.text = newStr;
        }
    }
}
#pragma  mark 删除表情方法
-(void)expandingDeleteEvent
{
    [self delFace:_textView.text];
}
- (void)delFace:(NSString*)str
{
    NSString *inputString;
    inputString = str;
    NSString *string = nil;
    NSInteger stringLength = inputString.length;
    
    
    NSUInteger curIndex = _textView.selectedRange.location;
    
    
    if (curIndex<stringLength)
    {////光标没有在末尾,删除的时候就要从光标位置开始删除
        NSRange rang = _textView.selectedRange;
        
        NSString *curFrontStr = [inputString substringToIndex:curIndex];//光标前的字符
        NSString *curBehindStr= [inputString substringFromIndex:curIndex];//光标后的字符
        
        //执行删除动作 只能删除光标之前的字符
        NSString *resultStr = [self getDelectedStr:curFrontStr];
        //计算总共删除了多少个字符
        int delCount = (int)curFrontStr.length-(int)resultStr.length;
        
        //重新设置光标的位置
        rang.location = curIndex-delCount;
        
        //合并光标前和光标后的字符
        string = [NSString stringWithFormat:@"%@%@",resultStr,curBehindStr];
        
        _textView.text = string;
        
        _textView.selectedRange = rang;
        
    }else
    {//光标在末尾
        string = [self getDelectedStr:str];
        _textView.text = string;
    }
}
-(NSString*)getDelectedStr:(NSString*)str
{
    
    NSUInteger stringLength = str.length;
    NSString *string=@"";
    if (stringLength > 0)
    {
        if ([@"]" isEqualToString:[str substringFromIndex:stringLength-1]])
        {
            if ([str rangeOfString:@"[#"].location == NSNotFound)
            {
                string = [str substringToIndex:stringLength - 1];
            } else
            {
                NSUInteger fsIndex=[str rangeOfString:@"[#" options:NSBackwardsSearch].location;
                NSString *faceStr=[str substringFromIndex:fsIndex];//表情字符这里只是说是匹配了表情字符，但是不一定是表情字符，因此还要再从表情字典中查找一次，
                if ([emojiModel getZHFaceIndexByKey:faceStr]<0)
                {//中文表情中没有查找到，再查找下英文的表情
                    
                    if ([emojiModel getENFaceIndexByKey:faceStr]<0)
                    {// 英文表情中也没有找到，那就按正常模式删除一个字符
                        string = [str substringToIndex:stringLength - 1];
                    }else
                    {
                        string = [str substringToIndex:fsIndex];
                    }
                
                }else
                {//在中文表情中 查找到了，就以表情为单位删除
                    string = [str substringToIndex:fsIndex];
                }
            }
        } else
        {
            string = [str substringToIndex:stringLength - 1];
        }
    }
    return string;
}
- (BOOL)expandingTextViewShouldReturn:(UIExpandingTextView *)expandingTextView
{
    [self.Tooldelegate sendNewMessageWithText:expandingTextView.text];
    return YES;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
@end
