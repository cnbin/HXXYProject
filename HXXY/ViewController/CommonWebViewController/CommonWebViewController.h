//
//  CommonWebViewController.h
//  HXXY
//
//  Created by Apple on 12/24/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXBaseViewController.h"
#import "WebManagerController.h"
#import "CustomURLCache.h"

@protocol CommonWebViewControllerDelegate <NSObject>

-(NSString *)viewTitle;
-(NSString *)viewUrl;

@end

@interface CommonWebViewController :HXBaseViewController<UIWebViewDelegate,UIGestureRecognizerDelegate>{
    UIActivityIndicatorView *activityIndicatorView;
    UIView * viewbar;
    UIToolbar *myToolbar;
}

@property (nonatomic, copy) NSString *url;// 需要加载的网页地址
@property (nonatomic, strong) WebManagerController *webManagerController;
@property (nonatomic,strong)id <CommonWebViewControllerDelegate>delegate;

@end
