//
//  HuoDongXiangQingViewController.m
//  HXXY
//
//  Created by Apple on 2/6/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "HuoDongXiangQingViewController.h"
#import "TouPiaoJieGuoViewController.h"
#import "RadioButton.h"

@interface HuoDongXiangQingViewController (){
    
   
    UILabel * huodongzhutiLabel;
    UILabel * kaisheshijianLabel;
    UILabel * jiesushijianLabel;
    UILabel * huodongneirongLabel;
    
    UILabel * toupiaoyiLabel;
    UILabel * toupiaoerLabel;
    UILabel * toupiaosanLabel;
    
    UIButton * toupiaoButton;
    
    UILabel * toupiaoxiang1;
    UILabel * toupiaoxiang2;
    UILabel * toupiaoxiang3;
}

@end

@implementation HuoDongXiangQingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"活动详情";
    huodongzhutiLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 70, 60, 20)];
    huodongzhutiLabel.text=@"活动主题:";
    huodongzhutiLabel.font=[UIFont fontWithName:@"Helvetica" size:11];

    kaisheshijianLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 90, 60, 20)];
    kaisheshijianLabel.text=@"开始时间:";
    kaisheshijianLabel.font=[UIFont fontWithName:@"Helvetica" size:11];
    
    jiesushijianLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 110, 60, 20)];
    jiesushijianLabel.text=@"结束时间:";
    jiesushijianLabel.font=[UIFont fontWithName:@"Helvetica" size:11];
    
    huodongneirongLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 130, 60, 20)];
    huodongneirongLabel.text=@"活动内容:";
    huodongneirongLabel.font=[UIFont fontWithName:@"Helvetica" size:11];
    
    [self.view addSubview:huodongzhutiLabel];
    [self.view addSubview:kaisheshijianLabel];
    [self.view addSubview:jiesushijianLabel];
    [self.view addSubview:huodongneirongLabel];
    
    RadioButton *RadioButton1= [[RadioButton alloc] initWithGroupId:@"id" index:1];
    RadioButton1.frame = CGRectMake(20, 150, 30, 30);
    
    RadioButton *RadioButton2= [[RadioButton alloc] initWithGroupId:@"id" index:2];
    RadioButton2.frame = CGRectMake(20, 180, 30, 30);
    
    RadioButton *RadioButton3= [[RadioButton alloc] initWithGroupId:@"id" index:3];
    RadioButton3.frame = CGRectMake(20, 210, 30, 30);
    
    toupiaoxiang1=[[UILabel alloc]initWithFrame:CGRectMake(50, 145, 60, 30)];
    toupiaoxiang2=[[UILabel alloc]initWithFrame:CGRectMake(50, 175, 60, 30)];
    toupiaoxiang3=[[UILabel alloc]initWithFrame:CGRectMake(50, 205, 60, 30)];
    
    toupiaoxiang1.text=@"投票项1";
    toupiaoxiang2.text=@"投票项2";
    toupiaoxiang3.text=@"投票项3";
    toupiaoxiang1.font=[UIFont fontWithName:@"Helvetica" size:11];
    toupiaoxiang2.font=[UIFont fontWithName:@"Helvetica" size:11];
    toupiaoxiang3.font=[UIFont fontWithName:@"Helvetica" size:11];

    
    [self.view addSubview:RadioButton1];
    [self.view addSubview:RadioButton2];
    [self.view addSubview:RadioButton3];
    
    [self.view addSubview:toupiaoxiang1];
    [self.view addSubview:toupiaoxiang2];
    [self.view addSubview:toupiaoxiang3];
    
    toupiaoButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    toupiaoButton.frame=CGRectMake(20, 240, 40, 30);
    [toupiaoButton setBackgroundColor:SystemThemeColor];
    [toupiaoButton.layer setBorderWidth:1.0];
    [toupiaoButton.layer setMasksToBounds:YES];
    [toupiaoButton.layer setCornerRadius:10.0];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 199/255.0f, 140/255.0f, 1 });

    [toupiaoButton.layer setBorderColor:colorref];//边框颜色;

    [toupiaoButton setTitle:@"投票" forState:UIControlStateNormal];
    toupiaoButton.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:11];;
    [toupiaoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [toupiaoButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:toupiaoButton];
    
}

-(void)buttonAction:(UIButton *)button{
    
    TouPiaoJieGuoViewController *  touPiaoJieGuoViewController=[[TouPiaoJieGuoViewController alloc]init];
    [self.navigationController pushViewController: touPiaoJieGuoViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
