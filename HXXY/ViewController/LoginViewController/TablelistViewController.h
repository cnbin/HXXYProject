//
//  TablelistViewController.h
//  HXXY
//
//  Created by Apple on 11/17/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "HXBaseViewController.h"
#import "CommonWebViewController.h"

@interface TablelistViewController : HXBaseViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,CommonWebViewControllerDelegate>
{
    UITableView * _tableView;
    UIScrollView *_scrollView;
  
}

@property (nonatomic,assign) BOOL isLoginTag;
@property (nonatomic,strong) NSString * kvcTitle;
@property (nonatomic,strong) NSString * kvcUrl;
@property (nonatomic,strong) UIImageView * imageView;

@property (nonatomic,strong) UILabel * labelText;
@property (nonatomic,strong) NSMutableArray * data;
@property (nonatomic,assign) BOOL isSubstract;

@property (nonatomic,strong) NSString * indexInstance;


@end
