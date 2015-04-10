//
//  MessageCellTable.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/11.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "MessageCellTable.h"

@implementation MessageCellTable
+(void)dbWillInsert:(NSObject *)entity
{
    NSLog(@"will insert : %@",NSStringFromClass(self));
    
    NSArray *ary = [[LKDBHelper getUsingLKDBHelper] search:[MessageCellTable class] where:nil orderBy:@" msgId desc" offset:0 count:0];
    int tid=0;
    if (ary.count >0) {
        MessageCellTable *s=[ary objectAtIndex:0];
        if (s) {
            tid=s.msgId;
        }
    }
    
    
    MessageCellTable *ser = (MessageCellTable*)entity;
    ser.msgId=tid+1;
    
}

+(void)dbDidInserted:(NSObject *)entity result:(BOOL)result
{
    NSLog(@"did insert : %@",NSStringFromClass(self));
}


+(NSDictionary *)getTableMapping
{
    
    return @{
             @"sessionId":LKSQLInherit,
             @"msgId":LKSQLInherit,
             @"msgType":LKSQLInherit,
             @"loginUserId":LKSQLInherit,
             @"loginUserName":LKSQLInherit,
             @"msgText":LKSQLInherit,
             @"msgDatePath":LKSQLInherit,
             @"isShowMsgData":LKSQLInherit,
             @"headImage":LKSQLInherit,
             @"FromToType":LKSQLInherit, //新添加的一个字段
             @"offlineMsgId":LKSQLInherit,
             @"sendMsgUserId":LKSQLInherit
             };
}
+(NSString *)getPrimaryKey
{
    return @"msgId";
}
+(NSString *)getTableName
{
    return @"MessageCellTable";
}
+(int)getTableVersion
{
    return 1;
}
+(LKTableUpdateType)tableUpdateForOldVersion:(int)oldVersion newVersion:(int)newVersion
{
    //    switch (oldVersion) {
    //        case 1:
    //        {
    //            [self tableUpdateAddColumeWithPN:@"color"];
    //        }
    //        case 2:
    //        {
    //            [self tableUpdateAddColumeWithName:@"address" sqliteType:LKSQLText];
    //        }
    //            break;
    //    }
    return LKTableUpdateTypeCustom;
}
@end
