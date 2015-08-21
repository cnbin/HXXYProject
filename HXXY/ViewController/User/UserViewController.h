//
//  UserViewController.h
//  HXXY
//
//  Created by Apple on 11/18/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "HXBaseViewController.h"

@interface UserViewController : HXBaseViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    UIScrollView *_scrollView;
}

@property (nonatomic,strong) NSArray *labelTextArray;
@property (nonatomic,strong) UIButton *imageButtonitemView;
@end
