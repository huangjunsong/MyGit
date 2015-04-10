//
//  MoreViewController.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/4.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "MoreViewController.h"
#import "ArrowItem.h"
#import "LabelItem.h"
#import "ResolutionViewController.h"
#import "KeyboardViewController.h"
#import "About3CViewcontroller.h"
#import "groupModel.h"
@implementation MoreViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"更多";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self set4GroupsItem];
    
}
- (void)set4GroupsItem
{
    //1.显示
    ArrowItem *display = [ArrowItem itemWithTitle:@"显示"];
    display.showClass = [ResolutionViewController class];
    //2.键盘
    ArrowItem *keyboard = [ArrowItem itemWithTitle:@"键盘"];
    keyboard.showClass = [KeyboardViewController class];
    //3.关于
    ArrowItem *about = [ArrowItem itemWithTitle:@"关于Cloudsoar 3C"];
    about.showClass = [About3CViewcontroller class];
    //4.退出登录
    LabelItem *logOut = [LabelItem itemWithTitle:nil];
    logOut.middleName = @"退出登录";
    //第一组
    groupModel *group1 = [[groupModel alloc]init];
    group1.items = @[display];
    //第二组
    groupModel *group2 = [[groupModel alloc]init];
    group2.items = @[keyboard];
    //第三组
    groupModel *group3 = [[groupModel alloc]init];
    group3.items = @[about];
    //第四组
    groupModel *group4 = [[groupModel alloc]init];
    group4.items = @[logOut];
    //加入大数组
    [_groupArray addObject:group1];
    [_groupArray addObject:group2];
    [_groupArray addObject:group3];
    [_groupArray addObject:group4];
}
@end
