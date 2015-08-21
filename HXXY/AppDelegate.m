//
//  AppDelegate.m
//  HXXY
//
//  Created by Apple on 11/17/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "AppDelegate.h"
#import "PanNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [[UINavigationBar appearance]setBarTintColor:SystemThemeColor];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];//系统返回键的颜色
//    [[UIButton appearance] setTintColor:[UIColor lightTextColor]];
    
    
    BOOL isLogined=[[NSUserDefaults standardUserDefaults] boolForKey:@"key_isLogined"];
    if (isLogined) {
        BOOL isAutoSwitch=[[NSUserDefaults standardUserDefaults] boolForKey:@"key_isAutoSwitch"];
        if (isAutoSwitch) {
            [self showTabbar];
        }
        else
        {
           [self showRegister];
        }
    }else{
         [self showScrollView];
    }
    
    [self.window makeKeyAndVisible];
    
    [self.window addSubview:self.window.rootViewController.view];
    //设置splashVC，显示splashVC.view。
    self.splashViewController=[[UIViewController alloc]init];
    NSString * splashImageName=@"splash.jpg";
    if(self.window.bounds.size.height>480){
        splashImageName=@"splashR4.jpg";
    }
    self.splashViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:splashImageName]];
    [self.window addSubview:self.splashViewController.view];
    [self performSelector:@selector(splashAnimate:) withObject:@0.0 afterDelay:2.0];

    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    //CFShow((__bridge CFTypeRef)(infoDic));
    NSString *appVersion = [infoDic objectForKey:@"CFBundleVersion"];
    NSLog(@"the now appVersion is %@",appVersion);
    if([UIApplication sharedApplication].applicationState ==UIApplicationStateInactive){
        NSLog(@"程序在运行状态");
    }
    return YES;
}

-(void) splashAnimate:(NSNumber *)alpha{
    // 只能用UIViewAnimationOptionCurveEaseInOut和ViewAnimationOptionTransitionNone两种效果
    UIView * splashView=self.splashViewController.view;
    [UIView animateWithDuration:1.0 animations:^{
        splashView.transform=CGAffineTransformScale(splashView.transform, 1.5, 1.5);
        splashView.alpha=alpha.floatValue;
    } completion:^(BOOL finished) {
        //ARC通过赋值nil释放内存，动画中不能removeFromSuperview.
        [splashView removeFromSuperview];
        self.splashViewController=nil;
    }];
}

//六个show方法
-(void)showScrollView{
    IntroduceViewController * introduceViewController=[[IntroduceViewController alloc]init];
    introduceViewController.delegate=self;
    self.window.rootViewController=introduceViewController;
}

-(void)showWidgetsLogin{
    LoginViewController * loginViewController=[[LoginViewController alloc]init];
    loginViewController.delegate=self;
    
    UINavigationController * loginViewNavigationController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    self.window.rootViewController=loginViewNavigationController;
    
}

-(void)showSaveLogin{
    
    SaveLoginViewController * saveLoginViewController=[[SaveLoginViewController alloc]init];
    saveLoginViewController.delegate=self;
    UINavigationController * saveLoginNavigationController = [[UINavigationController
                                                               alloc] initWithRootViewController:saveLoginViewController];
    self.window.rootViewController=saveLoginNavigationController;
    
}

-(void)showRegister{
    RegisterViewController * registerViewController=[[RegisterViewController alloc]init];
    registerViewController.delegate=self;
    UINavigationController * registerNavigationController = [[UINavigationController alloc] initWithRootViewController:registerViewController];
    self.window.rootViewController= registerNavigationController;
}

-(void)showChooseStudent{
    ChooseStudentViewController * chooseStudentViewController=[[ChooseStudentViewController alloc]init];
    chooseStudentViewController.delegate=self;
   UINavigationController * chooseStudentNavigationController = [[UINavigationController alloc] initWithRootViewController:chooseStudentViewController];
    self.window.rootViewController=chooseStudentNavigationController;
}

-(void)showTabbar{
    MessageViewController  * messageViewController=[[MessageViewController alloc]init];
    messageViewController.tableDelegate=self;
    UINavigationController * messageNavigationController=[[UINavigationController alloc]initWithRootViewController:messageViewController];
    
    TablelistViewController  * tablelistViewController =[[TablelistViewController alloc]init];
    UINavigationController * tablelistNavigationController=[[UINavigationController alloc]initWithRootViewController:tablelistViewController];
    
    JingCaiShunJianViewController *jingCaiShunJianViewController=[[JingCaiShunJianViewController alloc]init];
    UINavigationController * jingCaiShunJianNavigationController=[[UINavigationController alloc]initWithRootViewController:jingCaiShunJianViewController];
    
    FaXianViewController * faXianViewController=[[FaXianViewController alloc]init];
    UINavigationController  *faXianNavigationController=[[UINavigationController alloc]initWithRootViewController:faXianViewController];
    
    UserViewController *userViewController=[[UserViewController alloc]init];
    PanNavigationController *userNaviagtionViewController=[[ PanNavigationController alloc]initWithRootViewController:userViewController];
    
    _tabBarController=[[UITabBarController alloc]init];
    _tabBarController.delegate = self;//实现委托切记要写这句委托对象
    _tabBarController.viewControllers=[NSArray arrayWithObjects:messageNavigationController,jingCaiShunJianNavigationController ,tablelistNavigationController,faXianNavigationController,userNaviagtionViewController, nil];
    
    _tabBarController.tabBar.tintColor=[UIColor yellowColor];
    _tabBarController.tabBar.barTintColor=SystemThemeColor;

    [_tabBarController.tabBar setTranslucent:NO];
    
    messageNavigationController.tabBarItem.title=@"消息";
    messageNavigationController.tabBarItem.image=[UIImage imageNamed:@"home"];

    jingCaiShunJianNavigationController.tabBarItem.title=@"精彩瞬间";
    jingCaiShunJianNavigationController.tabBarItem.image=[UIImage imageNamed:@"discover"];
    
    tablelistNavigationController.tabBarItem.title=@"功能";
    tablelistNavigationController.tabBarItem.image=[UIImage imageNamed:@"home"];

    faXianNavigationController.tabBarItem.title=@"发现";
    faXianNavigationController.tabBarItem.image=[UIImage imageNamed:@"myself"];
    
    userNaviagtionViewController.tabBarItem.title=@"我的";
    userNaviagtionViewController.tabBarItem.image=[UIImage imageNamed:@"more"];

    _tabBarController.selectedIndex=2;
    self.window.rootViewController= _tabBarController;
    
    _tabBarItem2=[[[_tabBarController tabBar] items] objectAtIndex:1];
    [_tabBarItem2 setBadgeValue:[NSString stringWithFormat:@"%d",4]];
}
     
-(void)caculateCellBadegCount{
    _tabBarItem1=[[[_tabBarController tabBar] items] objectAtIndex:0];
    [globeResource sharedInstance].sum-=[globeResource sharedInstance].cellBadegnum;
    if ([globeResource sharedInstance].sum>0) {
        [_tabBarItem1 setBadgeValue:[NSString stringWithFormat:@"%d",[globeResource sharedInstance].sum]];
    }
    else
        [_tabBarItem1 setBadgeValue:nil];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
//    viewController.tabBarItem.badgeValue = nil;
}

#pragma mark IntroduceViewControllerDelegate
-(void)IntroduceViewController:(IntroduceViewController *)introduceViewController {
    [self showWidgetsLogin];
}

#pragma mark LoginViewControllerDelegate
-(void)LoginViewController:(LoginViewController *)loginViewController {
    [self showSaveLogin];
}

#pragma mark RegisterViewControllerDelegate
-(void)RegisterViewController:(RegisterViewController *)passController {
    [self showChooseStudent];
}

#pragma mark SaveLoginViewControllerDelegate
-(void)SaveLoginViewController:(SaveLoginViewController *)passController {
    [self showChooseStudent];
}

#pragma mark ChooseStudentViewControllerDelegate
-(void)ChooseStudentViewController:(ChooseStudentViewController *)passController {
    [self showTabbar];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
    NSLog(@"进入后台");
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"暂停活动");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"进入前台");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"开始活动");
//    application.applicationIconBadgeNumber = 0;//清除通知的右上角数目
    NSString *indetifier = [[NSBundle mainBundle] bundleIdentifier];//取消相应标识的本地通知
    for (UILocalNotification *notification in [[UIApplication sharedApplication] scheduledLocalNotifications]) {
        NSString *indentiString = [notification.userInfo objectForKey:@"localIdentifier"];
        if ([indentiString isEqualToString:indetifier] == YES) {
            [[UIApplication sharedApplication] cancelLocalNotification:notification];
            break;
        }
    }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
