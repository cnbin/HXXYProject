//
//  TouPiaoJieGuoViewController.m
//  HXXY
//
//  Created by Apple on 2/7/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "TouPiaoJieGuoViewController.h"

@interface TouPiaoJieGuoViewController (){
    UILabel * toupiaoxiang;
    UILabel * zongshu;
    UILabel * toupiaoxiang1;
    UILabel * toupiaoxiang2;
    UILabel * toupiaoxiang3;
}

@end

@implementation TouPiaoJieGuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"投票结果";
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _scrollView.contentSize = CGSizeMake(320,520);
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height)];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled=YES;
    [_tableView setSeparatorColor:[UIColor blackColor]];//设置分割线颜色
    [_scrollView  addSubview:_tableView];
    [self.view addSubview:_scrollView];
    
    _tableView.tableFooterView=[[UIView alloc]init];//隐藏多余的行数

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell;
    NSInteger row = indexPath.row;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        for (int i=1; i<=3; i++) {
            UILabel * tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(80*i+1, 0, 0.5, 40)];
            tempLabel.backgroundColor=[UIColor blackColor];
            [cell addSubview:tempLabel];
        }
        if (row==0) {
            toupiaoxiang=[[UILabel alloc]initWithFrame:CGRectMake(30, 5, 40, 30)];
            toupiaoxiang.text=@"投票项";
            toupiaoxiang.font=[UIFont fontWithName:@"Helvetica" size:11];
            [cell.contentView addSubview: toupiaoxiang];
            
            zongshu=[[UILabel alloc]initWithFrame:CGRectMake(30+80, 5, 30, 30)];
            zongshu.text=@"总数";
            zongshu.font=[UIFont fontWithName:@"Helvetica" size:11];
            [cell.contentView addSubview:zongshu];
            
        }
        if (row==1) {
            toupiaoxiang1=[[UILabel alloc]initWithFrame:CGRectMake(30, 5, 60, 30)];
            toupiaoxiang1.text=@"投票项1";
            toupiaoxiang1.font=[UIFont fontWithName:@"Helvetica" size:11];
            [cell.contentView addSubview: toupiaoxiang1];
        }
        if (row==2) {
            toupiaoxiang2=[[UILabel alloc]initWithFrame:CGRectMake(30, 5, 60, 30)];
            toupiaoxiang2.text=@"投票项2";
            toupiaoxiang2.font=[UIFont fontWithName:@"Helvetica" size:11];
            [cell.contentView addSubview: toupiaoxiang2];
        }
        if (row==3) {
            toupiaoxiang3=[[UILabel alloc]initWithFrame:CGRectMake(30, 5, 60, 30)];
            toupiaoxiang3.text=@"投票项3";
            toupiaoxiang3.font=[UIFont fontWithName:@"Helvetica" size:11];
            [cell.contentView addSubview: toupiaoxiang3];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
