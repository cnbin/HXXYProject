//
//  FaXianViewController.m
//  HXXY
//
//  Created by Apple on 12/13/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "FaXianViewController.h"

@interface FaXianViewController (){
    
    UIButton * scrollImage1;
    UIButton * scrollImage2;
    UIButton * scrollImage3;
    UIButton * scrollImage4;
    UIButton * scrollImage5;
    UIButton * scrollImage6;
    UIButton * scrollImage7;
    UIButton * scrollImage8;
    
    UILabel *scrollLabel1;
    UILabel *scrollLabel2;
    UILabel *scrollLabel3;
    UILabel *scrollLabel4;
    UILabel *scrollLabel5;
    UILabel *scrollLabel6;
    UILabel *scrollLabel7;
    UILabel *scrollLabel8;
    
    UIButton * gameImage1;
    UIButton * gameImage2;
    UIButton * gameImage3;
    UIButton * gameImage4;
    
    UILabel *gameLabel1;
    UILabel *gameLabel2;
    UILabel *gameLabel3;
    UILabel *gameLabel4;
}

@end

@implementation FaXianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title=@"发现";
    self.navigationItem.leftBarButtonItem=nil;
}

#pragma mark 返回分组个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

#pragma mark 返回对应分组的cell个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 2;
            break;
        case 3:
            return 1;
            break;
        case 4:
            return 2;
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
    
    _faxianImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 7, 16, 16)];
    
    _labelText=[[UILabel alloc]initWithFrame:CGRectMake(33, 4, 180, 22)];
    _labelText.font=[UIFont fontWithName:@"Helvetica" size:16];
    
    UITableViewCell *cell;
    cell =[tableView dequeueReusableCellWithIdentifier:FristCellIdentifier];
    if (cell == nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FristCellIdentifier];
        switch (section) {
            case 0:
            {
                _labelText.text=@"扫一扫";
                _faxianImageView.image=[UIImage imageNamed:@"0"];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
            }
                break;
            case 1:
            {
                _labelText.text=@"吧啦,好玩的事";
                _faxianImageView.image=[UIImage imageNamed:@"1"];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
                break;
            case 2:
            {
                switch (row){
                    case 0:
                    {
                        _labelText.text=@"生活";
                        _faxianImageView.image=[UIImage imageNamed:@"2"];
                        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    }
                        break;
                    case 1:
                    {
                        [self gameView];
                        [cell.contentView addSubview:gameImage1];
                        [cell.contentView addSubview:gameImage2];
                        [cell.contentView addSubview:gameImage3];
                        [cell.contentView addSubview:gameImage4];
                        [cell.contentView addSubview:gameLabel1];
                        [cell.contentView addSubview:gameLabel2];
                        [cell.contentView addSubview:gameLabel3];
                        [cell.contentView addSubview:gameLabel4];
                        
                    }
                        break;
                    default:
                        break;
                }
                
                
            }
                break;
            case 3:
            {
                _labelText.text=@"游戏中心";
                _faxianImageView.image=[UIImage imageNamed:@"3"];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
                break;
            case 4:
            {
                switch (row){
                    case 0:
                    {
                        _labelText.text=@"应用中心";
                        _faxianImageView.image=[UIImage imageNamed:@"4"];
                        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                        
                    }
                        break;
                    case 1:
                    {
                         _CellscrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 70)];
                        
                        float width = _CellscrollView.bounds.size.width;
                        float height = _CellscrollView.bounds.size.height;

                        _CellscrollView.delegate = self;
                        _CellscrollView.pagingEnabled = YES;
                        [_CellscrollView setShowsHorizontalScrollIndicator:NO];
                        _CellscrollView.contentSize = CGSizeMake(width * 2, height);
                        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((320-60)/2,70-10, 60, 10)];
                        
                        _pageControl.numberOfPages = 2;
                        _pageControl.currentPageIndicatorTintColor = SystemThemeColor;
                        _pageControl.pageIndicatorTintColor =[UIColor colorWithRed:222.0f/255.0f green:222.0f/192.0f blue:222.0f/255.0f alpha:1.0f];
                        
                        [self loadContentsPage];
                        
                        [cell.contentView addSubview:_pageControl];
                        [cell.contentView addSubview:_CellscrollView];
                    }
                        break;
                    default:
                        break;
                }
                
            }
                break;
            default:
                break;
        }
    }
    [cell.contentView addSubview:_labelText];
    [cell.contentView addSubview:_faxianImageView];
    
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [[UIColor alloc]initWithRed:1.0 green:1.0 blue:1.0 alpha:1];
    
    return cell;
}

-(void)gameView{
    
    gameImage1=[[UIButton alloc]initWithFrame:CGRectMake(20,5, 40, 40)];
    [gameImage1 setImage:[UIImage imageNamed:@"8.png"] forState:UIControlStateNormal];
    gameLabel1=[[UILabel alloc]initWithFrame:CGRectMake(20, 50, 50, 10)];
    gameLabel1.font=[UIFont fontWithName:@"Helvetica" size:10];
    gameLabel1.text=@"餐饮美食";
    
    gameImage2=[[UIButton alloc]initWithFrame:CGRectMake(20+80, 5, 40, 40)];
    [gameImage2 setImage:[UIImage imageNamed:@"9.png"] forState:UIControlStateNormal];
    gameLabel2=[[UILabel alloc]initWithFrame:CGRectMake(20+80+10, 50, 30, 10)];
    gameLabel2.font=[UIFont fontWithName:@"Helvetica" size:10];
    gameLabel2.text=@"电影";
    
    gameImage3=[[UIButton alloc]initWithFrame:CGRectMake(20+160,5, 40, 40)];
    [gameImage3 setImage:[UIImage imageNamed:@"10.png"] forState:UIControlStateNormal];
    gameLabel3=[[UILabel alloc]initWithFrame:CGRectMake(20+160+10, 50, 30, 10)];
    gameLabel3.font=[UIFont fontWithName:@"Helvetica" size:10];
    gameLabel3.text=@"KTV";
    
     gameImage4=[[UIButton alloc]initWithFrame:CGRectMake(20+240,5, 40, 40)];
    [gameImage4 setImage:[UIImage imageNamed:@"7.png"] forState:UIControlStateNormal];
    gameLabel4=[[UILabel alloc]initWithFrame:CGRectMake(240+20, 50, 50, 10)];
    gameLabel4.font=[UIFont fontWithName:@"Helvetica" size:10];
    gameLabel4.text=@"生活服务";
}

- (void)loadContentsPage{
    
    scrollImage1=[[UIButton alloc]initWithFrame:CGRectMake(20,5, 40, 40)];
    [scrollImage1 setImage:[UIImage imageNamed:@"11.png"] forState:UIControlStateNormal];
    scrollLabel1=[[UILabel alloc]initWithFrame:CGRectMake(30, 50, 30, 10)];
    scrollLabel1.font=[UIFont fontWithName:@"Helvetica" size:10];
    scrollLabel1.text=@"闲鱼";
    
    scrollImage2=[[UIButton alloc]initWithFrame:CGRectMake(20+80, 5, 40, 40)];
    [scrollImage2 setImage:[UIImage imageNamed:@"12.png"] forState:UIControlStateNormal];
    scrollLabel2=[[UILabel alloc]initWithFrame:CGRectMake(20+80+10, 50, 30, 10)];
    scrollLabel2.font=[UIFont fontWithName:@"Helvetica" size:10];
    scrollLabel2.text=@"美食";

    scrollImage3=[[UIButton alloc]initWithFrame:CGRectMake(20+160,5, 40, 40)];
    [scrollImage3 setImage:[UIImage imageNamed:@"13.png"] forState:UIControlStateNormal];
    scrollLabel3=[[UILabel alloc]initWithFrame:CGRectMake(20+160+10, 50, 30, 10)];
    scrollLabel3.font=[UIFont fontWithName:@"Helvetica" size:10];
    scrollLabel3.text=@"一淘";

    scrollImage4=[[UIButton alloc]initWithFrame:CGRectMake(20+240,5, 40, 40)];
    [scrollImage4 setImage:[UIImage imageNamed:@"14.png"] forState:UIControlStateNormal];
    scrollLabel4=[[UILabel alloc]initWithFrame:CGRectMake(20+240+10, 50, 30, 10)];
    scrollLabel4.font=[UIFont fontWithName:@"Helvetica" size:10];
    scrollLabel4.text=@"流量";

    scrollImage5=[[UIButton alloc]initWithFrame:CGRectMake(20+320,5, 40, 40)];
    [scrollImage5 setImage:[UIImage imageNamed:@"15.png"] forState:UIControlStateNormal];
    scrollLabel5=[[UILabel alloc]initWithFrame:CGRectMake(20+320+10, 50, 30, 10)];
    scrollLabel5.font=[UIFont fontWithName:@"Helvetica" size:10];
    scrollLabel5.text=@"天猫";

    scrollImage6=[[UIButton alloc]initWithFrame:CGRectMake(20+400,5, 40, 40)];
    [scrollImage6 setImage:[UIImage imageNamed:@"16.png"] forState:UIControlStateNormal];
    scrollLabel6=[[UILabel alloc]initWithFrame:CGRectMake(20+400+10, 50, 30, 10)];
    scrollLabel6.font=[UIFont fontWithName:@"Helvetica" size:10];
    scrollLabel6.text=@"唱歌";

    scrollImage7=[[UIButton alloc]initWithFrame:CGRectMake(20+480,5, 40, 40)];
    [scrollImage7 setImage:[UIImage imageNamed:@"17.png"] forState:UIControlStateNormal];
    scrollLabel7=[[UILabel alloc]initWithFrame:CGRectMake(20+480+10, 50, 30, 10)];
    scrollLabel7.font=[UIFont fontWithName:@"Helvetica" size:10];
    scrollLabel7.text=@"跳舞";

    scrollImage8=[[UIButton alloc]initWithFrame:CGRectMake(20+560,5, 40, 40)];
    [scrollImage8 setImage:[UIImage imageNamed:@"18.png"] forState:UIControlStateNormal];
    scrollLabel8=[[UILabel alloc]initWithFrame:CGRectMake(20+560+10, 50, 30, 10)];
    scrollLabel8.font=[UIFont fontWithName:@"Helvetica" size:10];
    scrollLabel8.text=@"打的";

    [_CellscrollView addSubview:scrollImage1];
    [_CellscrollView addSubview:scrollImage2];
    [_CellscrollView addSubview:scrollImage3];
    [_CellscrollView addSubview:scrollImage4];
    [_CellscrollView addSubview:scrollImage5];
    [_CellscrollView addSubview:scrollImage6];
    [_CellscrollView addSubview:scrollImage7];
    [_CellscrollView addSubview:scrollImage8];
    
    [_CellscrollView addSubview:scrollLabel1];
    [_CellscrollView addSubview:scrollLabel2];
    [_CellscrollView addSubview:scrollLabel3];
    [_CellscrollView addSubview:scrollLabel4];
    [_CellscrollView addSubview:scrollLabel5];
    [_CellscrollView addSubview:scrollLabel6];
    [_CellscrollView addSubview:scrollLabel7];
    [_CellscrollView addSubview:scrollLabel8];
}

#pragma mark scrollView delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    float width = scrollView.frame.size.width;
    float offsetX = scrollView.contentOffset.x;
    int pageNo = floor(offsetX/width);
    _pageControl.currentPage = pageNo;

}

#pragma mark 返回各个cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    switch (section) {
        case 0:
            return 30;
            break;
        case 1 :
            return 30;
            break;
        case 2 :{
            switch (row) {
                case 0:
                    return 30;
                    break;
                case 1:
                    return 65;
                    break;
                default:
                    break;
            }
        }
            break;
        case 3 :
            return 30;
            break;
        case 4:{
            switch (row) {
                case 0:
                    return 30;
                    break;
                case 1:
                    return 70;
                    break;
                default:
                    break;
            }
        }
        break; 
        default:
            break;
    }
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
                }
                    break;
                default:
                    break;
            }
            
            
        }
            break;
        case 2:
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
