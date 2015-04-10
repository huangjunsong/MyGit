//
//  NSUserDefaultTool.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/3.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaultTool : NSObject
+ (id)objectForKey:(NSString *)defaultName;
+ (void)setObject:(id)value forKey:(NSString *)defaultName;

+ (BOOL)boolForKey:(NSString *)defaultName;
+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName;
@end
