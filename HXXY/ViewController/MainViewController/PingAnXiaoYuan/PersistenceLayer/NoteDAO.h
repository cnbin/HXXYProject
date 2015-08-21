//
//  NoteDAO.h
//  HXXY
//
//  Created by Apple on 8/18/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "NoteDAODelegate.h"
#import "Note.h"
#import "NSString+URLEncoding.h"

@interface NoteDAO : NSObject <NSXMLParserDelegate>
@property (weak, nonatomic) id <NoteDAODelegate> delegate;

//插入Note方法
-(void) create:(Note*)model;

//删除Note方法
-(void) remove:(Note*)model;

//修改Note方法
-(void) modify:(Note*)model;

//查询所有数据方法
-(void) findAll;

// 当前标签的名字 ,currentTagName 用于存储正在解析的元素名
@property (strong,nonatomic) NSString * currentTagName;
@property (strong,nonatomic) NSMutableArray * GradeArray;
@property (strong,nonatomic) NSMutableArray * ClassesArray;
@property (strong,nonatomic) NSMutableArray * StudentNameArray;
@property (strong,nonatomic) NSMutableArray * InOutArray;
@property (strong,nonatomic) NSMutableArray * IotimeArray;
@property (strong,nonatomic) NSMutableArray * listData;
@property (strong,nonatomic) NSMutableData * receiveData;
@end