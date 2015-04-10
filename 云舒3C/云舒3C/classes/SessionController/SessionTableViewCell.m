//
//  SessionTableViewCell.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/6.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "SessionTableViewCell.h"

@interface SessionTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headPortrait;
@property (weak, nonatomic) IBOutlet UILabel *SessionName;
@property (weak, nonatomic) IBOutlet UILabel *SessionTime;
@property (weak, nonatomic) IBOutlet UILabel *LastMessage;

@end

@implementation SessionTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}
+(NSString *)cellID
{
    return @"SessionCell";
}
+ (SessionTableViewCell *)SessionCell
{
    NSArray *xibArray = [[NSBundle mainBundle] loadNibNamed:@"SessionTableViewCell" owner:nil options:nil];
    return xibArray[0];
}
-(void)setItem:(SessionModel *)item
{
    _item = item;
    _SessionName.text = item.titleName;
    _SessionTime.text = item.date;
    _LastMessage.text = item.lastText;
    _headPortrait.image = [UIImage imageNamed:item.headImg];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
