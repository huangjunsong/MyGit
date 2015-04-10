//
//  ResolutionViewController.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/4.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "ResolutionViewController.h"
#import "resolutionItemModel.h"
#import "groupModel.h"
@implementation ResolutionViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"更多";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setResolusionItem];
    [self setBackBarItem];
}
- (void)setBackBarItem
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"backbut" highlightedIcon:@"backbut2" target:self action:@selector(popToMoreView) name:@"返回" frame:CGRectMake(0, 0, 45, 30)];
}
- (void)popToMoreView
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setResolusionItem
{
    resolutionItemModel *display1 = [resolutionItemModel itemWithTitle:@"640x480"];
    
    resolutionItemModel *display2 = [resolutionItemModel itemWithTitle:@"800x600"];
    
    resolutionItemModel *display3 = [resolutionItemModel itemWithTitle:@"1024x768"];
   
    resolutionItemModel *display4 = [resolutionItemModel itemWithTitle:@"1280x1024"];
    
    resolutionItemModel *display5 = [resolutionItemModel itemWithTitle:@"1440x900"];
    
    resolutionItemModel *display6 = [resolutionItemModel itemWithTitle:@"1680x1050"];
    
    resolutionItemModel *display7 = [resolutionItemModel itemWithTitle:@"1920x1200"];
    
    groupModel *group = [[groupModel alloc]init];
    group.header = @"设置分辨率";
    group.items = @[display1,display2,display3,display4,display5,display6,display7];
    [_groupArray addObject:group];
}
@end
