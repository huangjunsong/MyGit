//
//  SwitchItem.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/4.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "valueModel.h"

@interface SwitchItem : valueModel
@property (nonatomic ,assign)BOOL off;
- (void)setKeyboardTableValue:(NSString *)value name:(NSString *)name extention:(NSString *)extention state:(BOOL)state;
@end
