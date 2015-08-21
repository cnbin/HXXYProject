//
//  YiJianFangKuiViewController.m
//  HXXY
//
//  Created by Apple on 11/18/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "YiJianFangKuiViewController.h"
#import "DXAlertView.h"
#import "RatingBar.h"

@interface YiJianFangKuiViewController ()

@end

@implementation YiJianFangKuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"意见反馈";
    [self initView];
    _contentTextView.delegate=self;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
}

-(void)initView{
    self.view.backgroundColor = [UIColor whiteColor];
    
    _contentTextView=[[UITextView alloc]initWithFrame:CGRectMake(20, 20, 280, 250)];
    _contentTextView.layer.backgroundColor = [[UIColor clearColor] CGColor];
    _contentTextView.layer.borderColor = [[UIColor colorWithRed:192.0/255.0 green:192.0/255.0 blue:192.0/255.0 alpha:1.0]CGColor];

    _contentTextView.layer.borderWidth = 1.0;
    _contentTextView.layer.cornerRadius = 3.0f;
    [_contentTextView.layer setMasksToBounds:YES];
    _contentTextView.scrollEnabled=YES;
    [self.view addSubview:_contentTextView];
    
    _labelPlaceholder=[[UILabel alloc]initWithFrame:CGRectMake(24, 22, 260,30)];
    _labelPlaceholder.text=@"有什么想说的,尽管来吐槽吧~";
    _labelPlaceholder.font=[UIFont fontWithName:@"Helvetica" size:13];
    _labelPlaceholder.enabled=NO;
    _labelPlaceholder.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_labelPlaceholder];
    
    UILabel *starLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 275, 40, 30)];
    starLabel.text=@"星级:";
    starLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    [self.view addSubview:starLabel];
    
    RatingBar *bar = [[RatingBar alloc] initWithFrame:CGRectMake(starLabel.frame.origin.x+starLabel.frame.size.width, starLabel.frame.origin.y, 180, 30)];
    [self.view addSubview:bar];
    
    
    UIButton *commit=[[UIButton alloc]initWithFrame:CGRectMake(20,_contentTextView.frame.origin.y+_contentTextView.frame.size.height+40, 280, 30)];
    [commit setTitle:@"发布" forState:UIControlStateNormal];
    [commit setTitleColor:[UIColor blackColor] forState: UIControlStateNormal];
    [commit setBackgroundColor:SystemThemeColor];
    
    [commit addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commit];
}



-(void)textViewDidChange:(UITextView *)textView
{
    _contentTextView.text = textView.text;
    if (_contentTextView.text.length == 0) {
        _labelPlaceholder.text = @"有什么想说的,尽管来吐槽吧~";
    }else{
        _labelPlaceholder.text = @"";
    }
}

-(void)buttonAction:(UIButton *)button
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
