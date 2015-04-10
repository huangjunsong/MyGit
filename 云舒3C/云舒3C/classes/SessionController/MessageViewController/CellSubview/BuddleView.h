//
//  BuddleView.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/11.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuddleView : UIView
@property (nonatomic ,assign)BubbleMessageType type;
- (void)drawRectWith:(BubbleMessageType)type;
@end
