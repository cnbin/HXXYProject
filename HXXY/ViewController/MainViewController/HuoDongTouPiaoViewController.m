//
//  HuoDongTouPiaoViewController.m
//  HXXY
//
//  Created by Apple on 2/6/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "HuoDongTouPiaoViewController.h"
#import "HuoDongXiangQingViewController.h"
#define cellHeight 40

@interface HuoDongTouPiaoViewController (){
    UILabel * bianhaoLabel;
    UILabel * huodongmingchengLabel;
    UILabel * zhuangtaiLabel;
    UILabel * toupiaojieguoLabel;
    
    UIButton * toupiaojieguoButton;
}

@end

@implementation HuoDongTouPiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"活动投票";
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
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  3;
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
            bianhaoLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, 5, 30, 30)];
            bianhaoLabel.text=@"编号";
            bianhaoLabel.font=[UIFont fontWithName:@"Helvetica" size:11];
            [cell.contentView addSubview:bianhaoLabel];
            
            huodongmingchengLabel=[[UILabel alloc]initWithFrame:CGRectMake(30+70, 5, 60, 30)];
            huodongmingchengLabel.text=@"活动名称";
            huodongmingchengLabel.font=[UIFont fontWithName:@"Helvetica" size:11];
            [cell.contentView addSubview:huodongmingchengLabel];
            
            zhuangtaiLabel=[[UILabel alloc]initWithFrame:CGRectMake(30+160, 5, 60, 30)];
            zhuangtaiLabel.text=@"状态";
            zhuangtaiLabel.font=[UIFont fontWithName:@"Helvetica" size:11];
            [cell.contentView addSubview:zhuangtaiLabel];
            
            toupiaojieguoLabel=[[UILabel alloc]initWithFrame:CGRectMake(30+230, 5, 60, 30)];
            toupiaojieguoLabel.text=@"投票结果";
            toupiaojieguoLabel.font=[UIFont fontWithName:@"Helvetica" size:11];
            [cell.contentView addSubview:toupiaojieguoLabel];

        }
        if (row==1) {
            toupiaojieguoButton=[[UIButton alloc]initWithFrame:CGRectMake(30+222, 5, 60, 30)];
            [toupiaojieguoButton setTitle:@"投票结果" forState:UIControlStateNormal];
            toupiaojieguoButton.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:11];;
            [toupiaojieguoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [toupiaojieguoButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

            [cell.contentView addSubview:toupiaojieguoButton];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(void)buttonAction:(UIButton *)button{

    HuoDongXiangQingViewController *  huoDongXiangQingViewController=[[HuoDongXiangQingViewController alloc]init];
    [self.navigationController pushViewController:huoDongXiangQingViewController animated:YES];

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
