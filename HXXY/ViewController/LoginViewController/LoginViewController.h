//
//  ShouYeViewController.h
//  HXXY
//
//  Created by Apple on 11/17/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "HXBaseViewController.h"
#import "TablelistViewController.h"

@class  LoginViewController;

@protocol LoginViewControllerDelegate <NSObject>

-(void)LoginViewController:(LoginViewController *)loginViewController;

@end

@interface LoginViewController : HXBaseViewController<NSXMLParserDelegate,NSURLConnectionDelegate>
{
    UITextField * phonenumText;
    UITextField * passwordText;
    UIButton *loginButton;
    UIButton * forgetButton;
    
    NSString *result;
}

@property (weak,nonatomic) id<LoginViewControllerDelegate> delegate;

// 当前标签的名字 ,currentTagName 用于存储正在解析的元素名
@property (strong ,nonatomic) NSString * currentTagName;
@property (strong,nonatomic) NSMutableDictionary * dict;

@end
