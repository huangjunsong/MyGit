//
//  Util.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/1.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIBarButtonItem+HJS.h"
#import "UIImage+HJS.h"
#import "UINavigationItem+HJS.h"
#import "LKDBHelper.h"
#import "ServerInfoTable.h"
#import "NSString+HJS.h"
#import "NSUserDefaultTool.h"
#import "keboardModel.h"
#import "PublicButton.h"
#import "MessageCellTable.h"

#define Screen_height   [[UIScreen mainScreen] bounds].size.height
#define Screen_width    [[UIScreen mainScreen] bounds].size.width
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define kToolBarH 44
#define kTextFieldH 30
#define kIOS6 44
#define kIOS7 64
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@interface Util : NSObject



//数据库操作
+ (NSArray *)searchDataWithClass:(Class )class where:(NSString *)where orderBy:(NSString *)orderBy offset:(int)offset count:(int)count;//查
+(BOOL)dropTable:(Class)class;//丢一个
+ (void)dropAllTable;//全丢
+ (BOOL)insertData:(NSObject *)data;//插
+ (void)deleteData:(Class)class where:(NSString *)where;//删
+ (BOOL)updateDataWithClass:(Class)class set:(NSString *)set where:(NSString *)where;//改
//正则表达式检测
+ (BOOL)isValidIp:(NSString *)ipAddress;
+(BOOL)isValidateDomainName:(NSString*)dName;
//判断设备
+ (CGFloat)systemVersion;
+ (NSString*)deviceString;
//屏幕大小
+ (BOOL)smallIphoneScreen;
+ (BOOL)middleIphoneScreen;
+ (CGRect)returnScreenFrame;
//默认背景
+ (UIColor *)returnBgColor;
//两种系统下导航栏的frame
+ (CGRect)returnToolBarFrame;
//返回iOS6或7的导航栏高度
+ (CGFloat)returnNavigationbarHight;
//获得当前语言
+ (NSString*)getCurrenLanguage;
//获取当前时间
+ (NSString *)getCurrentTime;
@end
