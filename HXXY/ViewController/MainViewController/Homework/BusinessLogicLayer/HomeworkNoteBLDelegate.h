//
//  NoteBLDelegate.h
//  HXXY
//
//  Created by Apple on 8/18/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

@protocol HomeworkNoteBLDelegate

@optional
//查询所有数据方法 成功
- (void)findAllNotesFinished:(NSMutableArray *)list;
//查询所有数据方法 失败
- (void)findAllNotesFailed:(NSError *)error;

//插入Note方法 成功
- (void)createNoteFinished;
//插入Note方法 失败
- (void)createNoteFailed:(NSError *)error;

//删除Note方法 成功
- (void)removeNoteFinished;
//删除Note方法 失败
- (void)removeNoteFailed:(NSError *)error;

//修改Note方法 成功
- (void)modifyNoteFinished;
//修改Note方法 失败
- (void)modifyNoteFailed:(NSError *)error;


@end