//
//  NoteDAO.h
//  HXXY
//
//  Created by Apple on 8/18/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "HomeworkNoteDAODelegate.h"
#import "HomeworkNote.h"
#import "NSString+URLEncoding.h"

@interface HomeworkNoteDAO : NSObject <NSXMLParserDelegate>
@property (weak, nonatomic) id <HomeworkNoteDAODelegate> delegate;

//插入Note方法
-(void) create:(HomeworkNote*)model;

//删除Note方法
-(void) remove:(HomeworkNote*)model;

//修改Note方法
-(void) modify:(HomeworkNote*)model;

//查询所有数据方法
-(void) findAll;

// 当前标签的名字 ,currentTagName 用于存储正在解析的元素名
@property (strong,nonatomic) NSString * currentTagName;

@property (strong,nonatomic) NSMutableArray * titleArray;
@property (strong,nonatomic) NSMutableArray * contentArray;
@property (strong,nonatomic) NSMutableArray * datetimeArray;

@property (strong,nonatomic) NSMutableArray * listData;
@property (strong,nonatomic) NSMutableData * receiveData;
@end