//
//  TablegGroupViewController.h
//  HXXY
//
//  Created by Apple on 1/15/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "HXBaseViewController.h"

@interface TablegGroupViewController : HXBaseViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    UITableView *_tableView;
    UIScrollView *_scrollView;
}

@end
