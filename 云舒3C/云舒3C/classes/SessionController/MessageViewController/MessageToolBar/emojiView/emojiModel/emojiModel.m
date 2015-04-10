//
//  emojiModel.m
//  云舒3C
//
//  Created by Junsong Huang on 15/3/17.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import "emojiModel.h"

static NSMutableArray *_fkeyAry_en;
static NSMutableArray *_fkeyAry;
@implementation emojiModel
+ (NSMutableArray*)getEmojiAry:(NSString*)language
{
    if ([language isEqualToString:@"en"])
    {
        if (!_fkeyAry_en)
        {
            [self initFaceAry_en];
        }
        return _fkeyAry_en;
    }else
    {//zh
        if (!_fkeyAry)
        {
            [self initFacefkeyAry];
        }
        return _fkeyAry;
    }
}
+(int)getZHFaceIndexByKey:(NSString*)keys
{
    if (_fkeyAry==nil)
    {
        [self initFacefkeyAry];
    }
    NSUInteger index = [_fkeyAry indexOfObject:keys];
    
    if (index==NSNotFound)
    {
        index=-1;
    }
    return (int)index;
}


+(int)getENFaceIndexByKey:(NSString*)keys
{
    if (_fkeyAry_en==nil)
    {
        [self initFaceAry_en];
    }
    NSUInteger index = [_fkeyAry_en indexOfObject:keys];
    if (index==NSNotFound)
    {
        index=-1;
    }
    return (int)index;
}

+(void)initFacefkeyAry
{
    _fkeyAry = [[NSMutableArray alloc] initWithCapacity:64];
    
    [_fkeyAry addObject:@"[#微笑]"];
    [_fkeyAry addObject:@"[#太开心]"];
    [_fkeyAry addObject:@"[#可爱]"];
    [_fkeyAry addObject:@"[#失望]"];
    [_fkeyAry addObject:@"[#衰]"];
    [_fkeyAry addObject:@"[#睡觉]"];
    [_fkeyAry addObject:@"[#思考]"];
    [_fkeyAry addObject:@"[#偷笑]"];
    [_fkeyAry addObject:@"[#吐]"];
    [_fkeyAry addObject:@"[#抠鼻]"];
    [_fkeyAry addObject:@"[#委屈]"];
    [_fkeyAry addObject:@"[#呲牙]"];
    [_fkeyAry addObject:@"[#嘘]"];
    [_fkeyAry addObject:@"[#阴险]"];
    [_fkeyAry addObject:@"[#疑问]"];
    [_fkeyAry addObject:@"[#晕]"];
    [_fkeyAry addObject:@"[#抓狂]"];
    [_fkeyAry addObject:@"[#左哼哼]"];
    [_fkeyAry addObject:@"[#右哼哼]"];
    [_fkeyAry addObject:@"[#鼓掌]"];
    [_fkeyAry addObject:@"[#汗]"];
    [_fkeyAry addObject:@"[#大哭]"];
    [_fkeyAry addObject:@"[#困]"];
    [_fkeyAry addObject:@"[#酷]"];
    [_fkeyAry addObject:@"[#猪头]"];
    [_fkeyAry addObject:@"[#愤怒]"];
    [_fkeyAry addObject:@"[#爱你]"];
    [_fkeyAry addObject:@"[#心碎]"];
    [_fkeyAry addObject:@"[#GOOD]"];
    [_fkeyAry addObject:@"[#过来]"];
    [_fkeyAry addObject:@"[#OK]"];
    [_fkeyAry addObject:@"[#拳头]"];
    [_fkeyAry addObject:@"[#握手]"];
    [_fkeyAry addObject:@"[#弱]"];
    [_fkeyAry addObject:@"[#胜利]"];
    [_fkeyAry addObject:@"[#蛋糕]"];
    [_fkeyAry addObject:@"[#礼物]"];
    [_fkeyAry addObject:@"[#蜡烛]"];
    [_fkeyAry addObject:@"[#太阳]"];
    [_fkeyAry addObject:@"[#月夜]"];
    [_fkeyAry addObject:@"[#闪电]"];
    [_fkeyAry addObject:@"[#囧]"];
    [_fkeyAry addObject:@"[#玫瑰]"];
    [_fkeyAry addObject:@"[#饮料]"];
    [_fkeyAry addObject:@"[#吉他]"];
    [_fkeyAry addObject:@"[#钱]"];
    [_fkeyAry addObject:@"[#雨伞]"];
    [_fkeyAry addObject:@"[#汉堡]"];
    [_fkeyAry addObject:@"[#面条]"];
    [_fkeyAry addObject:@"[#苹果]"];
    [_fkeyAry addObject:@"[#麦克风]"];
    [_fkeyAry addObject:@"[#圣诞树]"];
    [_fkeyAry addObject:@"[#兔子]"];
    [_fkeyAry addObject:@"[#CD]"];
    [_fkeyAry addObject:@"[#音乐]"];
    [_fkeyAry addObject:@"[#气球]"];
    [_fkeyAry addObject:@"[#相机]"];
    [_fkeyAry addObject:@"[#手机]"];
    [_fkeyAry addObject:@"[#下雨]"];
    [_fkeyAry addObject:@"[#雪人]"];
    [_fkeyAry addObject:@"[#神马]"];
    [_fkeyAry addObject:@"[#V5]"];
    [_fkeyAry addObject:@"[#落叶]"];
    [_fkeyAry addObject:@"[#微风]"];
}
+(void)initFaceAry_en
{
    _fkeyAry_en = [[NSMutableArray alloc] initWithCapacity:64];
    
    [_fkeyAry_en addObject:@"[#Smile]"];
    [_fkeyAry_en addObject:@"[#Laugh]"];
    [_fkeyAry_en addObject:@"[#Pleased]"];
    [_fkeyAry_en addObject:@"[#Disappointment]"];
    [_fkeyAry_en addObject:@"[#InTheDark]"];
    [_fkeyAry_en addObject:@"[#Sleep]"];
    [_fkeyAry_en addObject:@"[#Think]"];
    [_fkeyAry_en addObject:@"[#Chuckle]"];
    [_fkeyAry_en addObject:@"[#Puke]"];
    [_fkeyAry_en addObject:@"[#PickNose]"];
    [_fkeyAry_en addObject:@"[#Distressed]"];
    [_fkeyAry_en addObject:@"[#Grin]"];
    [_fkeyAry_en addObject:@"[#Hush]"];
    [_fkeyAry_en addObject:@"[#Sly]"];
    [_fkeyAry_en addObject:@"[#Confused]"];
    [_fkeyAry_en addObject:@"[#Dizzy]"];
    [_fkeyAry_en addObject:@"[#Scream]"];
    [_fkeyAry_en addObject:@"[#SnubLeft]"];
    [_fkeyAry_en addObject:@"[#SnubRight]"];
    [_fkeyAry_en addObject:@"[#Clap]"];
    [_fkeyAry_en addObject:@"[#Sweating]"];
    [_fkeyAry_en addObject:@"[#Sob]"];
    [_fkeyAry_en addObject:@"[#Drowsy]"];
    [_fkeyAry_en addObject:@"[#Cool]"];
    [_fkeyAry_en addObject:@"[#Pig]"];
    [_fkeyAry_en addObject:@"[#OnFire]"];
    [_fkeyAry_en addObject:@"[#Heart]"];
    [_fkeyAry_en addObject:@"[#BrokenHeart]"];
    [_fkeyAry_en addObject:@"[#good]"];
    [_fkeyAry_en addObject:@"[#Beckon]"];
    [_fkeyAry_en addObject:@"[#ok]"];
    [_fkeyAry_en addObject:@"[#Fist]"];
    [_fkeyAry_en addObject:@"[#handshake]"];
    [_fkeyAry_en addObject:@"[#ThumbsDown]"];
    [_fkeyAry_en addObject:@"[#Victory]"];
    [_fkeyAry_en addObject:@"[#Cake]"];
    [_fkeyAry_en addObject:@"[#Gift]"];
    [_fkeyAry_en addObject:@"[#Glim]"];
    [_fkeyAry_en addObject:@"[#Sun]"];
    [_fkeyAry_en addObject:@"[#Moon]"];
    [_fkeyAry_en addObject:@"[#Lightning]"];
    [_fkeyAry_en addObject:@"[#Embarrassed]"];
    [_fkeyAry_en addObject:@"[#Rose]"];
    [_fkeyAry_en addObject:@"[#Drink]"];
    [_fkeyAry_en addObject:@"[#Guitar]"];
    [_fkeyAry_en addObject:@"[#Money]"];
    [_fkeyAry_en addObject:@"[#Umbrella]"];
    [_fkeyAry_en addObject:@"[#Hamburger]"];
    [_fkeyAry_en addObject:@"[#Noodle]"];
    [_fkeyAry_en addObject:@"[#Apple]"];
    [_fkeyAry_en addObject:@"[#Microphone]"];
    [_fkeyAry_en addObject:@"[#ChristmasTrees]"];
    [_fkeyAry_en addObject:@"[#Rabbit]"];
    [_fkeyAry_en addObject:@"[#cd]"];
    [_fkeyAry_en addObject:@"[#Music]"];
    [_fkeyAry_en addObject:@"[#Balloon]"];
    [_fkeyAry_en addObject:@"[#Camera]"];
    [_fkeyAry_en addObject:@"[#Mobile]"];///
    [_fkeyAry_en addObject:@"[#Rain]"];
    [_fkeyAry_en addObject:@"[#Snowman]"];
    [_fkeyAry_en addObject:@"[#GodHorses]"];
    [_fkeyAry_en addObject:@"[#v5]"];
    [_fkeyAry_en addObject:@"[#FallenLeaves]"];
    [_fkeyAry_en addObject:@"[#Breeze]"];
}


@end
