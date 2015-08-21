//
//  UserViewController.m
//  HXXY
//
//  Created by Apple on 11/18/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "UserViewController.h"
#import "YiJianFangKuiViewController.h"
#import "DXAlertView.h"
#import "RegisterViewController.h"
#import "userTableViewCell.h"
#import "SheZhiViewController.h"
#import "ContactViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的";
    [self initView];
}

-(void)initView{
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect frame = self.view.frame;
    
    _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    UIButton *cancle=[[UIButton alloc]initWithFrame:CGRectMake(20, 300, 280, 30)];
    [cancle setTitle:@"退出程序" forState:UIControlStateNormal];
    [cancle setBackgroundColor:SystemThemeColor];
    [cancle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancle.layer setMasksToBounds:YES];
    [cancle.layer setCornerRadius:10.0];
    [cancle addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    cancle.tag=1;
    [_tableView addSubview:cancle];
    
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    [self.view addSubview:_tableView];
    
    _imageButtonitemView=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-35, 12, 20, 20)];
    [_imageButtonitemView setImage:[UIImage imageNamed:@"flower.png"] forState:UIControlStateNormal];
    [_imageButtonitemView addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    _imageButtonitemView.tag=2;
    [self.navigationController.navigationBar addSubview:_imageButtonitemView];
   
}

-(void)buttonAction:(UIButton *)button{
    switch (button.tag) {
        case 1:
        {
            DXAlertView *alert = [[DXAlertView alloc] initWithTitle:@"温馨提示" contentText:@"您确定要退出当前账号吗？" leftButtonTitle:@"取消" rightButtonTitle:@"确定"];
            
            [alert show];
            alert.leftBlock = ^() {
                NSLog(@"left button clicked");
            };
            
            alert.rightBlock = ^() {
                NSLog(@"right button clicked");
                exit(0);
            };
        }
            break;
            case 2:
        {
            SheZhiViewController * sheZhiViewController=[[SheZhiViewController alloc]init];
            [self presentViewController:[[UINavigationController alloc] initWithRootViewController:sheZhiViewController] animated:YES completion:nil];

        }
        default:
            break;
    }
    }

#pragma mark 界面即将显示的时候调用
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //reloadData刷新整个表格。
    [_tableView reloadData];
}

#pragma mark 返回分组个数
//numberOfSectionsInTableView是UITableViewDelegate中的方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

#pragma mark 返回对应分组的cell个数
//调用的是UITableViewDataSource的tableView:方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 3;
            break;
        case 4:
            return 0;
            break;
        default:
            break;
    }
    return 0;
}

#pragma mark 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    
    static NSString *FristCellIdentifier  =  @"fristCell";

    userTableViewCell *cell;
    cell =[tableView dequeueReusableCellWithIdentifier:FristCellIdentifier];
    if (cell == nil) {
        cell =[[userTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FristCellIdentifier];
        switch (section) {
            case 0:
            {
                switch (row){
                    case 0:
                    {
                        cell.textLabel.text=@"消息推送设置";
                    }
                        break;
                    case 1:
                    {
                        cell.textLabel.text=@"华讯星园使用日期";
                    }
                        break;
                    default:
                        break;
                        
                }
                break;
            
            case 1:
                {
                    switch (row){
                        case 0:
                        {
                            cell.textLabel.text=@"更新版本";
                        }
                            break;
                        case 1:
                        {
                            
                            cell.textLabel.text=@"关于";
                        }
                            break;
                        case 2:
                        {
                            cell.textLabel.text=@"意见反馈";
                        }
                            break;
                        default:
                            break;
                    }
                }
                break;
            case 2:
                {
                    switch (row){
                        case 0:
                        {
                            cell.textLabel.text=@"联系方式";
                        }
                            break;
                        case 1:
                        {
                            
                            cell.textLabel.text=@"门站网站:www.huxun.cc";
                            
                        }
                            break;
                        case 2:
                        {
                            cell.textLabel.text=@"客服电话:0663-8782222";
                        }
                            break;
                        default:
                            break;
                            
                    }
                }
                
            }
                break;
            default:
                break;
                
        }
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [[UIColor alloc]initWithRed:1.0 green:1.0 blue:1.0 alpha:1];
    return cell;
}

#pragma mark 返回各个cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch ([indexPath section]) {
        case 0:
        {
            switch ([indexPath row]) {
                case 0:
                {
                    NSLog(@"点击本地通知");
                    UILocalNotification *notification=[[UILocalNotification alloc]init];
                    //1s后通知
                    notification.fireDate=[NSDate dateWithTimeIntervalSinceNow:1];
                    notification.alertBody=@"This is 华讯星园";
                    notification.alertAction = @"打开";  //提示框按钮
                    notification.timeZone=[NSTimeZone defaultTimeZone];
                    notification.soundName=UILocalNotificationDefaultSoundName;
                    notification.applicationIconBadgeNumber=1;//应用的红色数字
                    notification.repeatInterval=0;//循环次数
                    [[UIApplication sharedApplication]scheduleLocalNotification:notification];
                    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
                    NSLog(@"本地通知标识 bundleIdentifier is %@",bundleIdentifier);
                    NSDictionary *infoDic = [NSDictionary dictionaryWithObject:bundleIdentifier forKey:@"localIdentifier"];
                    
                    notification.userInfo = infoDic;
                }
                    break;
                    
                case 1:
                {
                    
                }
                    break;
                default:
                    break;
            }
        }
            
            break;
        case 1:
        {
            switch ([indexPath row]) {
                case 0:
                {
                    
                }
                    break;
                case 1:
                {
                    
                }
                    break;
                case 2:
                {
                    YiJianFangKuiViewController *yiJianFangKuiViewController=[[YiJianFangKuiViewController alloc]init];
                    [self.navigationController pushViewController:yiJianFangKuiViewController animated:YES];
                }
                    break;
                default:
                    break;
            }
            
            
        }
            break;
        case 2:
        {
            switch ([indexPath row]) {
                case 0:
                {
                    ContactViewController *contact =[[ContactViewController alloc]init];
                    [self.navigationController pushViewController:contact animated:YES];
                }
                    break;
                case 1:
                    
                    break;
                case 2:
                    
                    break;
                    
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
    
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
