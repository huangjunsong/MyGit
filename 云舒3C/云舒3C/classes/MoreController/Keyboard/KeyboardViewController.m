//
//  KeyboardViewController.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/4.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "KeyboardViewController.h"
#import "SwitchItem.h"
#import "groupModel.h"
@implementation KeyboardViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"热键设置";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setHotKeyItem];
    [self setKeyboardViewTopbarItem];
}
- (void)setKeyboardViewTopbarItem
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"backbut" highlightedIcon:@"backbut2" target:self action:@selector(popToMoreView) name:@"返回" frame:CGRectMake(0, 0, 45, 30)];
}
- (void)popToMoreView
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setHotKeyItem
{
    
    SwitchItem *item1 = [SwitchItem itemWithTitle:@"Alt"];
    
    SwitchItem *item2 = [SwitchItem itemWithTitle:@"Ctrl"];
    
    SwitchItem *item3 = [SwitchItem itemWithTitle:@"Ctrl+Alt+Del"];
    
    SwitchItem *item4 = [SwitchItem itemWithTitle:@"Ctrl+Esc"];
    
    SwitchItem *item5 = [SwitchItem itemWithTitle:@"F1"];
    
    SwitchItem *item6 = [SwitchItem itemWithTitle:@"F2"];
    
    SwitchItem *item7 = [SwitchItem itemWithTitle:@"F3"];
    
    SwitchItem *item8 = [SwitchItem itemWithTitle:@"F4"];
    
    SwitchItem *item9 = [SwitchItem itemWithTitle:@"F5"];
    
    SwitchItem *item10 = [SwitchItem itemWithTitle:@"F6"];
    
    SwitchItem *item11 = [SwitchItem itemWithTitle:@"F7"];
    
    SwitchItem *item12 = [SwitchItem itemWithTitle:@"F8"];
    
    SwitchItem *item13 = [SwitchItem itemWithTitle:@"F9"];
    
    SwitchItem *item14 = [SwitchItem itemWithTitle:@"F10"];
    
    SwitchItem *item15 = [SwitchItem itemWithTitle:@"F11"];
    
    SwitchItem *item16 = [SwitchItem itemWithTitle:@"F12"];
    
    SwitchItem *item17 = [SwitchItem itemWithTitle:@"Home"];
    
    SwitchItem *item18 = [SwitchItem itemWithTitle:@"Page Down"];
    
    SwitchItem *item19 = [SwitchItem itemWithTitle:@"Page Up"];
    
    SwitchItem *item20 = [SwitchItem itemWithTitle:@"End"];
    
    SwitchItem *item21 = [SwitchItem itemWithTitle:@"Shift"];
   
    SwitchItem *item22 = [SwitchItem itemWithTitle:@"Tab"];
    
    SwitchItem *item23 = [SwitchItem itemWithTitle:@"Win"];
    
    SwitchItem *item24 = [SwitchItem itemWithTitle:@"Esc"];
    
    SwitchItem *item25 = [SwitchItem itemWithTitle:@"Del"];
    
    SwitchItem *item26 = [SwitchItem itemWithTitle:@"存储"];
    
    SwitchItem *item27 = [SwitchItem itemWithTitle:@"关闭窗口"];
    
    SwitchItem *item28 = [SwitchItem itemWithTitle:@"删除"];
    
    SwitchItem *item29 = [SwitchItem itemWithTitle:@"刷新"];
    
    SwitchItem *item30 = [SwitchItem itemWithTitle:@"剪切"];
    
    SwitchItem *item31 = [SwitchItem itemWithTitle:@"全选"];
    
    SwitchItem *item32 = [SwitchItem itemWithTitle:@"复制"];
    
    SwitchItem *item33 = [SwitchItem itemWithTitle:@"粘贴"];
    
    SwitchItem *item34 = [SwitchItem itemWithTitle:@"撤销"];
    
    SwitchItem *item35 = [SwitchItem itemWithTitle:@"结束"];
    
    SwitchItem *item36 = [SwitchItem itemWithTitle:@"开始菜单"];
    
    SwitchItem *item37 = [SwitchItem itemWithTitle:@"放映幻灯片"];
    
    SwitchItem *item38 = [SwitchItem itemWithTitle:@"Alt+Enter"];
    NSArray * array = [Util searchDataWithClass:[keboardModel class] where:@"name = 'Alt'" orderBy:nil offset:0 count:0];
    if (array.count == 0) {
        [item1 setKeyboardTableValue:@"18" name:@"Alt" extention:nil state:NO];
        
        [item2 setKeyboardTableValue:@"17" name:@"Ctrl" extention:@"1900545" state:NO];
        
        [item3 setKeyboardTableValue:nil name:@"Ctrl+Alt+Del" extention:nil state:NO];
        
        [item4 setKeyboardTableValue:nil name:@"Ctrl+Esc" extention:nil state:NO];
        
        [item5 setKeyboardTableValue:@"112" name:@"F1" extention:@"3866625" state:NO];
        
        [item6 setKeyboardTableValue:@"113" name:@"F2" extention:@"3932161" state:NO];
        
        [item7 setKeyboardTableValue:@"114" name:@"F3" extention:@"3997697" state:NO];
        
        [item8 setKeyboardTableValue:@"115" name:@"F4" extention:@"4063233" state:NO];
        
        [item9 setKeyboardTableValue:@"116" name:@"F5" extention:@"4128769" state:NO];
        
        [item10 setKeyboardTableValue:@"117" name:@"F6" extention:@"4194305" state:NO];
        
        [item11 setKeyboardTableValue:@"118" name:@"F7" extention:@"4259841" state:NO];
        
        [item12 setKeyboardTableValue:@"119" name:@"F8" extention:@"4325377" state:NO];
        
        [item13 setKeyboardTableValue:@"120" name:@"F9" extention:@"4390913" state:NO];
        
        [item14 setKeyboardTableValue:@"121" name:@"F10" extention:nil state:NO];
        
        [item15 setKeyboardTableValue:@"122" name:@"F11" extention:nil state:NO];
        
        [item16 setKeyboardTableValue:@"123" name:@"F12" extention:nil state:NO];
        
        [item17 setKeyboardTableValue:@"36" name:@"Home" extention:@"21430273" state:NO];
        
        [item18 setKeyboardTableValue:@"34" name:@"Page Down" extention:@"22085633" state:NO];
        
        [item19 setKeyboardTableValue:@"33" name:@"Page Up" extention:nil state:NO];
        
        [item20 setKeyboardTableValue:@"35" name:@"End" extention:@"21954561" state:NO];
        
        [item21 setKeyboardTableValue:@"16" name:@"Shift" extention:@"2752513" state:NO];
        
        [item22 setKeyboardTableValue:@"9" name:@"Tab" extention:@"983041" state:NO];
        
        [item23 setKeyboardTableValue:@"91" name:@"Win" extention:@"22740993" state:NO];
        
        [item24 setKeyboardTableValue:@"27" name:@"Esc" extention:@"65537" state:NO];
        
        [item25 setKeyboardTableValue:@"46" name:@"Del" extention:@"22216705" state:NO];
        
        [item26 setKeyboardTableValue:nil name:@"存储" extention:nil state:NO];
        
        [item27 setKeyboardTableValue:nil name:@"关闭窗口" extention:nil state:NO];
        
        [item28 setKeyboardTableValue:nil name:@"删除" extention:nil state:NO];
        
        [item29 setKeyboardTableValue:nil name:@"刷新" extention:nil state:NO];
        
        [item30 setKeyboardTableValue:nil name:@"剪切" extention:nil state:NO];
        
        [item31 setKeyboardTableValue:nil name:@"全选" extention:nil state:NO];
        
        [item32 setKeyboardTableValue:nil name:@"复制" extention:nil state:NO];
        
        [item33 setKeyboardTableValue:nil name:@"粘贴" extention:nil state:NO];
        
        [item34 setKeyboardTableValue:nil name:@"撤销" extention:nil state:NO];
        
        [item35 setKeyboardTableValue:nil name:@"结束" extention:nil state:NO];
        
        [item36 setKeyboardTableValue:nil name:@"开始菜单" extention:nil state:NO];
        
        [item37 setKeyboardTableValue:nil name:@"放映幻灯片" extention:nil state:NO];
        
        [item38 setKeyboardTableValue:nil name:@"Alt+Enter" extention:nil state:NO];

    }
    
    
    groupModel *group = [[groupModel alloc]init];
    group.header = @"远程桌面热键设置";
    group.items = @[item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item11,item12,item13,item14,item15,item16,item17,item18,item19,item20,item21,item22,item23,item24,item25,item26,item27,item28,item29,item30,item31,item32,item33,item34,item35,item36,item37,item38];
    [_groupArray addObject:group];
}

@end
/*
 [keyValDic setObject:@"18" forKey:@"Alt"];
 [keyValDic setObject:@"9" forKey:@"Tab"];
 [keyValDic setObject:@"17" forKey:@"Ctrl"];
 [keyValDic setObject:@"46" forKey:@"Del"];
 [keyValDic setObject:@"27" forKey:@"Esc"];
 [keyValDic setObject:@"91" forKey:@"Win"];
 [keyValDic setObject:@"16" forKey:@"Shift"];
 [keyValDic setObject:@"36" forKey:@"Home"];
 [keyValDic setObject:@"34" forKey:@"Page Down"];
 [keyValDic setObject:@"33" forKey:@"Page Up"];
 [keyValDic setObject:@"35" forKey:@"End"];
 [keyValDic setObject:@"112" forKey:@"F1"];
 [keyValDic setObject:@"113" forKey:@"F2"];
 [keyValDic setObject:@"114" forKey:@"F3"];
 [keyValDic setObject:@"115" forKey:@"F4"];
 [keyValDic setObject:@"116" forKey:@"F5"];
 [keyValDic setObject:@"117" forKey:@"F6"];
 [keyValDic setObject:@"118" forKey:@"F7"];
 [keyValDic setObject:@"119" forKey:@"F8"];
 [keyValDic setObject:@"120" forKey:@"F9"];
 [keyValDic setObject:@"121" forKey:@"F10"];
 [keyValDic setObject:@"122" forKey:@"F11"];
 [keyValDic setObject:@"123" forKey:@"F12"];
 
 [hotkeyExtValDic setObject:@"983041" forKey:@"Tab"];
 [hotkeyExtValDic setObject:@"1900545" forKey:@"Ctrl"];
 [hotkeyExtValDic setObject:@"22216705" forKey:@"Del"];
 [hotkeyExtValDic setObject:@"65537" forKey:@"Esc"];
 [hotkeyExtValDic setObject:@"22740993" forKey:@"Win"];
 [hotkeyExtValDic setObject:@"2752513" forKey:@"Shift"];
 [hotkeyExtValDic setObject:@"21430273" forKey:@"Home"];
 [hotkeyExtValDic setObject:@"22085633" forKey:@"Page Down"];
 [hotkeyExtValDic setObject:@"21561345" forKey:@"Page Up"];
 [hotkeyExtValDic setObject:@"21954561" forKey:@"End"];
 [hotkeyExtValDic setObject:@"3866625" forKey:@"F1"];
 [hotkeyExtValDic setObject:@"3932161" forKey:@"F2"];
 [hotkeyExtValDic setObject:@"3997697" forKey:@"F3"];
 [hotkeyExtValDic setObject:@"4063233" forKey:@"F4"];
 [hotkeyExtValDic setObject:@"4128769" forKey:@"F5"];
 [hotkeyExtValDic setObject:@"4194305" forKey:@"F6"];
 [hotkeyExtValDic setObject:@"4259841" forKey:@"F7"];
 [hotkeyExtValDic setObject:@"4325377" forKey:@"F8"];
 [hotkeyExtValDic setObject:@"4390913" forKey:@"F9"];
*/