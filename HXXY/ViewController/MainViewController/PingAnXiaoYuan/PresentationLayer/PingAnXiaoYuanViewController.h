//
//  PingAnXiaoYuanViewController.h
//  HXXY
//
//  Created by Apple on 1/16/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "Note.h"
#import "NoteDAO.h"
#import "NoteBL.h"
#import "NoteBLDelegate.h"

@interface PingAnXiaoYuanViewController : UITableViewController<NoteBLDelegate>

//删除数据索引
@property (nonatomic,assign) NSUInteger deletedIndex;
//删除数据
@property (nonatomic,strong) Note *deletedNote;
//BL对象
@property (nonatomic,strong) NoteBL *bl;

@property (nonatomic,strong) NSMutableArray* listData;

@end
