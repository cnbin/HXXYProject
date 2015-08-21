//
//  JingCaiXunJianViewController.h
//  HXXY
//
//  Created by Apple on 12/13/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXBaseViewController.h"

@interface JingCaiShunJianViewController : HXBaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UIImageView *_imageView;
    UILabel * _label;
    NSString * identifier;
}

@property (nonatomic,strong)UIImageView * imageView;
@property (nonatomic,strong)UILabel *label;

@end
