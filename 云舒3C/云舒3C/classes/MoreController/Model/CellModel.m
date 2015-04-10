//
//  CellModel.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/3.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel
+ (id)itemWithTitle:(NSString *)title
{
    CellModel *item = [[self alloc]init];
    item.title = title;
    return item;
}
@end
