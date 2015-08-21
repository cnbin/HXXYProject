//
//  RegisterViewController.m
//  HXXY
//
//  Created by Apple on 12/13/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"登录";
    [self initView];
}

-(void)initView{
    UILabel * registerpassword=[[UILabel alloc]initWithFrame:CGRectMake(20, 100, 150, 30)];
    registerpassword.text=@"输入登录密码:";
    [self.view addSubview:registerpassword];
    
    registerpasswordText=[[UITextField alloc]initWithFrame:CGRectMake(130,registerpassword.frame.origin.y, 170, 30)];
    registerpasswordText.borderStyle=UITextBorderStyleRoundedRect;
    registerpasswordText.placeholder=@"输入4-12位密码";
    registerpasswordText.secureTextEntry=YES;
    registerpasswordText.textAlignment =NSTextAlignmentCenter;
    registerpasswordText.clearButtonMode = UITextFieldViewModeWhileEditing;
    registerpasswordText.returnKeyType =UIReturnKeyDone;
    [self.view addSubview:registerpasswordText];
    
    UIButton *saveButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    saveButton.frame=CGRectMake(20, registerpassword.frame.origin.y+registerpassword.frame.size.height+20, 280, 30);
    [saveButton setTitle:@"登录" forState:UIControlStateNormal];
    [saveButton setBackgroundColor:SystemThemeColor];
    [saveButton.layer setMasksToBounds:YES];
    [saveButton.layer setCornerRadius:10.0];
    [saveButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];

}

-(void)buttonAction:(UIButton *)button{
//    if (registerpasswordText.text.length == 0) {
//        [self.view makeToast:@"密码不能为空。" duration:1.0 position:@"center"];
//        return;
//    }
//    if (![registerpasswordText.text isEqual:@"15766889131"]) {
//        [self.view makeToast:@"密码设置错误。" duration:1.0 position:@"center"];
//        return;
//    }
    [self.view makeToast:@"登录成功" duration:1.0 position:@"center"];
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.delegate RegisterViewController:self ];
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
