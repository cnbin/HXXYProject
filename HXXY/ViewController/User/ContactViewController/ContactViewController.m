//
//  ContactViewController.m
//  HXXY
//
//  Created by Apple on 1/16/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController (){
    UILabel * _titleLabel;
    UILabel * _companyLabel;
    UILabel * _addressLabel;
    UILabel * _postalLabel;
    UILabel * _phoneLabel;
    UILabel * _faxLabel;
    UILabel * _mailboxLabel;
    
    UILabel * _ztitleLabel;
    UILabel * _zcompanyLabel;
    UILabel * _zaddressLabel;
    UILabel * _zaddreddLabel2;
    UILabel * _zpostalLabel;
    UILabel * _zphoneLabel;
    UILabel * _zfaxLabel;
    UILabel * _zmailboxLabel;
}

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"联系方式";
    [self initView];
}

-(void)initView{
    _companyLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 70, 300, 30)];
    _companyLabel.text=@"广东华讯网络投资有限公司";
    
    _addressLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 90, 300, 30)];
    _addressLabel.text=@"地址:揭阳市榕城区建阳路西段科技馆大楼3-4层";
    
    _postalLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 110, 300, 30)];
    _postalLabel.text=@"邮编:522000";
    
    _phoneLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 130, 300, 30)];
    _phoneLabel.text=@"总机:0663-8782222";
    
    _faxLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 150, 300, 30)];
    _faxLabel.text=@"传真:0663-8687636";
    
    _mailboxLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 170, 300, 30)];
    _mailboxLabel.text=@"邮箱:bussiness@huaxun.cc";
    
    _companyLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _addressLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _postalLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _phoneLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _faxLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _mailboxLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _mailboxLabel.textColor=[UIColor blueColor];
    
    [self.view addSubview:_companyLabel];
    [self.view addSubview:_addressLabel];
    [self.view addSubview:_postalLabel];
    [self.view addSubview:_phoneLabel];
    [self.view addSubview:_faxLabel];
    [self.view addSubview:_mailboxLabel];
    
    _zcompanyLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 200, 300, 30)];
    _zcompanyLabel.text=@"广州中德信息科技有限公司(总公司)";
    
    _zaddressLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 220, 300, 30)];
    _zaddressLabel.text=@"地址:广州市越秀区东风东路767号东宝大厦五栋";
    
    _zaddreddLabel2=[[UILabel alloc]initWithFrame:CGRectMake(20, 240, 300, 30)];
    _zaddreddLabel2.text=@"        506室";
    
    _zpostalLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 260, 300, 30)];
    _zpostalLabel.text=@"邮编:510000";
    
    _zphoneLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 280, 300, 30)];
    _zphoneLabel.text=@"总机:020-38327138";
    
    _zfaxLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 300, 300, 30)];
    _zfaxLabel.text=@"传真:020-38327138";
    
    _zmailboxLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 320, 300, 30)];
    _zmailboxLabel.text=@"邮箱:bussiness@zdtech.cc";
    
    _zcompanyLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _zaddressLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _zaddreddLabel2.font=[UIFont fontWithName:@"Helvetica" size:13];
    _zpostalLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _zphoneLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _zfaxLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _zmailboxLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _zmailboxLabel.textColor=[UIColor blueColor];
    
    [self.view addSubview:_zcompanyLabel];
    [self.view addSubview:_zaddressLabel];
    [self.view addSubview:_zaddreddLabel2];
    [self.view addSubview:_zpostalLabel];
    [self.view addSubview:_zphoneLabel];
    [self.view addSubview:_zfaxLabel];
    [self.view addSubview:_zmailboxLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
