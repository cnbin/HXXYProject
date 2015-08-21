//
//  YingYongTuiJianViewController.m
//  HXXY
//
//  Created by Apple on 1/14/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "YingYongTuiJianViewController.h"

@interface YingYongTuiJianViewController ()
{
    UIImageView * _imageView1;
    UILabel * _imageLabel1;
    UILabel * _detailLabel1;
    UIButton * _imageButton1;
 
}
@end

@implementation YingYongTuiJianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"应用推荐";
}

#pragma mark 返回分组个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

#pragma mark 返回对应分组的cell个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

#pragma mark 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section=indexPath.section;
    static NSString *CellIdentifier  =  @"fristCell";
    UITableViewCell *cell;
    cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
         _imageView1=[[UIImageView alloc]initWithFrame:CGRectMake(20,7.5, 25, 25)];
        
        _imageLabel1=[[UILabel alloc]initWithFrame:CGRectMake(60, 2, 100, 25)];
        _imageLabel1.font=[UIFont fontWithName:@"Helvetica" size:13];
        
        _detailLabel1=[[UILabel alloc]initWithFrame:CGRectMake(60, 26, 100, 10)];
        _detailLabel1.backgroundColor=[UIColor clearColor];
        _detailLabel1.textColor=[UIColor grayColor];
        _detailLabel1.font=[UIFont fontWithName:@"Helvetica" size:8];
        switch (section) {
            case 0:
            {
               
                _imageView1.image=[UIImage imageNamed:@"16"];
                _imageLabel1.text=@"宝宝在线";
                
                _detailLabel1.text =@"显示宝宝所在的学校,班级";
               
           
            }
                break;
            case 1:
            {
                _imageView1.image=[UIImage imageNamed:@"17"];
                _imageLabel1.text=@"平安校园";
                _detailLabel1.text =@"显示宝宝到校可离校信息";
            }
                break;
            default:
                break;
        }
        
    }
        _imageButton1=[UIButton buttonWithType:UIButtonTypeCustom];
        _imageButton1.frame=CGRectMake(320-70, 10, 50, 20);
        
        [_imageButton1.layer setCornerRadius:10.0];
        [_imageButton1.layer setBorderWidth:1.0];
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 199/255.0f, 140/255.0f, 1 });
        [_imageButton1.layer setBorderColor:colorref];//边框颜色;
        [_imageButton1.layer setMasksToBounds:YES];
        [_imageButton1 setTitle:@"下载" forState:UIControlStateNormal];
        [_imageButton1 setTitleColor:SystemThemeColor forState:UIControlStateNormal];
        _imageButton1.titleLabel.font  = [UIFont fontWithName:@"Helvetica" size:10];
        

        [cell.contentView addSubview:_imageView1];
        [cell.contentView addSubview:_imageLabel1];
        [cell.contentView addSubview:_detailLabel1];
        [cell.contentView addSubview:_imageButton1];

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
