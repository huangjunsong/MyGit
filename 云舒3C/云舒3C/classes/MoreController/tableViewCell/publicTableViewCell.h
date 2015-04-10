//
//  publicTableViewCell.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/4.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CellModel;
@interface publicTableViewCell : UITableViewCell
@property (nonatomic, strong) CellModel *item;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic ,strong)UITableView *table;
+ (instancetype)settingCellWithTableView:(UITableView *)tableView;
@end
