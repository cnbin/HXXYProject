//
//  MessageViewController.h
//  HXXY
//
//  Created by Apple on 1/14/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "HXBaseViewController.h"

@protocol MessageViewControllerDelegate <NSObject>

-(void)caculateCellBadegCount;

@end

@interface MessageViewController : HXBaseViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    UITableView * _tableView;
    UIScrollView *_scrollView;
    
}

@property (nonatomic,assign) BOOL isLoginTag;
@property (nonatomic,strong) NSString * kvcTitle;
@property (nonatomic,strong) NSString * kvcUrl;
@property (nonatomic,strong) UIImageView * imageView;

@property (nonatomic,strong) UIView * badgeView;
@property (nonatomic,strong) UILabel * badgeLabel;
@property (nonatomic,strong) UILabel * labelText;
@property (nonatomic,strong) UILabel * labelTimeText;
@property (nonatomic,strong) UILabel * detailLabelText;
@property (nonatomic,strong) NSMutableArray * data;
@property (nonatomic,assign) BOOL isSubstract;

@property (nonatomic,strong) NSArray *labelTextArray;
@property (nonatomic,strong) NSArray * labelTimeTextArray;
@property (nonatomic,strong) NSArray * detailLabelTextArray;
@property (nonatomic,strong) NSArray * badgeLabelArray;

@property (nonatomic,strong) NSString * indexInstance;

@property id<MessageViewControllerDelegate> tableDelegate;

@end
