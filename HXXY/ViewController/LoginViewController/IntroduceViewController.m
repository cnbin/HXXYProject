//
//  IntroduceViewController.m
//  HXXY
//
//  Created by Apple on 12/17/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "IntroduceViewController.h"
#define IMAGE_NUM 3
@interface IntroduceViewController (){
    UIScrollView  * _scrollView;
    UIPageControl * _pageControl;
    UIView * _subView;
    UIButton *IntroduceButton;
}

@end

@implementation IntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

-(void)initView{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_scrollView];
    
    float width = _scrollView.bounds.size.width;
    float height = _scrollView.bounds.size.height;
    
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(width * IMAGE_NUM, height);
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((width-60)/2,height-28, 60, 10)];
    }
    
    [self.view addSubview:_pageControl];
    _pageControl.numberOfPages = IMAGE_NUM;
    
    [self loadContentsPage:0];
    [self loadContentsPage:1];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (![Reachability networkAvailable]) {
        [self.view makeToast:@"当前网络不可用,请检查网络设置" duration:5.0 position:@"center"];
    }
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_async(mainQueue, ^(void) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 1000.0f;
        //开始定位
        [_locationManager startUpdatingLocation];
    });
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //停止定位
    [_locationManager stopUpdatingLocation];
}

#pragma mark Core Location委托方法用于实现位置的更新
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *currLocation = [locations lastObject];
    NSLog(@"纬度为%@", [NSString stringWithFormat:@"%3.5f",
                     currLocation.coordinate.latitude]);
    NSLog(@"经度为%@", [NSString stringWithFormat:@"%3.5f",
                     currLocation.coordinate.longitude]);
    NSLog(@"高度为%@",  [NSString stringWithFormat:@"%3.5f",
                      currLocation.altitude]);
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error: %@",error);
}

#pragma mark scrollView delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    float width = scrollView.frame.size.width;
    float offsetX = scrollView.contentOffset.x;
    int pageNo = floor(offsetX/width);
    _pageControl.currentPage = pageNo;
    
    if (pageNo!=2) {
        [self loadContentsPage:pageNo - 1];
        [self loadContentsPage:pageNo];
        [self loadContentsPage:pageNo + 1];
    }
    
}

- (void)loadContentsPage:(int)pageNo{
    
    float width = _scrollView.frame.size.width;
    float height = _scrollView.frame.size.height;
    
    NSString *fileName = [NSString stringWithFormat:@"image%d",pageNo];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(width*pageNo, 0, width, height);
    imageView.userInteractionEnabled=YES;
    
    IntroduceButton=[UIButton buttonWithType:UIButtonTypeCustom];
    IntroduceButton.frame=CGRectMake((width-100)/2,height-60, 100, 30);
    [IntroduceButton setTitle:@"立即新体验" forState:UIControlStateNormal];
    [IntroduceButton setTintColor:[UIColor whiteColor]];
    [IntroduceButton setBackgroundColor:SystemThemeColor];
    [IntroduceButton.layer setMasksToBounds:YES];
    [IntroduceButton.layer setCornerRadius:10.0];
    [IntroduceButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    if (pageNo==2) {
        
        [imageView addSubview:IntroduceButton];
        
    }
    [_scrollView addSubview:imageView];
}

-(void)buttonAction:(UIButton *)button{
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"key_isLogined"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.delegate IntroduceViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
