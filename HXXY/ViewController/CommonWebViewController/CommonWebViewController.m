//
//  CommonWebViewController.m
//  HXXY
//
//  Created by Apple on 12/24/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "CommonWebViewController.h"

@interface CommonWebViewController ()

@end

@implementation CommonWebViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.toolbarHidden = YES;
//    self.view.contentMode = UIViewContentModeScaleAspectFill;
    self.title=[self.delegate viewTitle];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *buttonImage = [[ UIBarButtonItem alloc ] initWithImage:
                                    [ UIImage imageNamed: @"nav_backbtn"]
                                                                       style: UIBarButtonItemStylePlain
                                                                      target: self  
                                                                      action: @selector(navback:)
                                    ];
    self.navigationItem.leftBarButtonItem=buttonImage;
    
    CGSize viewSize = self.view.frame.size;
    float toolbarHeight = 44.0;
    CGRect toolbarFrame = CGRectMake(0,viewSize.height-toolbarHeight,viewSize.width,toolbarHeight);
    viewbar = [[UIView alloc] initWithFrame:toolbarFrame];
    myToolbar = [[UIToolbar alloc] initWithFrame:toolbarFrame];
    myToolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin
                                |UIViewAutoresizingFlexibleTopMargin;
//    myToolbar.barTintColor=SystemThemeColor; 背景颜色
    [myToolbar setTintColor:SystemThemeColor];
    UIBarButtonItem *backButtonItem = [[ UIBarButtonItem alloc ] initWithImage:
                                       [ UIImage imageNamed:@"backButtonItem" ]
                                                                          style: UIBarButtonItemStylePlain
                                                                         target: self
                                                                         action: @selector(backButton:)
                                       ];
   
    UIBarButtonItem *spacerButton1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                  target:nil
                                                                                  action:nil];
    UIBarButtonItem *forwardButtonItem = [[ UIBarButtonItem alloc ] initWithImage:
                                          [ UIImage imageNamed:@"forwardButtonItem" ]
                                                                             style: UIBarButtonItemStylePlain
                                                                            target: self
                                                                            action: @selector(forwardButton:)
                                          ];
    UIBarButtonItem *spacerButton2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                  target:nil
                                                                                  action:nil];
    
    UIBarButtonItem *stopButtonItem =[[UIBarButtonItem alloc ] initWithBarButtonSystemItem: UIBarButtonSystemItemStop
                                                                                    target: self
                                                                                    action: @selector(stopButton:)
                                      ];
    UIBarButtonItem *spacerButton3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                  target:nil
                                                                                  action:nil];
    UIBarButtonItem *refreshButtonItem = [[UIBarButtonItem alloc]
                                          initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                          target: self
                                          action: @selector(updateActions:)
                                          ];
    NSArray *buttons =[NSArray arrayWithObjects:backButtonItem,spacerButton1,forwardButtonItem,spacerButton2,stopButtonItem,spacerButton3,refreshButtonItem,nil];
    
    [self CacheMethod];
    [self loadWebPageWithString:_url];
    [self ReachabilityTest];
    
    activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame : CGRectMake(0.0f, 0.0f, 62.0f, 62.0f)];
    [activityIndicatorView setCenter: self.view.center];
    [activityIndicatorView setActivityIndicatorViewStyle: UIActivityIndicatorViewStyleGray];
    [self.view addSubview : activityIndicatorView];
    
    [myToolbar setItems:buttons animated:YES];
    [myToolbar setTag:1];
    [self.view addSubview:myToolbar];
}

-(void)navback:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//底部toolbar事件
-(void)backButton:(UIButton *)button{

    [_webManagerController.webView goBack];
    [self ReachabilityTest];
}

-(void)forwardButton:(UIButton *)button{
    
    [_webManagerController.webView goForward];
    [self ReachabilityTest];
}

-(void)stopButton:(UIButton *)button{
    [_webManagerController.webView stopLoading];
  
}

-(void)updateActions:(UIButton *)button{
    [_webManagerController.webView reload];
    [self ReachabilityTest];
}

-(void)ReachabilityTest{
    if (![Reachability networkAvailable]) {
        [self.view makeToast:@"当前网络不可用,请检查网络设置" duration:5.0 position:@"center"];
    }
    
}

-(void)CacheMethod{
    //内存为20M,Disk为200M
    CustomURLCache *urlCache = [[CustomURLCache alloc] initWithMemoryCapacity:20 * 1024 * 1024
                                                                 diskCapacity:200 * 1024 * 1024
                                                                     diskPath:nil
                                                                    cacheTime:0];
    [CustomURLCache setSharedURLCache:urlCache];
    
    _webManagerController=[WebManagerController sharedInstance];
    _webManagerController.webView = [[UIWebView alloc] init];
    _webManagerController.webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    _webManagerController.webView.delegate = self;
    _webManagerController.webView.scalesPageToFit = YES;
    _url=[self.delegate viewUrl];
    [self.view addSubview:_webManagerController.webView];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeLeft.delegate=self;
    [_webManagerController.webView addGestureRecognizer:swipeLeft];

    UISwipeGestureRecognizer  *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeRight.direction=UISwipeGestureRecognizerDirectionRight;
    swipeRight.delegate=self;
    [_webManagerController.webView addGestureRecognizer:swipeRight];
    
    UIPanGestureRecognizer* singlePan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [self.view addGestureRecognizer:singlePan];
    singlePan.delegate = self;
    singlePan.cancelsTouchesInView = NO;

}

-(void)swipe:(UISwipeGestureRecognizer *)g{
    if (g.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"swipe");
      [_webManagerController.webView goBack];
        
    } else {
       [_webManagerController.webView goForward];
    }
}

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
 
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateEnded:{ // UIGestureRecognizerStateRecognized = UIGestureRecognizerStateEnded // 正常情况下只响应这个消息
            NSLog(@"======UIGestureRecognizerStateEnded || UIGestureRecognizerStateRecognized");
            CGContextRef context = UIGraphicsGetCurrentContext();
            [UIView beginAnimations:nil context:context];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationDuration:1.0];
            [[self.view viewWithTag:1] setAlpha:1.0f];
            [UIView commitAnimations];
            
            break;
        }
        case UIGestureRecognizerStateFailed:{ //
            NSLog(@"======UIGestureRecognizerStateFailed");
            break;
        }
        case UIGestureRecognizerStatePossible:{ //
            NSLog(@"======UIGestureRecognizerStatePossible");
            break;
        }
        default:{
            NSLog(@"======Unknow gestureRecognizer");
            CGContextRef context = UIGraphicsGetCurrentContext();
            [UIView beginAnimations:nil context:context];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationDuration:1.0];
            [[self.view viewWithTag:1] setAlpha:0.0f];
            [UIView commitAnimations];
            
            break;
        }
    }  
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    NSLog(@"同时接收两个事件");
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    NSLog(@"1");
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"2");
    return YES;
}

#pragma mark 加载地址
-(void)loadWebPageWithString:(NSString *)urlString
{
    NSURL *url =[NSURL URLWithString:urlString];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [_webManagerController.webView loadRequest:request];
}

#pragma mark 开始加载
-(void)webViewDidStartLoad:(UIWebView *)webView
{
     [activityIndicatorView startAnimating];
}

#pragma mark 加载完毕
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
     [activityIndicatorView stopAnimating];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alterview = [[UIAlertView alloc] initWithTitle:@"请求错误：" message:[error localizedDescription]  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alterview show];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    CustomURLCache *urlCache = (CustomURLCache *)[NSURLCache sharedURLCache];
    [urlCache removeAllCachedResponses];
    
}
@end
