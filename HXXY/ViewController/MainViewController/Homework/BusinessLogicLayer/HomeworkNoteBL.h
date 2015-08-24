//
//  NoteBL.h
//  HXXY
//
//  Created by Apple on 8/18/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//


#import "HomeworkNote.h"
#import "HomeworkNoteDAO.h"
#import "HomeworkNoteDAODelegate.h"
#import "HomeworkNoteBLDelegate.h"

@interface HomeworkNoteBL : NSObject <HomeworkNoteDAODelegate>

@property (weak, nonatomic) id <HomeworkNoteBLDelegate> delegate;

@property (strong, nonatomic) HomeworkNoteDAO *dao;

//插入Note方法
-(void) createNote:(HomeworkNote*)model;

//删除Note方法
-(void) removeNote:(HomeworkNote*)model;

//查询所有数据方法
-(void) findAllNotes;

//修改数据方法
-(void) modifyNote:(HomeworkNote*)model;

@end
