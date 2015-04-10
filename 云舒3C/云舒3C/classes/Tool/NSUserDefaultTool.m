//
//  NSUserDefaultTool.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/3.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#define NSUserDefault [NSUserDefaults standardUserDefaults]
#import "NSUserDefaultTool.h"

@implementation NSUserDefaultTool
+ (id)objectForKey:(NSString *)defaultName
{
    return [NSUserDefault objectForKey:defaultName];
}

+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    [NSUserDefault setObject:value forKey:defaultName];
    [NSUserDefault synchronize];
}

+ (BOOL)boolForKey:(NSString *)defaultName
{
    return [NSUserDefault boolForKey:defaultName];
}

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName
{
    [NSUserDefault setBool:value forKey:defaultName];
    [NSUserDefault synchronize];
}
@end
