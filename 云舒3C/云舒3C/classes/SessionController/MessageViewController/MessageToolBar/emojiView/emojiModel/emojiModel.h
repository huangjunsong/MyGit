//
//  emojiModel.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/17.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface emojiModel : NSObject
+ (NSMutableArray*)getEmojiAry:(NSString*)language;
+(int)getZHFaceIndexByKey:(NSString*)keys;
+(int)getENFaceIndexByKey:(NSString*)keys;
@end
