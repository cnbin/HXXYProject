//
//  TouPiaoJieGuoViewController.h
//  HXXY
//
//  Created by Apple on 2/7/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "HXBaseViewController.h"

@interface TouPiaoJieGuoViewController : HXBaseViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    UITableView * _tableView;
    UIScrollView *_scrollView;
}

@end
