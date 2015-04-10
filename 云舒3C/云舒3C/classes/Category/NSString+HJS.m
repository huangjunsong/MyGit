//
//  NSString+HJS.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/1.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "NSString+HJS.h"

@implementation NSString (HJS)
- (NSString *)strTrim:(NSString *)str
{
    if (str == NULL) {
        return @"";
    }
    NSString *reseted = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return reseted;
}
@end
