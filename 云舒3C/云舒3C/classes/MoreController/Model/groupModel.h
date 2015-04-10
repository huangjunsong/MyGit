//
//  groupModel.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/4.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface groupModel : NSObject
@property(copy,nonatomic) NSString *header;
@property(copy,nonatomic) NSString *footer;
@property (nonatomic ,strong)NSArray *items;
@end
