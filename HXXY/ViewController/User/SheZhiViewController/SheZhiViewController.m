//
//  SheZhiViewController.m
//  HXXY
//
//  Created by Apple on 1/14/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "SheZhiViewController.h"

@interface SheZhiViewController ()

@end

@implementation SheZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"设置中心";
}

#pragma mark 返回分组个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

#pragma mark 返回对应分组的cell个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 4;
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
    
    static NSString *CellIdentifier = @"Cell";
   
    UITableViewCell *cell;
    cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        _isSwich=[[UISwitch alloc]initWithFrame:CGRectMake(260, 5, 30, 20)];
        _isSwich.tintColor=SystemThemeColor;
        _isSwich.onTintColor=SystemThemeColor;
        switch (section) {
            case 0:
            {
                _SDcardLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 7.5, 150, 25)];
                _SDcardLabel.text=@"下载保存到SD卡";
                [cell.contentView addSubview:_SDcardLabel];
            }
                break;
            case 1:
            {
                switch (row){
                    case 0:
                    {
                        _resetTimeLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 7.5, 150, 25)];
                        _resetTimeLabel.text=@"休息时间设置";
                        [cell.contentView addSubview:_resetTimeLabel];
                    }
                
                        break;
                    case 1:
                    {
                        _CacheDeleteLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 7.5, 150, 25)];
                        _CacheDeleteLabel.text=@"清除缓存";
                        [cell.contentView addSubview:_CacheDeleteLabel];

                    }
                        
                        break;
                    default:
                        break;
               }
               
            }
                  break;
            case 2:
                switch (row) {
                    case 0:
                    {
                        _yaoyiyaoLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 7.5, 150, 25)];
                        _yaoyiyaoLabel.text=@"开启摇一摇震动";
                        [cell.contentView addSubview:_yaoyiyaoLabel];
                    }
                        break;
                    case 1:
                    {
                        _donghuaxiaoguoLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 7.5, 150, 25)];
                        _donghuaxiaoguoLabel.text=@"动画效果";
                        [cell.contentView addSubview:_donghuaxiaoguoLabel];
                    }
                        break;
                    case 2:
                    {
                        _xuanranyinqingLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 7.5, 150, 25)];
                        _xuanranyinqingLabel.text=@"渲染加速引擎";
                        [cell.contentView addSubview: _xuanranyinqingLabel];
                    }
                        
                        break;
                    case 3:
                    {
                        _yingyongmoshiLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 7.5, 150, 25)];
                        _yingyongmoshiLabel.text=@"应用模式";
                        [cell.contentView addSubview:_yingyongmoshiLabel];

                    }
                        
                        break;
                        
                    default:
                        break;
                }
                
            default:
                break;
        }
        
    }
    [cell.contentView addSubview:_isSwich];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
