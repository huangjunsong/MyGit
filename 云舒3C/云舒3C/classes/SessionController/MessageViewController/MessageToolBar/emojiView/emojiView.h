//
//  emojiView.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/16.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol emojiSelectedDelegate <NSObject>

- (void)selectedEmoji:(NSString*)str;

@end

@interface emojiView : UIView

@property (nonatomic ,strong)id<emojiSelectedDelegate> delegate;
@end
