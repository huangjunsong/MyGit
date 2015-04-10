//
//  publicTableViewCell.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/4.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "publicTableViewCell.h"
#import "CellModel.h"
#import "ArrowItem.h"
#import "LabelItem.h"
#import "SwitchItem.h"
#import "resolutionItemModel.h"
#define display [NSString stringWithFormat:@"mydiplay"]
#define resolusion [NSString stringWithFormat:@"640x480"]
@interface publicTableViewCell ()
{
    UIImageView *_arrow;
    UISwitch *_switch;
    UILabel *_label;
    UIView *_divider;
    UIImageView *_check;//预留勾选图片
    
}
@end

@implementation publicTableViewCell


+ (instancetype)settingCellWithTableView:(UITableView *)tableView
{
    // 0.用static修饰的局部变量，只会初始化一次
    static NSString *ID = @"publicCell";
    
    // 1.拿到一个标识先去缓存池中查找对应的Cell
    publicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果缓存池中没有，才需要传入一个标识创建新的Cell
    if (cell == nil) {
        cell = [[publicTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 1.设置背景
        [self setupBg];
        
        // 2.设置子控件属性
        [self setupSubviews];
        
        // 3.添加分隔线
        //[self setupDivider];

    }
    return self;
}
#pragma mark 设置背景
- (void)setupBg
{
    // 1.默认
    UIView *bg = [[UIView alloc] init];
    bg.backgroundColor = [UIColor whiteColor];
    self.backgroundView = bg;
    
    // 2.选中
    UIView *selectedBg = [[UIView alloc] init];
    selectedBg.backgroundColor = RGBACOLOR(237, 233, 218,1);
    self.selectedBackgroundView = selectedBg;
    
}
#pragma mark 设置子控件属性
- (void)setupSubviews
{
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.font = [UIFont systemFontOfSize:14];
    
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.font = [UIFont systemFontOfSize:12];
}
#pragma mark 添加分隔线
- (void)setupDivider
{
    UIView *divider = [[UIView alloc] init];
    divider.backgroundColor = RGBACOLOR(200, 200, 200,1);
    // 不能在这里设置分隔线的x值（原因：cell没有具体的数据，里面的label就不知道最终的位置）
        divider.frame = CGRectMake(0, 0,Screen_width, 1.5);
    [self.contentView addSubview:divider];
    _divider = divider;
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
//    _divider.hidden = indexPath.row == 0;
}

#pragma mark 设置视图控件
-(void)setItem:(CellModel *)item
{
    _item = item;
    
    // 设置数据
    
    self.textLabel.text = item.title;
    
    if ([item isKindOfClass:[ArrowItem class]]) {
        [self settingArrow];
    } else if ([item isKindOfClass:[SwitchItem class]]) {
        [self settingSwitch];
    } else if ([item isKindOfClass:[LabelItem class]]) {
        [self settingLabel];
    } else if ([item isKindOfClass:[resolutionItemModel class]]){
        [self setRightCheckImage];
    }else {
        // 什么也没有，清空右边显示的view
        self.accessoryView = nil;
        // 用默认的选中样式
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    
}
#pragma mark 设置右边的箭头
- (void)settingArrow
{
    if (_arrow == nil) {
        _arrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"common_icon_arrow.png"]];
    }
    self.accessoryView = _arrow;
    // 用默认的选中样式
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
}
#pragma mark 设置右边的开关
- (void)settingSwitch
{
    if (_switch == nil) {
        _switch = [[UISwitch alloc] init];
        [_switch addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];
    }
    
    // 设置开关的状态
    NSString *tId = [NSString stringWithFormat:@"tId = %ld",self.indexPath.row+1];
    NSArray * array =[Util searchDataWithClass:[keboardModel class] where:tId orderBy:nil offset:0 count:0];
    keboardModel *model = [array objectAtIndex:0];
    _switch.on = model.state;

    // 右边显示开关
    self.accessoryView = _switch;
    // 禁止选中
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
#pragma mark 设置开关方法
- (void)switchChange
{
//    SwitchItem *item = (SwitchItem *)_item;
    NSString *tId = [NSString stringWithFormat:@"tId = %ld",_indexPath.row+1];
    NSString *str = [NSString stringWithFormat:@" state = '%d'",_switch.on];
    [Util updateDataWithClass:[keboardModel class] set:str where:tId];
}
#pragma mark 设置中间的Label
- (void)settingLabel
{
    if (_label == nil) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(Screen_width/2-50, 0, 100, self.frame.size.height)];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.backgroundColor = [UIColor clearColor];
        _label.textColor = RGBACOLOR(173, 69, 14,1);
        _label.font = [UIFont systemFontOfSize:20];
    }
    LabelItem *item = (LabelItem *)_item;
    _label.text = item.middleName;
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    [self.contentView addSubview:_label];
}
#pragma mark 设置右边的勾
- (void)setRightCheckImage
{
    if (_check == nil) {
        _check = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"check48"]];
    }
//    NSLog(@"%d",self.indexPath.row);
    self.accessoryView = _check;
    self.accessoryView.hidden = YES;
        NSString *str = [NSUserDefaultTool objectForKey:display];
        
        if (str == NULL || [str isEqualToString:@""]) {
            if ([self.textLabel.text isEqualToString:resolusion]) {
                self.accessoryView.hidden = NO;
                [NSUserDefaultTool setObject:resolusion forKey:display];
            }
        }else
        {
            if ([self.textLabel.text isEqualToString: str]) {
                self.accessoryView.hidden = NO;
                
            }
        }
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
@end
