//
//  TabbarViewController.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/2.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "TabbarViewController.h"
#import "Tabbar.h"
@interface TabbarViewController ()<TabBarDelegate>
@property (strong, nonatomic)NSArray *staticedArray;
@end

@implementation TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *array = @[@"3C",@"应用资源",@"通讯录",@"设置"];
    _staticedArray = array;
    if ([Util systemVersion] > 7.0) {
        // 1.UIRectEdgeNone不要往四周边缘展开(按照非iOS7的传统来展示)
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        // 2.让所有的子控制器都不能展开
        for (UIViewController *vc in self.childViewControllers) {
            vc.edgesForExtendedLayout = UIRectEdgeNone;
        }
        
        // NO代表展开的时候不要包含那个条
        //        self.extendedLayoutIncludesOpaqueBars = NO;
    }
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        [self.tabBar removeFromSuperview];
        TabBar *myTabBar = [[TabBar alloc]init];
        myTabBar.frame = self.tabBar.frame;
        myTabBar.delegate = self;
        [self.view addSubview:myTabBar];
        for (int i = 1; i<=4; i++) {
            NSString *normal = [NSString stringWithFormat:@"TabBar%d", i];
            NSString *selected = [normal stringByAppendingString:@"Sel"];
            [myTabBar addTabBarButton:normal selIcon:selected name:[_staticedArray objectAtIndex:i - 1]];
        }
    });
    
}
- (void)tabBar:(TabBar *)tabBar didSelectButtonFrom:(NSUInteger)from to:(NSUInteger)to
{
//    NSLog(@"%ld to %ld",from,to);
    self.selectedIndex = to;
    //    self.selectedViewController = self.childViewControllers[to];
    
    UITableViewController *newVC = self.childViewControllers[to];
    [self.navigationItem copyItmeTo:newVC.navigationItem];
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
