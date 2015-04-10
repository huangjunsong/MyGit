//
//  SwitchItem.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/4.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "SwitchItem.h"

@implementation SwitchItem
- (void)setKeyboardTableValue:(NSString *)value name:(NSString *)name extention:(NSString *)extention state:(BOOL)state
{
    keboardModel *model = [[keboardModel alloc]init];
    model.value = value;
    model.name = name;
    model.extention = extention;
    model.state = state;
    [Util insertData:model];
}
@end
