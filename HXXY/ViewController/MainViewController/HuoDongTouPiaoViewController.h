//
//  HuoDongTouPiaoViewController.h
//  HXXY
//
//  Created by Apple on 2/6/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "HXBaseViewController.h"

@interface HuoDongTouPiaoViewController : HXBaseViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    UITableView * _tableView;
    UIScrollView *_scrollView;
}


@end
