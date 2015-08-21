//
//  HomeworkViewController.m
//  HXXY
//
//  Created by Apple on 1/16/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "HomeworkViewController.h"
#define cellHeight 40

@interface HomeworkViewController ()
{
    UILabel * _bianhaoLabel;
    UILabel * _homeworkLabel;
    UILabel * _sendtimeLabel;
    UILabel * _bianhaonumLabel;
    UILabel * _homeworkContentLaebl;
}

@end

@implementation HomeworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"家庭作业";
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _scrollView.contentSize = CGSizeMake(320,520);
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height)];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled=YES;
    [_tableView setSeparatorColor:[UIColor blackColor]];//设置分割线颜色
    [_scrollView  addSubview:_tableView];
    [self.view addSubview:_scrollView];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell;
    NSInteger row = indexPath.row;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        for (int i=1; i<=2; i++) {
            UILabel * tempLabel=[[UILabel alloc]initWithFrame:CGRectMake((320/3.0)*i+1, 0, 0.5, 40)];
            tempLabel.backgroundColor=[UIColor blackColor];
            [cell addSubview:tempLabel];
        }
        if (row==0) {
            _bianhaoLabel=[[UILabel alloc]initWithFrame:CGRectMake(45, 5, 30, 30)];
            _bianhaoLabel.text=@"编号";
            _bianhaoLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
            [cell.contentView addSubview:_bianhaoLabel];
            
            _homeworkLabel=[[UILabel alloc]initWithFrame:CGRectMake(135, 5, 60, 30)];
            _homeworkLabel.text=@"作业内容";
            _homeworkLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
            [cell.contentView addSubview:_homeworkLabel];
            
            _sendtimeLabel=[[UILabel alloc]initWithFrame:CGRectMake(240, 5, 60, 30)];
            _sendtimeLabel.text=@"发送时间";
            _sendtimeLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
            [cell.contentView addSubview:_sendtimeLabel];
        }
        if (row==1) {
            _bianhaonumLabel=[[UILabel alloc]initWithFrame:CGRectMake(55, 5, 30 ,30)];
            _bianhaonumLabel.text=@"1";
            _bianhaonumLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
            [cell.contentView addSubview:_bianhaonumLabel];
            
            _homeworkContentLaebl=[[UILabel alloc]initWithFrame:CGRectMake(120, 5, 105, 30)];
            _homeworkContentLaebl.text=@"第1课生字抄写三遍";
            _homeworkContentLaebl.font=[UIFont fontWithName:@"Helvetica" size:10];
            [cell.contentView addSubview:_homeworkContentLaebl];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
