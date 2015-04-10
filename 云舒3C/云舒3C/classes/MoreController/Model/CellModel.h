//
//  CellModel.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/3.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject
@property(copy,nonatomic) NSString *title;
@property(copy,nonatomic) void (^operation)();
+ (id)itemWithTitle:(NSString *)title;
@end
