//
//  MessageViewController.m
//  HXXY
//
//  Created by Apple on 1/14/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//
#import "TablelistViewController.h"
#import "BaoBaoZaiXianViewController.h"

#import "LoginViewController.h"
#import "CommonWebViewController.h"
#import "BadgeView.h"
#import "BadegLabel.h"
#import "MessageViewController.h"

#define cellHeight 42

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"消息";
    [self initView];
    
}

-(void)initView{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _scrollView.contentSize = CGSizeMake(320,520);
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height)];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled=YES;
    [_tableView setSeparatorColor:[UIColor grayColor]];//设置分割线颜色
    [_scrollView  addSubview:_tableView];
    [self.view addSubview:_scrollView];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ImageViewPropertyList" ofType:@"plist"];
    _data = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    //删除plist文件。让重启动不保存点击数字状态
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    for (int i=0; i<=10; i++) {
        [userDefaults removeObjectForKey:[NSString stringWithFormat:@"%d",i]];
        [userDefaults synchronize];
    }
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    NSLog(@"docDir is %@",docDir);
    
    _labelTextArray=@[@"刘佳老师",@"张丽园长",@"每日食谱",@"入园离园",@"家园联系册",@"每周活动",@"王慧",@"放假通知",@"作业通知",@"软件更新",@"新年祝福"];
    _labelTimeTextArray=@[@"[2分钟前]",@"[5分钟前]",@"[1小时前]",@"[26分钟前]",@"[2分钟前]",@"[50分钟前]",@"[1分钟前]",@"[45分钟前]",@"[25分钟前]",@"[20分钟前]",@"[7分钟前]"];
    _detailLabelTextArray=@[@"[语音]",@"各位家长好!",@"新年快乐!Happy NewYear!",@"妈妈必备知识",@"[语音]",@"再见",@"元旦放假通知",@"各位家长好!",@"新年快乐!",@"豆豆家长，豆豆已于1月5号下午16:00离园",@"各位家长好!新年快乐!Happy NewYear!"];
    _badgeLabelArray=@[@"3",@"5",@"1",@"5",@"8",@"6",@"2",@"11",@"4",@"2",@"12"];
    
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
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 2, 36, 36)];
        _imageView.layer.cornerRadius = 18;
        _imageView.layer.masksToBounds = YES;
        
        [globeResource sharedInstance].shareViewTag=[NSString stringWithFormat:@"%d",row];//该句要放在初始化_BadgeView前面
        
        _badgeView=[[BadgeView alloc] initWithFrame:CGRectMake(38, 2, 10, 10)];
        _badgeView.layer.cornerRadius=5;
        _badgeView.backgroundColor=[UIColor colorWithRed:255/255.0 green:69/255.0 blue:0 alpha:1.0];
        
        _badgeLabel=[[BadegLabel alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
        _badgeLabel.font=[UIFont fontWithName:@"Helvetica" size:5];
        _badgeLabel.textAlignment=NSTextAlignmentCenter;
        _badgeLabel.textColor=[UIColor whiteColor];
        
        _labelText=[[UILabel alloc]initWithFrame:CGRectMake(60, 3, 180, 24)];
        _labelText.font=[UIFont fontWithName:@"Helvetica" size:12];
        _labelText.text =[_labelTextArray objectAtIndex:row];
        
        _labelTimeText=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width-40, 6, 40, 30)];
        _labelTimeText.textColor=[UIColor grayColor];
        _labelTimeText.font=[UIFont boldSystemFontOfSize:7];
        
        _detailLabelText=[[UILabel alloc]initWithFrame:CGRectMake(60, 23, 200, 15)];
        _detailLabelText.textColor=[UIColor grayColor];
        _detailLabelText.font=[UIFont boldSystemFontOfSize:7];
        
        _labelTimeText.text=[_labelTimeTextArray objectAtIndex:row];
        _detailLabelText.text=[_detailLabelTextArray objectAtIndex:row];
        _badgeLabel.text=[_badgeLabelArray objectAtIndex:row];
        
        [globeResource sharedInstance].sum+=[_badgeLabel.text intValue];
        
//        [_imageView setImageWithURL:[NSURL URLWithString:[[_data objectAtIndex:row]objectForKey:@"ImageURL"]] placeholderImage:[UIImage imageNamed:[[_data objectAtIndex:row]objectForKey:@"placeholderImageURL"]]];
        _imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d.pnd",row]];
 
        [_badgeView addSubview:_badgeLabel];
        
        [cell.contentView addSubview:_labelText];
        [cell.contentView addSubview:_imageView];
        [cell.contentView addSubview:_labelTimeText];
        [cell.contentView addSubview:_detailLabelText];
        [cell.contentView addSubview:_badgeView];
        
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = [[UIColor alloc]initWithRed:1.0 green:1.0 blue:1.0 alpha:1];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"badge" object:nil ];
        
    }
    [self.tableDelegate caculateCellBadegCount];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    
    if (row%2==0) {
    }else{
        cell.backgroundColor=[UIColor colorWithRed:176/255.0 green:224/255.0 blue:230/255.0 alpha:1.0];
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSNotificationCenter defaultCenter] postNotificationName:selectedCellIndex object:nil ];
    
    _isSubstract=[[globeResource sharedInstance]boolForKey:[NSString stringWithFormat:@"%d",indexPath.row]];
    if (!_isSubstract) {
        [self.tableDelegate caculateCellBadegCount];
    }
    [[globeResource sharedInstance] setBool:YES forKey:[NSString stringWithFormat:@"%d",indexPath.row]];
    
    switch ([indexPath row]) {
        case 0:
        {
          
        }
            break;
        case 3:
        {
            
        }
            break;
        case 6:
        {
        }
            break;
        case 8:
        {
            
        }
            break;
        default:
            break;
    }
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
