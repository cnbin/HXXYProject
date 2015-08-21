//
//  PingAnXiaoYuanViewController.m
//  HXXY
//
//  Created by Apple on 1/16/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "PingAnXiaoYuanViewController.h"
#define cellHeight 40

@interface PingAnXiaoYuanViewController (){
    
    UILabel * _gradeLabel;
    UILabel * _classesLabel;
    UILabel * _studentNameLabel;
    UILabel * _inOutLabel;
    UILabel * _iotimeLabel;
    UILabel * _shuakaLaebl;
}

@end

@implementation PingAnXiaoYuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"平安校园";
    
    _bl = [NoteBL new];
    _bl.delegate = self;
    [_bl findAllNotes];

    //初始化UIRefreshControl
    UIRefreshControl *rc = [[UIRefreshControl alloc] init];
    rc.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [rc addTarget:self action:@selector(refreshTableView) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = rc;
    
    [NSTimer scheduledTimerWithTimeInterval:10
                                         target:self
                                       selector:@selector(updateDataMethod:)
                                       userInfo:nil
                                        repeats:YES];
    

}

-(void)updateDataMethod:(NSTimer*)timer {
 
    _bl.delegate = self;
    [_bl findAllNotes];
}

-(void) refreshTableView
{
    if (self.refreshControl.refreshing) {
        self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"加载中..."];
        _bl.delegate = self;
        [_bl findAllNotes];
    }
}

#pragma mark - 处理通知
//查询所有数据方法 成功
- (void)findAllNotesFinished:(NSMutableArray *)list
{
    self.listData =list;
    
    [self.tableView reloadData];
    
    if (self.refreshControl) {
        [self.refreshControl endRefreshing];
        self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    }

}

-(void)buttonAction:(UIButton *)button{
    _bl.delegate = self;
    [_bl findAllNotes];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"count is %lu", (unsigned long)[[self.listData objectAtIndex:2] count]);
 
    return  [[self.listData objectAtIndex:2] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell;
    NSInteger row =indexPath.row;
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    _gradeLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, 60, 15)];
    _classesLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 5, 60, 15)];
    _studentNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(140, 5, 60, 15)];
    _inOutLabel = [[UILabel alloc]initWithFrame:CGRectMake(200, 5, 100, 15)];
    _iotimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 20, 250, 15)];
    _shuakaLaebl = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 15)];

    _gradeLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _classesLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _studentNameLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _inOutLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _iotimeLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
    _shuakaLaebl.font=[UIFont fontWithName:@"Helvetica" size:13];
    
    _gradeLabel.text = [[self.listData objectAtIndex:0] objectAtIndex:row];
    _classesLabel.text = [[self.listData objectAtIndex:1] objectAtIndex:row];
    _studentNameLabel.text = [[self.listData objectAtIndex:2] objectAtIndex:row];
    _inOutLabel.text = [[self.listData objectAtIndex:3] objectAtIndex:row];
    _iotimeLabel.text = [[self.listData objectAtIndex:4] objectAtIndex:row];
    _shuakaLaebl.text = @"刷卡时间:";
    
    [cell.contentView addSubview:_gradeLabel];
    [cell.contentView addSubview:_classesLabel];
    [cell.contentView addSubview:_studentNameLabel];
    [cell.contentView addSubview:_inOutLabel];
    [cell.contentView addSubview:_iotimeLabel];
    [cell.contentView addSubview:_shuakaLaebl];
    
    cell.userInteractionEnabled = NO;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

    
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
