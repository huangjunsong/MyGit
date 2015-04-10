//
//  addServerListTableViewController.m
//  云舒3C
//
//  Created by Junsong Huang on 15/2/28.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "addServerListTableViewController.h"
@interface addServerListTableViewController ()
{
    NSString *str1;
    NSString *str2;
    NSString *str3;
    NSString *str4;
    
}
@property (weak, nonatomic) IBOutlet UITableView *addListTable;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) UIButton *DeleteButton;
@property (strong, nonatomic) NSArray *statictArray;
@property (strong, nonatomic) NSMutableArray *textFileArray;
@property (strong, nonatomic) NSArray *editInfoArray;

@end

@implementation addServerListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _addListTable.delegate = self;
    _addListTable.dataSource = self;
    [_addListTable setTableFooterView:[UIView new]];
    [_addListTable setBackgroundColor:[UIColor clearColor]];
    _addListTable.scrollEnabled = NO;
    NSArray *arr1 = @[@"请输入集群名",@"请输入服务器IP/域名",@"请输入用户名",@"请输入密码"];
    _statictArray = arr1;
    [self setTopbar];
    _textFileArray = [[NSMutableArray alloc]initWithCapacity:4];
//    _DeleteButton.hidden = YES;
    
    if (_isEditView) {
        _editInfoArray = @[_infoTable.colonyName,_infoTable.ServerIp,_infoTable.UserName,_infoTable.Password];
//        _DeleteButton.hidden = NO;
    }
//    [_DeleteButton addTarget:self action:@selector(deleteServer) forControlEvents:UIControlEventTouchUpInside];
    [self setDeleteButton];
}
- (void)setDeleteButton
{
    _DeleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _DeleteButton.frame = CGRectMake(0, 0, self.view.frame.size.width *221/320, 41);
    _DeleteButton.center = self.view.center;
    CGRect rect = _DeleteButton.frame;
    rect.origin.y = _addListTable.frame.origin.y + _addListTable.frame.size.height + 20;
    _DeleteButton.frame = rect;
    [_DeleteButton setBackgroundImage:[UIImage imageNamed:@"deletebut"] forState:UIControlStateNormal];

    [_DeleteButton setTitle:@"删除" forState:UIControlStateNormal];
    [_DeleteButton addTarget:self action:@selector(deleteServer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_DeleteButton];

}

- (void)deleteServer
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您确定要删除此服务器吗？" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",@"取消", nil];
    alert.delegate = self;
    [alert show];
}
#pragma mark alert的代理
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSString * str = [NSString stringWithFormat:@"tId = %d",_infoTable.tId];
        [Util deleteData:[ServerInfoTable class] where:str];
        [self.navigationController popViewControllerAnimated:YES];
    }else if (buttonIndex ==1)
    {
        
    }
}
- (void)setTopbar
{
    self.title = @"添加集群";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"backbut" highlightedIcon:@"backbut2" target:self action:@selector(popToServerview) name:@"返回" frame:CGRectMake(0, 0, 45, 30)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"but1" highlightedIcon:@"rectbut" target:self action:@selector(saveServer) name:@"存储" frame:CGRectMake(0, 0, 45, 30)];
}
#pragma mark 导航栏两个按钮的事件
- (void)popToServerview
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveServer
{
    [self fillTheTextFiled];
    if (_isEditView) {
        if ([self checkTheString]) {
            NSString *tId = [NSString stringWithFormat:@"tId = %d",_infoTable.tId];
            NSString *set = [NSString stringWithFormat:@"colonyName = '%@',ServerIp = '%@',UserName = '%@',Password = '%@'",str1,str2,str3,str4];
            [Util updateDataWithClass:[ServerInfoTable class] set:set where:tId];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else{
        if ([self checkTheString]) {
            
            ServerInfoTable *severtable = [[ServerInfoTable alloc]init];
            severtable.colonyName = str1;
            severtable.ServerIp = str2;
            severtable.UserName = str3;
            severtable.Password = str4;
            [Util insertData:severtable];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    
}
#pragma mark text的代理
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([Util smallIphoneScreen]) {
        if (textField.tag == 103) {
            CGRect rect = _addListTable.frame;
            CGRect btnRect = _DeleteButton.frame;
            rect.origin.y = rect.origin.y - 40;
            btnRect.origin.y = btnRect.origin.y - 40;
            [UIView animateWithDuration:0.2 animations:^{
                [_addListTable setFrame:rect];
                [_DeleteButton setFrame:btnRect];
            }];
        }
    }
   
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if ([Util smallIphoneScreen]) {
        if (textField.tag == 103) {
            CGRect rect = _addListTable.frame;
            CGRect btnRect = _DeleteButton.frame;
            rect.origin.y = rect.origin.y + 40;
            btnRect.origin.y = btnRect.origin.y + 40;
            [UIView animateWithDuration:0.2 animations:^{
                [_DeleteButton setFrame:btnRect];
                [_addListTable setFrame:rect];
            }];
        }
    }
    
   
    
    return YES;
}


- (BOOL)checkTheString
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    NSArray *array = [Util searchDataWithClass:[ServerInfoTable class] where:[NSString stringWithFormat:@"colonyName = '%@'",str1] orderBy:nil offset:0 count:0];
//    NSLog(@"%@ %@ %@ %@",str1,str2,str3,str4);
    if (str1 == NULL || [str1 strTrim:str1] == 0) {
        alert.message = @"集群名称不能为空";
        [alert show];
        return NO;
    }else if (_isEditView)
    {
        return YES;
    }
    else if ( array.count>0)
    {
//        NSLog(@"%@",str1);
        alert.message = @"集群名称已存在,请重新输入";
        [alert show];
        return NO;
    }
    if(str2 == NULL || [str2 strTrim:str2].length == 0 )
    {
        alert.message = @"IP不能空";
        [alert show];
        return NO;
    }else
    {
        if (![Util isValidIp:str2]) {
            if (![Util isValidateDomainName:str2]) {
                alert.message = @"IP或域名输入不合法";
                [alert show];
                return NO;
            }
        }
    }
    if(str3 == NULL || [str3 strTrim:str3].length ==0)
    {
        alert.message = @"用户名不能为空";
        [alert show];
        return NO;
    }else
    {
        NSRange rang = [str3 rangeOfString:@" "];
        if (rang.location != NSNotFound) {
            alert.message = @"用户名不能包含空格";
            [alert show];
            return NO;
        }
    }
    if (str4 == NULL || [str4 strTrim:str4].length == 0) {
        alert.message = @"密码不能为空";
        [alert show];
        return NO;
    }else
    {
        NSRange rang = [str4 rangeOfString:@" "];
        if (rang.location!=NSNotFound) {
            alert.message = @"密码不能包含空格";
            [alert show];
            return NO;
        }
    }
    return YES;
}
- (void)fillTheTextFiled
{
    str1 = ((UITextField *)[_textFileArray objectAtIndex:0]).text;
    str2 = ((UITextField *)[_textFileArray objectAtIndex:1]).text;
    str3 = ((UITextField *)[_textFileArray objectAtIndex:2]).text;
    str4 = ((UITextField *)[_textFileArray objectAtIndex:3]).text;
    
}
//- (void)editchage_:(UITextField *)text
//{
//    if (text.tag == 100) {
//        str1 = text.text;
//    }else if(text.tag == 101)
//    {
//        str2 = text.text;
//    }else if(text.tag == 102)
//    {
//        str3 = text.text;
//    }else if(text.tag == 103)
//    {
//        str4 = text.text;
//    }
//}
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
    static NSString *string = @"addcell";
    ServerListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[ServerListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.delegate = self;
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.celltype = kCellTypeLabel;
    cell.serverListTable = _addListTable;
    [cell setIndexPath:indexPath];
    [cell setCellTypeWithName:nil indexPath:indexPath];
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(118, 8, 162, 30)];
    textField.tag = indexPath.row + 100;
    textField.placeholder = [_statictArray objectAtIndex:indexPath.row];
    if (indexPath.row == 3) {
        textField.secureTextEntry = YES;
    }
    textField.delegate = self;
    [cell.contentView addSubview:textField];
    [_textFileArray addObject:textField];
//    [textField addTarget:self action:@selector(editchage_:) forControlEvents:UIControlEventEditingChanged];
    if (_isEditView) {
        textField.text = [_editInfoArray objectAtIndex:indexPath.row];
    }
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
