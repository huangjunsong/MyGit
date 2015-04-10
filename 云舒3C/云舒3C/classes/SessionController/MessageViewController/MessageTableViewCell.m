//
//  MessageTableViewCell.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/10.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "MessageTableViewCell.h"
#import "MessageCellTable.h"
#import "BuddleView.h"
#import "UIView+MaskView.h"
#define headFrame 40.0f
#define kMarginTop 4.0f
#define kMarginL 5.0f
#define kMarginR 6.0f
@implementation MessageTableViewCell
#pragma mark 初始化方法
+ (instancetype)settingCellWithTableView:(UITableView *)tableView
{
    // 0.用static修饰的局部变量，只会初始化一次
    static NSString *ID = @"MessageCell";
    
    // 1.拿到一个标识先去缓存池中查找对应的Cell
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果缓存池中没有，才需要传入一个标识创建新的Cell
    if (cell == nil) {
        cell = [[MessageTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryNone;
        self.accessoryView = nil;
        
        self.imageView.image = nil;
        self.imageView.hidden = YES;
        self.textLabel.text = nil;
        self.textLabel.hidden = YES;
        self.detailTextLabel.text = nil;
        self.detailTextLabel.hidden = YES;
        
        UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress:)];
        [recognizer setMinimumPressDuration:0.4];
        [self addGestureRecognizer:recognizer];
        
    }
    return self;
}
#pragma mark 设置长按手势方法
- (void)handleLongPress:(UILongPressGestureRecognizer *)Gesture
{
    NSLog(@"123");
}
#pragma mark 设置cell的数据
-(void)setItem:(MessageCellTable *)item
{
    _item = item;
    [self setCustomCell];
}
#pragma mark 设置cell
- (void)setCustomCell
{
    UILabel *TimeStamp = [[UILabel alloc]initWithFrame:CGRectMake((Screen_width - 150)/2, 0, 150, 20)];
    TimeStamp.font = [UIFont systemFontOfSize:12];
    TimeStamp.backgroundColor = [UIColor colorWithPatternImage:[UIImage resizeImage:@"MessageContent_TimeNodeBkg"]];
    TimeStamp.textColor = [UIColor whiteColor];
    TimeStamp.text = [Util getCurrentTime];
    [self.contentView addSubview:TimeStamp];
    TimeStamp.hidden = YES;
    UIButton *header = [UIButton buttonWithType:UIButtonTypeCustom];
    header.frame = CGRectMake(0, 30, headFrame, headFrame);
    NSString *headImgName = @"man";
    if (_item.Sex) {
        headImgName = @"women";
    }
    [header setBackgroundImage:[UIImage imageNamed:headImgName] forState:UIControlStateNormal];
    [header addTarget:self action:@selector(headTouchEvent:) forControlEvents:UIControlEventTouchUpInside];
    CGRect rect = header.frame;
    if (_item.FromToType == BubbleMessageTypeIncoming) {
        rect.origin.x = 0;
        header.frame = rect;
    }else
    {
        rect.origin.x = Screen_width - headFrame ;
        header.frame = rect;
    }
    if (_item.MsgType == MessageTypeText) {
        [self setTextCell];
    }else if(_item.MsgType == MessageTypeImage)
    {
        
    }else if(_item.MsgType == MessageTypeFile)
    {
        
    }else if(_item.MsgType == MessageTypeVoice)
    {
        
    }
}
#pragma 点击头像事件
- (void)headTouchEvent:(UIButton *)sender
{
    
}
#pragma mark 设置文字类型的cell
- (void)setTextCell
{
    NSString *text = _item.MsgText;
    CGFloat textWidth = Screen_width * 0.75;
    CGRect textRect = [TQRichTextView boundingRectWithSize:CGSizeMake(textWidth, 1000) font:[UIFont systemFontOfSize:13] string:text lineSpace:1.0f];//设置宽高
    TQRichTextView *textView = [[TQRichTextView alloc]initWithFrame:CGRectMake(kMarginL, kMarginTop, textRect.size.width, textRect.size.height)];//设置textview
    textView.text = text;
    BuddleView *buddleView = [[BuddleView alloc]initWithFrame:CGRectMake(0, 50, textView.frame.size.width + 2*kMarginL, textView.frame.size.height + 2*kMarginTop)];
    //添加textview到气泡上
    [buddleView addSubview:textView];
    CGRect buddleRect = buddleView.frame;
    if (_item.FromToType == BubbleMessageTypeIncoming) {
        buddleRect.origin.x = headFrame;
        buddleView.frame = buddleRect;
    }else if (_item.FromToType == BubbleMessageTypeOutgoing)
    {
        buddleRect.origin.x = Screen_width - headFrame -buddleRect.size.width;
    }
    [self.contentView addSubview:buddleView];
    [self setCellHeight:buddleView.frame.origin.y + buddleView.frame.size.height + 10 ];
    
}
#pragma mark 设置图像类型的cell
- (void)setImgCell
{
    NSString *maskstr = [NSString string];
    NSString *boarderstr = [NSString string];
    if (_item.FromToType == BubbleMessageTypeIncoming) {
        maskstr = @"sendmask.png";
        boarderstr = @"sendmaskborder";
    }else
    {
        maskstr = @"recvmask";
        boarderstr = @"recvmaskborder";
    }
    UIImageView * img = [[UIImageView alloc]init];
    img.image = [UIImage imageWithContentsOfFile:_item.MsgDatePath];
//    img.frame = CGRectMake(0, 0, imageFrame.size.width, imageFrame.size.height);
    img.contentMode = UIViewContentModeScaleAspectFill;
    [img setMaskWithImage:[[UIImage imageNamed:maskstr]resizableImageWithCapInsets:UIEdgeInsetsMake(30, 10, 10, 18)]];
    UIImage *boarderimag = [[UIImage imageNamed:boarderstr]resizableImageWithCapInsets:UIEdgeInsetsMake(30, 10, 10, 18)];
    UIImageView *sendImgBorder = [[UIImageView alloc] init];
//    sendImgBorder.frame = imageFrame;
    sendImgBorder.image = boarderimag;
    [sendImgBorder addSubview:img];
    
    [self addSubview:sendImgBorder];
}
#pragma mark 设置文件类型的cell
- (void)setFileCell
{
    
}
#pragma mark 设置语音文件类型的cell
- (void)setVoiceCell
{
    
}
#pragma mark 设置cell高
- (void)setCellHeight:(CGFloat)cellHeight
{
    _cellHeight = cellHeight;
}

@end
