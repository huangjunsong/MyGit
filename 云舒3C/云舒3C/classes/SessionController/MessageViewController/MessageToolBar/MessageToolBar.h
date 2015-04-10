//
//  MessageToolBar.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/12.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIExpandingTextView.h"
#import "emojiScrollView.h"
#import "otherToolView.h"
@class emojiView;

@protocol MessageToolBarDelegate <NSObject>

-(void)sendNewMessageWithText:(NSString *)text;

@end

@interface MessageToolBar : UIToolbar<UITextViewDelegate,UIExpandingTextViewDelegate,emojiScrollDelegate>
@property (nonatomic ,strong)id <MessageToolBarDelegate>Tooldelegate;
@property (nonatomic ,strong)UITableView *tableView;
@property (nonatomic ,assign)CGRect rect;
@property (nonatomic ,weak)UIView *emojiView;
@property (nonatomic,weak) otherToolView * otherToolView;
@property (nonatomic ,assign)NSInteger page;
-(void)setToolBar;
@end
