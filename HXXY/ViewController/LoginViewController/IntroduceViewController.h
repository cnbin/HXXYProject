//
//  IntroduceViewController.h
//  HXXY
//
//  Created by Apple on 12/17/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "Reachability.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>

@class IntroduceViewController;
@protocol IntroduceViewControllerDelegate <NSObject>

-(void)IntroduceViewController:(IntroduceViewController *)introduceViewController;

@end

@interface IntroduceViewController : UIViewController<UIScrollViewDelegate,CLLocationManagerDelegate>
@property (weak,nonatomic) id<IntroduceViewControllerDelegate> delegate;
@property(nonatomic, strong) CLLocationManager *locationManager;

@end
