//
//  TablelistViewController.m
//  HXXY
//
//  Created by Apple on 11/17/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "TablelistViewController.h"
#import "BaoBaoZaiXianViewController.h"

#import "LoginViewController.h"
#import "CommonWebViewController.h"
#import "BadgeView.h"
#import "BadegLabel.h"
#import "YingYongTuiJianViewController.h"
#import "PingAnXiaoYuanViewController.h"
#import "HomeworkViewController.h"
#import "HuoDongTouPiaoViewController.h"
#import "YiJianFangKuiViewController.h"

#define cellHeight 42

@interface TablelistViewController ()

@end

@implementation TablelistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"功能";
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
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 8, 26, 26)];
        _imageView.layer.cornerRadius = 13;
        _imageView.layer.masksToBounds = YES;
        
        _labelText=[[UILabel alloc]initWithFrame:CGRectMake(45, 4, 180, 34)];
        _labelText.font=[UIFont fontWithName:@"Helvetica" size:16];
        _labelText.text =[[_data objectAtIndex:row]objectForKey:@"labelTitle"];
    
        _imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d.pnd",row]];
        
        [cell.contentView addSubview:_labelText];
        [cell.contentView addSubview:_imageView];
        
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = [[UIColor alloc]initWithRed:1.0 green:1.0 blue:1.0 alpha:1];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch ([indexPath row]) {
        case 0:
        {
            [self performSelectorInBackground:@selector(presentViewController) withObject:self];
            [self setValue:@"校务互动" forKey:@"kvcTitle"];
            [self setValue:@"http://192.168.20.5/qzfz/" forKey:@"kvcUrl"];
        }
            break;
        case 3:
        {
            BaoBaoZaiXianViewController * baoBaoZaiXianViewController=[[BaoBaoZaiXianViewController alloc]init];
            [self.navigationController pushViewController:baoBaoZaiXianViewController animated:YES];
        }
            break;
        case 4:
        {
//            PingAnXiaoYuanViewController * pingAnXiaoYuanViewController=[[PingAnXiaoYuanViewController alloc]init];
//            [self.navigationController pushViewController:pingAnXiaoYuanViewController animated:YES];
             PingAnXiaoYuanViewController *   pingAnXiaoYuanViewController=[[ PingAnXiaoYuanViewController alloc]init];
            [self presentViewController:[[UINavigationController alloc] initWithRootViewController: pingAnXiaoYuanViewController] animated:YES completion:nil];
            
        }
            break;
        case 5:
        {
            HomeworkViewController *  homework=[[HomeworkViewController alloc]init];
            [self.navigationController pushViewController:homework animated:YES];
        }
            break;
        case 6:
        {
//            MasterViewController *  masterViewController=[[MasterViewController alloc]init];
//            [self.navigationController pushViewController:masterViewController animated:YES];
        }
            break;
            
        case 7:
        {
           YiJianFangKuiViewController *  yiJianFangKuiViewController=[[YiJianFangKuiViewController alloc]init];
            [self.navigationController pushViewController:yiJianFangKuiViewController animated:YES];

        }
            break;
        
        case 8:
        {
            YingYongTuiJianViewController *  yingYongTuiJianViewController=[[YingYongTuiJianViewController alloc]init];
             [self presentViewController:[[UINavigationController alloc] initWithRootViewController: yingYongTuiJianViewController] animated:YES completion:nil];
        }
           break;
            
        case 9:
        {
            HuoDongTouPiaoViewController *  huoDongTouPiaoViewController=[[HuoDongTouPiaoViewController alloc]init];
             [self.navigationController pushViewController: huoDongTouPiaoViewController animated:YES];
        }
            break;
    }
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(NSString *)viewTitle{
    
    return [self valueForKey:@"kvcTitle"];
}

-(NSString *)viewUrl{
    
    return [self valueForKey:@"kvcUrl"];
}

-(void)presentViewController{
    
    CommonWebViewController * commonWebViewController=[[CommonWebViewController alloc]init];
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:commonWebViewController] animated:YES completion:nil];
    commonWebViewController.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
