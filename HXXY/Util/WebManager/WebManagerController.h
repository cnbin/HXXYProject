//
//  WebManagerController.h
//  HXXY
//
//  Created by Apple on 11/18/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebManagerController : UIViewController
@property (nonatomic,strong) UIWebView *webView;
+(instancetype)sharedInstance;
@end
