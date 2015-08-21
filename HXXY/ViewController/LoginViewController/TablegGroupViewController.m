//
//  TablegGroupViewController.m
//  HXXY
//
//  Created by Apple on 1/15/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "TablegGroupViewController.h"

@interface TablegGroupViewController ()

@end

@implementation TablegGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *buttonImage = [[ UIBarButtonItem alloc ] initWithImage:
                                    [ UIImage imageNamed: @"nav_backbtn"]
                                                                      style: UIBarButtonItemStylePlain
                                                                     target: self
                                                                     action: @selector(navback:)
                                    ];
    self.navigationItem.leftBarButtonItem=buttonImage;
    
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect frame = self.view.frame;
    
    _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    [self.view addSubview:_tableView];
}

-(void)navback:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 返回各个cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

#pragma mark 返回分组个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 0;
}

#pragma mark 返回对应分组的cell个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;
}

#pragma mark 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier  =  @"fristCell";
    UITableViewCell *cell;
    cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
          return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
