//
//  editServerViewController.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/1.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface editServerViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)ServerInfoTable *editData;
@end
