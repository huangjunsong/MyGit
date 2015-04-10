//
//  MessageTableViewCell.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/10.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQRichTextView.h"
@interface MessageTableViewCell : UITableViewCell<TQRichTextViewDelegate>
@property (nonatomic ,strong)MessageCellTable *item;
@property (nonatomic ,assign, readonly)CGFloat cellHeight;
+ (instancetype)settingCellWithTableView:(UITableView *)tableView;
@end
