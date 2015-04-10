//
//  BaseViewController.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/4.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_groupArray;
}
@property (nonatomic, weak, readonly) UITableView *tableView;
@end
