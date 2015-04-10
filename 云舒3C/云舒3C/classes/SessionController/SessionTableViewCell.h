//
//  SessionTableViewCell.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/6.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SessionModel.h"
@interface SessionTableViewCell : UITableViewCell
@property (nonatomic ,strong)SessionModel *item;
+(NSString *)cellID;
+ (SessionTableViewCell *)SessionCell;
@end
