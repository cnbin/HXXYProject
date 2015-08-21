//
//  AppDelegate.h
//  HXXY
//
//  Created by Apple on 11/17/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "JingCaiShunJianViewController.h"
#import "FaXianViewController.h"
#import "UserViewController.h"
#import "SaveLoginViewController.h"
#import "ChooseStudentViewController.h"
#import "IntroduceViewController.h"
#import "MessageViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate,LoginViewControllerDelegate,RegisterViewControllerDelegate,SaveLoginViewControllerDelegate,ChooseStudentViewControllerDelegate,IntroduceViewControllerDelegate,MessageViewControllerDelegate>

@property (nonatomic,strong) UIWindow * window;
@property (nonatomic,strong) LoginViewController  * loginViewController ;
@property (nonatomic,strong) UIViewController * splashViewController;

@property (nonatomic,strong) UILabel * badgeLabel;
@property (nonatomic,strong) UITabBarController * tabBarController;
@property (nonatomic,strong) UITabBarItem * tabBarItem1;
@property (nonatomic,strong) UITabBarItem * tabBarItem2;
@property (nonatomic,assign) NSInteger num;

-(void)splashAnimate:(NSNumber *)alpha;
-(void)showWidgetsLogin;
-(void)showRegister;

@end

