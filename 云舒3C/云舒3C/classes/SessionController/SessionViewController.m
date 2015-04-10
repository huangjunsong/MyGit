//
//  SessionViewController.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/9.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "SessionViewController.h"
#import "SessionTableViewCell.h"
#import "MessageViewController.h"
@interface SessionViewController ()
{
    UISearchBar *_search;
    MessageViewController *_messageView;
}
@end

@implementation SessionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息";
    [self setSessionTable];
}
- (void)setSessionTable
{
    UITableView *tableView =[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SessionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[SessionTableViewCell cellID]];
    if (cell == nil) {
        cell = [SessionTableViewCell SessionCell];
    }
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        UISearchBar *search = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, Screen_width, 45)];
        _search = search;
        return search;
    }
    
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_messageView == nil) {
        _messageView = [[MessageViewController alloc]init];
    }
    [self.navigationController pushViewController:_messageView animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
