//
//  SessionTable.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/6.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SessionTable : NSObject
@property (nonatomic ,assign)int SessionId;//会话主键
@property(copy,nonatomic) NSString *usersId;//参与者ID
@property (nonatomic ,assign)int loginUserId;
@property (nonatomic ,strong)NSString *SessionName;
@end
