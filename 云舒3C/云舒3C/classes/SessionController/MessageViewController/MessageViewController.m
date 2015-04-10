//
//  MessageViewController.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/11.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableViewCell.h"
#import "otherToolView.h"
#import "emojiScrollView.h"

@interface MessageViewController ()
{
    UITableView *_tableView;
    MessageToolBar *_toolBar;
    emojiScrollView *_emojiView;
    UIPageControl *_page;
    NSMutableArray *_testDataArray;
}
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
   
    NSMutableArray *testDataArray = [[NSMutableArray alloc]init];
    _testDataArray = testDataArray;
    // 设置背景
    tableView.backgroundColor = [UIColor clearColor];
    [self setBackgroundImage];
    // 隐藏分隔线
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    _tableView = tableView;
    
    
    [self.view addSubview: tableView];
    
    [self setToolbar];
    [self setEmojiView];
    [self setOtherToolView];
}
#pragma mark 设置背景，以后扩展
- (void)setBackgroundImage
{
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageview.image = [UIImage imageNamed:@"test"];
    [self.view addSubview:imageview];
    
}
#pragma mark 设置输入框
- (void)setToolbar
{
    
    MessageToolBar *toolbar = [[MessageToolBar alloc]initWithFrame:[Util returnToolBarFrame]];
    toolbar.Tooldelegate = self;
    _toolBar = toolbar;
    [toolbar setToolBar];
    toolbar.tableView = _tableView;
    toolbar.rect = self.view.frame;
    [self.view addSubview:toolbar];
}
#pragma mark 设置表情栏
- (void)setEmojiView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, Screen_height, Screen_width, 216)];
    [view setBackgroundColor:[UIColor whiteColor]];
    emojiScrollView *emojiView = [[emojiScrollView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, 216)];
    emojiView.pagingEnabled = YES;
    emojiView.contentSize = CGSizeMake(Screen_width*3, 0);
    emojiView.delegate = self;
    [emojiView setShowsHorizontalScrollIndicator:NO];
    [emojiView setShowsVerticalScrollIndicator:NO];
    
    [view addSubview:emojiView];
    emojiView.Mydelegate = _toolBar;
    _toolBar.emojiView = view;
    if (isPad) {
        emojiView.contentSize = CGSizeMake(Screen_width, 0);
    }
    [self.view addSubview:view];
    UIPageControl *page = [[UIPageControl alloc]init];
    _page = page;
    page.numberOfPages = 3;
    CGFloat pageH = 186;
    if (isPad) {
        page.numberOfPages = 1;
        pageH = 206;
    }
    page.frame = CGRectMake(Screen_width/2 - 100, pageH, 200, 30);
    page.currentPageIndicatorTintColor = [UIColor blackColor];
    page.pageIndicatorTintColor = [UIColor grayColor];
    [view addSubview:page];
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _page.currentPage = (scrollView.contentOffset.x/scrollView.contentSize.width)*3;
}
#pragma mark 设置其他选项工具栏
- (void)setOtherToolView
{
    NSInteger keyBH = 216;
    if (isPad) {
        keyBH = 236;
    }
    otherToolView *other = [[otherToolView alloc]initWithFrame:CGRectMake(0, Screen_height, Screen_width, keyBH)];
    
    [other setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:other];
    _toolBar.otherToolView = other;
}
#pragma mark TableView 的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _testDataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageTableViewCell *cell = [MessageTableViewCell settingCellWithTableView:tableView];
    MessageCellTable *item = [[MessageCellTable alloc]init];
    item.MsgText = [_testDataArray objectAtIndex:indexPath.row];
    item.MsgType = MessageTypeText;
    cell.item = item;
    return cell;
}
#pragma mark toolBar的代理方法
-(void)sendNewMessageWithText:(NSString *)text
{
    [_testDataArray addObject:text];
    [_tableView reloadData];
    NSLog(@"%@",text);
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
