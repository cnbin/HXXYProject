//
//  BaoBaoZaiXianViewController.h
//  HXXY
//
//  Created by Apple on 12/9/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXBaseViewController.h"
#import "RATreeView.h"
#import "RADataObject.h"

@interface BaoBaoZaiXianViewController : HXBaseViewController<RATreeViewDelegate, RATreeViewDataSource>

@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) id expanded;
@property (strong, nonatomic) RATreeView *treeView;

@end
