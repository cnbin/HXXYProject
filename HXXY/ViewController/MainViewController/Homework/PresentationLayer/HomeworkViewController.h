//
//  HomeworkViewController.h
//  HXXY
//
//  Created by Apple on 1/16/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "HXBaseViewController.h"
#import "HomeworkNote.h"
#import "HomeworkNoteDAO.h"
#import "HomeworkNoteBL.h"
#import "HomeworkNoteBLDelegate.h"

@interface HomeworkViewController : HXBaseViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,NSXMLParserDelegate,HomeworkNoteBLDelegate>

{
    UITableView * _tableView;
    UIScrollView *_scrollView;
    
}

//BL对象
@property (nonatomic,strong) HomeworkNoteBL *bl;

@property (nonatomic,strong) NSMutableArray* listData;

@end
