//
//  emojiScrollView.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/16.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol emojiScrollDelegate <NSObject>

- (void)selectedEmojiBtn:(NSString *)str;

@end


@interface emojiScrollView : UIScrollView

@property (nonatomic ,strong)id <emojiScrollDelegate>Mydelegate;

@end
