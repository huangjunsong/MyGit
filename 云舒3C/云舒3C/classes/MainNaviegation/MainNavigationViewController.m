//
//  MainNavigationViewController.m
//  云舒3C
//
//  Created by Junsong Huang on 15/2/27.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "MainNavigationViewController.h"

@interface MainNavigationViewController ()

@end

@implementation MainNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self setNavigationBar];
}
- (void)setNavigationBar
{
    [self.navigationBar setBarTintColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_bottom_bg"]]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
