//
//  NoteBL.h
//  HXXY
//
//  Created by Apple on 8/18/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//


#import "Note.h"
#import "NoteDAO.h"
#import "NoteDAODelegate.h"
#import "NoteBLDelegate.h"

@interface NoteBL : NSObject <NoteDAODelegate>

@property (weak, nonatomic) id <NoteBLDelegate> delegate;

@property (strong, nonatomic) NoteDAO *dao;

//插入Note方法
-(void) createNote:(Note*)model;

//删除Note方法
-(void) removeNote:(Note*)model;

//查询所有数据方法
-(void) findAllNotes;

//修改数据方法
-(void) modifyNote:(Note*)model;

@end
