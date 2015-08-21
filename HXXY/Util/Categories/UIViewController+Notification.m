//
//  UIViewController+Notification.m
//  aaa
//
//  Created by Apple on 14-10-13.
//  Copyright (c) 2014年 华讯网络投资有限公司. All rights reserved.



#import "UIViewController+Notification.h"

@implementation UIViewController(Notification)

#pragma mark 绑定键盘事件通知
- (void)setUpForDismissKeyboard {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    // 创建一个手势识别器
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    //创建操作队列
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    //键盘升起
    [nc addObserverForName:UIKeyboardWillShowNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view addGestureRecognizer:singleTapGR];//关键语句，给self.view添加一个手势监测；
                }];
    NSLog(@"键盘升起");
    //键盘降下
    [nc addObserverForName:UIKeyboardWillHideNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view removeGestureRecognizer:singleTapGR];
                }];
}

#pragma mark 点击事件（当点击输入框之外时，收起键盘）
- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    //此method会将self.view里所有的subview的first responder都resign掉
    [self.view endEditing:YES];
    NSLog(@"键盘降落");
    
}


@end