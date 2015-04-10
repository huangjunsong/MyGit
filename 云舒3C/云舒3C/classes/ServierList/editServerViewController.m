//
//  editServerViewController.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/1.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "editServerViewController.h"
#import "ServerListTableViewCell.h"
#import "UIBarButtonItem+HJS.h"
@interface editServerViewController ()
{
    NSString *str1;
    NSString *str2;
    NSString *str3;
    NSString *str4;
}
@property (weak, nonatomic) IBOutlet UITableView *editListTable;
@property (strong, nonatomic) NSArray *array;//占位文字
@property (strong, nonatomic) NSArray *infoArray;//已填文字
@property (strong, nonatomic) NSMutableArray *textFileArray;//text数组
@end

@implementation editServerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _editListTable.delegate = self;
    _editListTable.dataSource = self;
    [_editListTable setTableFooterView:[UIView new]];
    [_editListTable setBackgroundColor:[UIColor clearColor]];
    _editListTable.scrollEnabled = NO;
    NSArray *arr1 = @[@"请输入集群名",@"请输入服务器IP/域名",@"请输入用户名",@"请输入密码"];
    _array = arr1;
    _infoArray = @[_editData.colonyName,_editData.ServerIp,_editData.UserName,_editData.Password];
    _textFileArray = [[NSMutableArray alloc]initWithCapacity:4];
}
- (void)setTopbar
{
    self.title = _editData.colonyName;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"backbut" highlightedIcon:@"backbut2" target:self action:@selector(popToServerview) name:@"返回" frame:CGRectMake(0, 0, 45, 30)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"but1" highlightedIcon:@"rectbut" target:self action:@selector(saveServer) name:@"存储" frame:CGRectMake(0, 0, 45, 30)];
}
#pragma mark 导航栏的两个事件
- (void)popToServerview
{
    [self.navigationController popViewControllerAnimated:YES];
}

//- (void)saveServer
//{
//    [self getTextFromtextFiled];
//    if ([self checkTheString]) {
//        LKDBHelper *dbHelper = [LKDBHelper getUsingLKDBHelper];
//        ServerInfoTable *severtable = [[ServerInfoTable alloc]init];
//        severtable.colonyName = str1;
//        severtable.ServerIp = str2;
//        severtable.UserName = str3;
//        severtable.Password = str4;
////        [dbHelper updateToDB:[] set:@" serverip='' , username='' , " where:[NSString]:severtable];
//        [self.navigationController popViewControllerAnimated:YES];
//    }
//}
//- (BOOL)checkTheString
//{
//    
//}
- (void)getTextFromtextFiled
{
    str1 = ((UITextField *)[_textFileArray objectAtIndex:0]).text;
    str2 = ((UITextField *)[_textFileArray objectAtIndex:1]).text;
    str3 = ((UITextField *)[_textFileArray objectAtIndex:2]).text;
    str4 = ((UITextField *)[_textFileArray objectAtIndex:3]).text;
}
#pragma mark tableview的代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"editcell";
    ServerListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[ServerListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.celltype = kCellTypeEdit;
    cell.serverListTable = _editListTable;
    [cell setIndexPath:indexPath];
    [cell setCellTypeWithName:nil indexPath:indexPath];
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(118, 8, 162, 30)];
    if (indexPath.row == 3) {
        textField.secureTextEntry = YES;
    }
    textField.placeholder = [_array objectAtIndex:indexPath.row];
    [cell.contentView addSubview:textField];
    textField.text = [_infoArray objectAtIndex:indexPath.row];
//    [_textFileArray addObject:textField];
    return cell;
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
