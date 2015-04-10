//
//  addServerListTableViewController.h
//  云舒3C
//
//  Created by Junsong Huang on 15/2/28.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerListTableViewCell.h"

@interface addServerListTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,ServerListTableViewCellDelegate,UITextFieldDelegate,UIAlertViewDelegate>
@property (nonatomic ,assign)BOOL isEditView;
@property (nonatomic ,strong)ServerInfoTable *infoTable;

@end
