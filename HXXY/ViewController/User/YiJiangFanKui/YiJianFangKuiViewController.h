//
//  YiJianFangKuiViewController.h
//  HXXY
//
//  Created by Apple on 11/18/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "HXBaseViewController.h"

@interface YiJianFangKuiViewController : HXBaseViewController<UITextViewDelegate>
@property (nonatomic,strong) UILabel * labelPlaceholder;
@property (nonatomic,strong) UITextView *contentTextView;
@end
