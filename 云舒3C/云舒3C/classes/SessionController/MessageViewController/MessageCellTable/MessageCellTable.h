//
//  MessageCellTable.h
//  云舒3C
//
//  Created by Junsong Huang on 15/3/11.
//  Copyright (c) 2015年 Junsong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MessageTypeText = 0,
    MessageTypeImage,
    MessageTypeFile,
    MessageTypeVoice,
} MessageType;

typedef enum {
    BubbleMessageTypeIncoming = 0,//接收
    BubbleMessageTypeOutgoing//发出
} BubbleMessageType;


@interface MessageCellTable : NSObject
@property (nonatomic ,assign)int sessionId;//按会话ID来获取当前的会话内容
@property (nonatomic ,assign)int msgId;//消息主键，唯一标示
@property (nonatomic ,assign)MessageType MsgType;
@property (nonatomic ,assign)int loginUserId;
@property(copy,nonatomic) NSString *loginUserName;
@property (nonatomic ,assign)int sendMsgUserId;
@property(copy,nonatomic) NSString *MsgText;
@property(copy,nonatomic) NSString *MsgDatePath;
@property (nonatomic ,assign)BOOL isShowMsgData;
@property (nonatomic,weak) UIImage * headImage;
@property (nonatomic ,assign)BubbleMessageType FromToType;
@property (nonatomic ,assign)int offlineMsgId;
@property (nonatomic ,assign)int Sex;
@end
