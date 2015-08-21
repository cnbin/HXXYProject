//
//  HXNavigationController.m
//  HXXY
//
//  Created by Apple on 1/12/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "HXNavigationController.h"

@interface HXNavigationController ()

@end

@implementation HXNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    [[UINavigationBar appearance] setBarTintColor:SystemThemeColor];
    [self.view addSubview:bar];
}

@end
