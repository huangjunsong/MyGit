//
//  ServerListViewController.m
//  云舒3C
//
//  Created by Junsong Huang on 15/2/27.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "ServerListViewController.h"
#import "TabbarViewController.h"
#import "addServerListTableViewController.h"
@interface ServerListViewController ()
{
    NSArray *data;
    TabbarViewController *_tabbar;
}
@property (weak, nonatomic) IBOutlet UITableView *Listtable;


@end

@implementation ServerListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _Listtable.delegate = self;
    _Listtable.dataSource = self;
    [_Listtable setTableFooterView:[UIView new]];
    [_Listtable setBackgroundColor:[UIColor clearColor]];
    [self setTopbar];
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [self insertDemoData];
    [self getDataFromLKDB];
    [_Listtable reloadData];
}
- (void)insertDemoData
{
    NSArray *arr = [Util searchDataWithClass:[ServerInfoTable class] where:@"colonyName = '云舒3C demo'" orderBy:nil offset:0 count:0];
    if (arr.count == 0) {
        ServerInfoTable *server = [[ServerInfoTable alloc]init];
        server.colonyName = @"云舒3C demo";
        server.ServerIp = @"www.cloudsoar.net";
        server.UserName = @"test01";
        server.Password = @"Cs123456";
        server.dataState = 1;
        [Util insertData:server];
    }
}
- (void)getDataFromLKDB
{
    data = [Util searchDataWithClass:[ServerInfoTable class] where:nil orderBy:nil offset:0 count:0];
}
- (void)setTopbar
{
    self.title = @"集群列表";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"but1" highlightedIcon:@"rectbut" target:self action:@selector(pushToAddView) name:@"新增" frame:CGRectMake(0, 0, 45, 30)];
}
- (void)pushToAddView
{
    NSString *path = @"Storyboard";
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle bundleWithPath:path]];
    addServerListTableViewController *add = [story instantiateViewControllerWithIdentifier:@"addServer"];
    [self.navigationController pushViewController:add animated:YES];
}
- (void)viewDidLayoutSubviews
{
    if ([_Listtable respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [_Listtable setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        
    }
    if ([_Listtable respondsToSelector:@selector(setLayoutMargins:)]) {
        [_Listtable setLayoutMargins:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_Listtable respondsToSelector:@selector(setSeparatorInset:)]) {
         [_Listtable setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_Listtable respondsToSelector:@selector(setLayoutMargins:)]) {
        [_Listtable setLayoutMargins:UIEdgeInsetsZero];
    }
}
#pragma mark cell的代理方法
-(void)pushToEditViewWithIndex:(NSInteger)index
{
    NSString *path = @"Storyboard";
    UIStoryboard * story = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle bundleWithPath:path]];
    addServerListTableViewController *addView = [story instantiateViewControllerWithIdentifier:@"addServer"];
    addView.isEditView = YES;
    addView.infoTable = [data objectAtIndex:index];
    [self.navigationController pushViewController:addView animated:YES];
    
}


//代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = data.count;
    if (count <= 6) {
        _Listtable.scrollEnabled = NO;
    }else{
        _Listtable.scrollEnabled = YES;
    }
    return count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"cell";
    ServerListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    
    if (cell == nil) {
        cell = [[ServerListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.delegate = self;
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.celltype = kCellTypeArrow;
    cell.serverListTable = _Listtable;

    [cell setIndexPath:indexPath];
    [cell setCellTypeWithName:data indexPath:indexPath];
    return cell;
}
#pragma mark 这里采取界面重用，在本界面加载数据，加载完成后再传入tab的子界面中显示
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_tabbar == nil) {
        NSString *path = @"Storyboard";
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle bundleWithPath:path]];
        TabbarViewController *tabbar = [story instantiateViewControllerWithIdentifier:@"tabbarView"];
        _tabbar = tabbar;
    }
    
    [self.navigationController pushViewController:_tabbar animated:YES];
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
