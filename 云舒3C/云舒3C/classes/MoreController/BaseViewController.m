//
//  BaseViewController.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/4.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "BaseViewController.h"
#import "publicTableViewCell.h"
#import "groupModel.h"
#import "CellModel.h"
#import "ArrowItem.h"
#import "resolutionItemModel.h"
#define display [NSString stringWithFormat:@"mydiplay"]

const int ILCellSectionHeaderH = 20;
@implementation BaseViewController


- (void)loadView
{
    _groupArray = [NSMutableArray array];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[Util returnScreenFrame] style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    // 设置背景
    tableView.backgroundView = nil;
    tableView.backgroundColor = [Util returnBgColor];
    
    // group状态下，sectionFooterHeight和sectionHeaderHeight是有值的
    tableView.sectionFooterHeight = 0;
    tableView.sectionHeaderHeight = ILCellSectionHeaderH;
    
    // 在tableView初始化的时候设置contentInset
    // 在tableView展示完数据的时候给contentInset.top增加64的值
    if ([Util systemVersion] >= 7.0) {
        tableView.contentInset = UIEdgeInsetsMake(ILCellSectionHeaderH - 35, 0, 0, 0);
    }
    
    // 隐藏分隔线
    //tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.view = tableView;
    _tableView = tableView;
}

- (void)viewDidLayoutSubviews
{
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [_tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        
    }
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [_tableView setLayoutMargins:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [_tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _groupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    groupModel *model = _groupArray[section];
    
    return model.items.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    publicTableViewCell *cell = [publicTableViewCell settingCellWithTableView:tableView];
    groupModel *group = _groupArray[indexPath.section];
    cell.indexPath = indexPath;
    cell.item = group.items[indexPath.row];
    cell.table = tableView;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 去除选中时的背景
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 0.取出这行对应的模型
    groupModel *group = _groupArray[indexPath.section];
    CellModel *item = group.items[indexPath.row];
    
    // 1.取出这行对应模型中的block代码
    if (item.operation) {
        // 执行block
        item.operation();
        return;
    }
    //2.设置分辨率界面的处理
    if ([item isKindOfClass:[resolutionItemModel class]]) {
        publicTableViewCell *cell = (publicTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
        [NSUserDefaultTool setObject:cell.textLabel.text forKey:display];
        [_tableView reloadData];
        
    }
    // 3.检测有没有要跳转的控制器
    if ([item isKindOfClass:[ArrowItem class]]) {
        ArrowItem *arrowItem = (ArrowItem *)item;
        if (arrowItem.showClass) {
            UIViewController *vc = [[arrowItem.showClass alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
}
#pragma mark 返回每一组的header标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    groupModel *group = _groupArray[section];
    
    return group.header;
}
#pragma mark 返回每一组的footer标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    groupModel *group = _groupArray[section];
    
    return group.footer;
}

@end
