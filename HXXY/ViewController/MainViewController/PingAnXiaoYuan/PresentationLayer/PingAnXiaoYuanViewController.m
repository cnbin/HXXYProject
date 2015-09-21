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
    
    UILabel * _lgradeLabel;
    UILabel * _lclassesLabel;
    UILabel * _lstudentNameLabel;
    UILabel * _lioOutLabel;
    UILabel * _lshuakaLabel;
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
    
    UIBarButtonItem *buttonImage = [[ UIBarButtonItem alloc ] initWithImage:
                                    [ UIImage imageNamed:@"nav_backbtn"]
                                                                      style: UIBarButtonItemStylePlain
                                                                     target: self
                                                                     action: @selector(navback:)
                                    ];
    
    self.navigationItem.leftBarButtonItem = buttonImage;
 
    
}

-(void)navback:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [self.tableView setFrame:CGRectMake(0, 40, 320, self.view.frame.size.height)];
//}

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
    
//    for (int i=1; i<=4; i++) {
//        UILabel * tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(((320.0-90)/4)*i+1, 0, 0.5, cellHeight)];
//        tempLabel.backgroundColor=[UIColor blackColor];
//        [cell addSubview:tempLabel];
//    }
    
//    _gradeLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 12, 40, 15)];
//    _classesLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 12, 40, 15)];
//    _studentNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(135, 12, 40, 15)];
//    _inOutLabel = [[UILabel alloc]initWithFrame:CGRectMake(185, 12, 50, 15)];
//    _iotimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(245, 5, 100, 15)];
    
    _gradeLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, 40, 15)];
    _classesLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 5, 40, 15)];
    _studentNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 5, 40, 15)];
    _inOutLabel = [[UILabel alloc]initWithFrame:CGRectMake(140, 5, 50, 15)];
    _shuakaLaebl = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 50, 15)];
    _iotimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 20, 100, 15)];
    
    _gradeLabel.font=[UIFont fontWithName:@"Helvetica" size:10];
    _classesLabel.font=[UIFont fontWithName:@"Helvetica" size:10];
    _studentNameLabel.font=[UIFont fontWithName:@"Helvetica" size:10];
    _inOutLabel.font=[UIFont fontWithName:@"Helvetica" size:10];
    _iotimeLabel.font=[UIFont fontWithName:@"Helvetica" size:10];
    _shuakaLaebl.font=[UIFont fontWithName:@"Helvetica" size:10];
    
    _gradeLabel.text = [[self.listData objectAtIndex:0] objectAtIndex:row];
    _classesLabel.text = [[self.listData objectAtIndex:1] objectAtIndex:row];
    _studentNameLabel.text = [[self.listData objectAtIndex:2] objectAtIndex:row];
    _inOutLabel.text = [[self.listData objectAtIndex:3] objectAtIndex:row];
    _iotimeLabel.text = [[self.listData objectAtIndex:4] objectAtIndex:row];
    _shuakaLaebl.text=@"刷卡时间:";
    
    [cell.contentView addSubview:_gradeLabel];
    [cell.contentView addSubview:_classesLabel];
    [cell.contentView addSubview:_studentNameLabel];
    [cell.contentView addSubview:_inOutLabel];
    [cell.contentView addSubview:_iotimeLabel];
    [cell.contentView addSubview:_shuakaLaebl];

    
    
//    if (row==0) {
//        
//    _lgradeLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 5, 30, 30)];
//    _lgradeLabel.text=@"年级";
//    _lgradeLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
//    
//    
//    _lclassesLabel=[[UILabel alloc]initWithFrame:CGRectMake(75, 5, 60, 30)];
//    _lclassesLabel.text=@"班级";
//    _lclassesLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
//    
//    
//    _lstudentNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(130, 5, 60, 30)];
//    _lstudentNameLabel.text=@"姓名";
//    _lstudentNameLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
//    
//    _lioOutLabel=[[UILabel alloc]initWithFrame:CGRectMake(190, 5, 60, 30)];
//    _lioOutLabel.text=@"状态";
//    _lioOutLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
//    
//    _lshuakaLabel=[[UILabel alloc]initWithFrame:CGRectMake(245, 5, 60, 30)];
//    _lshuakaLabel.text=@"刷卡时间";
//    _lshuakaLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
//     [cell.contentView addSubview:_lgradeLabel];
//     [cell.contentView addSubview:_lclassesLabel];
//     [cell.contentView addSubview:_lstudentNameLabel];
//     [cell.contentView addSubview:_lioOutLabel];
//     [cell.contentView addSubview:_lshuakaLabel];
//
//    }
    
//    for(int i=0;i<[[self.listData objectAtIndex:2] count];i++)
//    {
//        if(row == (i+1))
//        {
//        _gradeLabel.text = [[self.listData objectAtIndex:0] objectAtIndex:i];
//        _classesLabel.text = [[self.listData objectAtIndex:1] objectAtIndex:i];
//        _studentNameLabel.text = [[self.listData objectAtIndex:2] objectAtIndex:i];
//        _inOutLabel.text = [[self.listData objectAtIndex:3] objectAtIndex:i];
//        _iotimeLabel1.text = [[self.listData objectAtIndex:4] objectAtIndex:i];
//        _iotimeLabel2.text = [[self.listData objectAtIndex:5] objectAtIndex:i];
//        
//        [cell.contentView addSubview:_gradeLabel];
//        [cell.contentView addSubview:_classesLabel];
//        [cell.contentView addSubview:_studentNameLabel];
//        [cell.contentView addSubview:_inOutLabel];
//        [cell.contentView addSubview:_iotimeLabel1];
//        [cell.contentView addSubview:_iotimeLabel2];
//      }
//    }
    
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
