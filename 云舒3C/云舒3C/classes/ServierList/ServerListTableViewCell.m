//
//  ServerListTableViewCell.m
//  云舒3C
//
//  Created by Junsong Huang on 15/2/28.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "ServerListTableViewCell.h"

@interface ServerListTableViewCell ()
{
    UIImageView *_bg;
    UIImageView *_selectedBg;
    UIImageView *_rightArrow;
    NSArray *editData;//给编辑页面使用的数据
    NSArray *lableData;//那四个死文字
}
@end

@implementation ServerListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _bg = [[UIImageView alloc]init];
        self.backgroundView = _bg;
        _selectedBg = [[UIImageView alloc]init];
        self.selectedBackgroundView = _selectedBg;
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setCellTypeWithName:(NSArray *)data indexPath:(NSIndexPath*)indexPath
{
    if (_celltype == kCellTypeArrow) {
        
        [self setArrowcellViewWithIndex:indexPath.row];
        editData = data;
        ServerInfoTable *server = [data objectAtIndex:indexPath.row];
        self.textLabel.text = server.colonyName;
        
    }else if (_celltype ==kCellTypeLabel)
    {
//        editData = data;
        [self setCellView:indexPath];
    }
}
- (void)pushToEditView:(UIButton *)btn
{
    [self.delegate pushToEditViewWithIndex:btn.tag];
    
}

#pragma mark 三个服务界面的cell界面处理
//- (void)setEditView:(NSInteger)index
//{
//    [self setStaticLable:index];
//}
- (void)setArrowcellViewWithIndex:(NSInteger)index
{
    UIImageView *imageview =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_arrow.png"]];
    imageview.userInteractionEnabled = YES;
    self.accessoryView = imageview;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = index;
    btn.frame = CGRectMake(0, 0, self.accessoryView.frame.size.width, self.accessoryView.frame.size.height);
    [imageview addSubview:btn];
    [btn addTarget:self action:@selector(pushToEditView:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)setCellView:(NSIndexPath *)indexPath
{
    [self setStaticLable:indexPath.row];
    }
- (void)setStaticLable:(NSInteger)index
{
    NSArray *arr = @[@"集群名称：",@"服务器IP：",@"用户名：",@"密码："];
    NSString *str = [arr objectAtIndex:index];
    CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:20] constrainedToSize:CGSizeMake(3000, 0)];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(118 - size.width, 8, size.width, size.height)];
    label.font = [UIFont systemFontOfSize:20];
    label.text = str;
    [self.contentView addSubview:label];
}
//- (void)editChanged:(UITextField *)textfield
//{
//    [self.delegate editchage_:textfield];
//}
- (void)setIndexPath:(NSIndexPath *)indexPath
{
    NSInteger count = [_serverListTable numberOfRowsInSection:indexPath.section];
    if (count == 1) { // 这组只有1行
        _bg.image = [UIImage resizeImage:@"common_card_background.png"];
        _selectedBg.image = [UIImage resizeImage:@"common_card_background_highlighted.png"];
    }else if (indexPath.row ==0) {
        _bg.image = [UIImage resizeImage:@"common_card_top_background.png"];
        _selectedBg.image = [UIImage resizeImage:@"common_card_top_background_highlighted.png"];
    }else if(indexPath.row == count - 1)
    {
        _bg.image = [UIImage resizeImage:@"common_card_bottom_background.png"];
        _selectedBg.image = [UIImage resizeImage:@"common_card_bottom_background_highlighted.png"];
    }else
    {
        _bg.image = [UIImage resizeImage:@"common_card_middle_background.png"];
        _selectedBg.image = [UIImage resizeImage:@"common_card_middle_background_highlighted.png"];
    }
}
@end
