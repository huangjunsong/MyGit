//
//  ServerListTableViewCell.h
//  云舒3C
//
//  Created by Junsong Huang on 15/2/28.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kCellTypeArrow,
    kCellTypeLabel,
}  CellType;
@interface ServerListTableViewCell : UITableViewCell
@property (nonatomic, strong) id delegate;
@property (nonatomic, assign)CellType celltype;
@property (nonatomic, weak)UITableView *serverListTable;
- (void)setIndexPath:(NSIndexPath *)indexPath;
- (void)setCellTypeWithName:(NSArray *)data indexPath:(NSIndexPath*)indexPath;
@end

@protocol ServerListTableViewCellDelegate <NSObject>
@optional
//-(void)editchage_:(UITextField*)text;
-(void)pushToEditViewWithIndex:(NSInteger)index;
@end