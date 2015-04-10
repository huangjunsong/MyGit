//
//  Util.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/1.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "Util.h"
#import "sys/utsname.h"

@interface Util ()

@end
@implementation Util
//+ (Util *)shareUtil
//{
//    static Util *myutil = nil;
//    static dispatch_once_t predicate;
//    dispatch_once(&predicate, ^{
//        myutil = [[Util alloc]init];
//    });
//    return myutil;
//}
#pragma mark 数据库操作
+ (NSArray *)searchDataWithClass:(Class )class where:(NSString *)where orderBy:(NSString *)orderBy offset:(int)offset count:(int)count
{
    LKDBHelper *lkdb = [LKDBHelper getUsingLKDBHelper];
    
    return  [lkdb search:class where:where orderBy:orderBy offset:offset count:count];
}

+(BOOL)dropTable:(Class)class
{
    LKDBHelper *lkdb = [LKDBHelper getUsingLKDBHelper];
   return [lkdb dropTableWithClass:class];
}

+ (void)dropAllTable
{
    LKDBHelper *lkdb = [LKDBHelper getUsingLKDBHelper];
    [lkdb dropAllTable];
}

+ (BOOL)insertData:(NSObject *)data
{
    LKDBHelper *lkdb = [LKDBHelper getUsingLKDBHelper];
    return [lkdb insertToDB:data];
}

+ (void)deleteData:(Class)class where:(NSString *)where
{
    LKDBHelper *lkdb = [LKDBHelper getUsingLKDBHelper];
    [lkdb deleteWithClass:class where:where];
}
+ (BOOL)updateDataWithClass:(Class)class set:(NSString *)set where:(NSString *)where
{
    LKDBHelper *lkdb = [LKDBHelper getUsingLKDBHelper];
    return [lkdb updateToDB:class set:set where:where];
}
#pragma mark 正则表达式检测
+ (BOOL)isValidIp:(NSString *)ipAddress
{
    NSString  *urlRegEx =@"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
    
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:ipAddress];
}

+(BOOL)isValidateDomainName:(NSString*)dName
{
    
    BOOL isOK=NO;
    NSString *reg = @"(?<=//|)((\\w)+\\.)+\\w+";
    
    
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", reg];
    BOOL ok1=[urlTest evaluateWithObject:dName];
    if (ok1)
    {//第一个验证通过，开始第二个验证
        int fsIndex=(int)[dName rangeOfString:@"." options:NSBackwardsSearch].location;
        NSString *temp = [dName substringFromIndex:fsIndex+1];
        
        //判断这个字符串是否是数字
//        NSString *mystring = @"Letter1234";
        NSString *regex = @"^[A-Za-z]+$";
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        
        if ([predicate evaluateWithObject:temp] == YES) {
            //implement
            isOK = YES;
        }
//        NSScanner* scan = [NSScanner scannerWithString:temp];
//        int val;
//        while (![scan isAtEnd]) {
//            [scan scanInt:&val];
//            if (![scan scanInt:&val]) {
//                isOK = YES;
//            }else
//            {
//                isOK = NO;
//            }
//        }
//        if(!([scan scanInt:&val] && [scan isAtEnd]))
//        {
//            isOK=YES;
//        }
    }
    
    return isOK;
}
#pragma mark 系统信息相关
+ (CGFloat)systemVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue] ;
}
+ (NSString*)deviceString
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([deviceString isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([deviceString isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([deviceString isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([deviceString isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    return deviceString;
}
+ (CGRect)returnScreenFrame
{
    return [UIScreen mainScreen].applicationFrame;
}
+ (BOOL)smallIphoneScreen
{
    if ([[self deviceString] isEqualToString:@"iPhone 4"] || [[self deviceString] isEqualToString:@"iPhone 4S"]) {
        return YES;
    }
    return NO;
}
+ (BOOL)middleIphoneScreen
{
    if ([[self deviceString] isEqualToString: @"iPhone 5"] || [[self deviceString] isEqualToString:@"iPhone 5c"] || [[self deviceString] isEqualToString:@"iPhone 5s"]) {
        return YES;
    }
    return NO;
}
+ (UIColor *)returnBgColor
{
   return [UIColor colorWithRed:222/255 green:222/255 blue:222/255 alpha:1];
}
+ (CGRect)returnToolBarFrame
{
    int h = kIOS6;
    if ([Util systemVersion]>=7.0) {
        h = kIOS7;
    }
  return  CGRectMake(0, Screen_height - kToolBarH -h, Screen_width, kToolBarH);
}
+ (CGFloat)returnNavigationbarHight
{
    int h = kIOS6;
    if ([Util systemVersion]>=7.0) {
        h = kIOS7;
    }
    return h;
}
+ (NSDictionary *)returnemojiDict
{
    static NSDictionary *emojiDict = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        NSString *emojiFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"emotionImage.plist"];
        emojiDict = [[NSDictionary alloc]  initWithContentsOfFile:emojiFilePath];
    });
    return emojiDict;
}
//static NSString *curLanaguage=@"";
+ (NSString*)getCurrenLanguage
{
//    if ([curLanaguage isEqualToString:@""] || curLanaguage.length==0)
//    {
        NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
        NSArray* languages = [defs objectForKey:@"AppleLanguages"];
        NSString * curLanaguage = [languages objectAtIndex:0];
//    }
    return curLanaguage;//preferredLang;
}
+ (NSString *)getCurrentTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yy-MM-dd HH:mm:ss"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
}
@end
