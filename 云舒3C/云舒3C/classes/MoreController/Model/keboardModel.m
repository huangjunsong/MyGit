//
//  keboardModel.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/3.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "keboardModel.h"

@implementation keboardModel
+(void)dbWillInsert:(NSObject *)entity
{
    NSLog(@"will insert : %@",NSStringFromClass(self));
    
    NSArray *ary = [[LKDBHelper getUsingLKDBHelper] search:[keboardModel class] where:nil orderBy:@" tId desc" offset:0 count:0];
    int tid=0;
    if (ary.count >0) {
        keboardModel *s=[ary objectAtIndex:0];
        if (s) {
            tid=s.tId;
        }
    }
    
    
    keboardModel *ser = (keboardModel*)entity;
    ser.tId=tid+1;
    
}

+(void)dbDidInserted:(NSObject *)entity result:(BOOL)result
{
    NSLog(@"did insert : %@",NSStringFromClass(self));
}


+(NSDictionary *)getTableMapping
{
    
    return @{
             @"tId":LKSQLInherit,
             @"name":LKSQLInherit,
             @"value":LKSQLInherit,
             @"extention":LKSQLInherit,
             @"state":LKSQLInherit
             };
}
+(NSString *)getPrimaryKey
{
    return @"tId";
}
+(NSString *)getTableName
{
    return @"keboardModel";
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
