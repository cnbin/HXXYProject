//
//  NoteBL.m
//  HXXY
//
//  Created by Apple on 8/18/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "NoteBL.h"

@implementation NoteBL

-(id) init
{
    self = [super init];
    
    if (self) {
        _dao = [NoteDAO new];
    }
    return self;
}

//插入Note方法
-(void) createNote:(Note*)model
{
    _dao.delegate = self;
    [_dao create:model];
}

//删除Note方法
-(void) removeNote:(Note*)model
{
    _dao.delegate = self;
    [_dao remove:model];
}

//查询所有数方法
-(void)findAllNotes
{
    _dao.delegate = self;
    [_dao findAll];
}


//修改数据方法
-(void) modifyNote:(Note*)model
{
    _dao.delegate = self;
    [_dao modify:model];
}

#pragma --mark NoteDAODelegate 委托方法
//查询所有数据方法 成功
- (void)findAllFinished:(NSMutableArray *)list
{
    [_delegate findAllNotesFinished:list];
}

//查询所有数据方法 失败
- (void)findAllFailed:(NSError *)error
{
    [_delegate findAllNotesFailed:error];
}

//插入Note方法 成功
- (void)createFinished
{
    [_delegate createNoteFinished];
}

//插入Note方法 失败
- (void)createFailed:(NSError *)error
{
    [_delegate createNoteFailed:error];
}

//删除Note方法 成功
- (void)removeFinished
{
    [_delegate removeNoteFinished];
}
//删除Note方法 失败
- (void)removeFailed:(NSError *)error
{
    [_delegate removeNoteFailed:error];
}
//修改Note方法 成功
- (void)modifyFinished
{
    [_delegate modifyNoteFinished];
}

//修改Note方法 失败
- (void)modifyFailed:(NSError *)error
{
    [_delegate modifyNoteFailed:error];
}

@end

