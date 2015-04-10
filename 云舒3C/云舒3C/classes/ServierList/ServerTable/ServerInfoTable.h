//
//  ServerInfoTable.h
//  云舒3C
//
//  Created by Junsong Huang on 15/2/28.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LKDBHelper.h"

@interface ServerInfoTable : NSObject

@property(assign,nonatomic) int tId;
@property(copy,nonatomic) NSString *colonyName;//集群名称
@property(copy,nonatomic) NSString *ServerIp;//服务器IP
@property(copy,nonatomic) NSString *UserName;//用户名
@property(copy,nonatomic) NSString *Password;//密码
@property(assign,nonatomic) int dataState;//数据状态

@end
