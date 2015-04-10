//
//  keboardModel.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/3.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface keboardModel : NSObject
@property (nonatomic ,assign)int tId;
@property(copy,nonatomic) NSString *name;
@property(copy,nonatomic) NSString *value;
@property(copy,nonatomic) NSString *extention;
@property (nonatomic ,assign)bool state;
@end
