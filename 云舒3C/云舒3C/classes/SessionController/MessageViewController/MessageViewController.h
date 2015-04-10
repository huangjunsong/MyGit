//
//  MessageViewController.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/11.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageToolBar.h"

@interface MessageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,MessageToolBarDelegate>

@end
