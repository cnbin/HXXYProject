//
//  JingCaiXunJianViewController.m
//  HXXY
//
//  Created by Apple on 12/13/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "JingCaiShunJianViewController.h"
#import "UIImageView+WebCache.h"
@interface JingCaiShunJianViewController ()

@end

@implementation JingCaiShunJianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"精彩瞬间";
    [self initView];
   
}

-(void)initView{
    identifier = @"cell";
    // 初始化layout
    UICollectionViewFlowLayout * flowLayout =[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView * collectionView =[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    //注册单元格
    [collectionView registerClass:[UICollectionViewCell class]forCellWithReuseIdentifier:identifier];
    //设置代理
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
}

#pragma mark - collectionView delegate
//设置分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//设置元素的的大小框
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets top = {30,15,30,15};
    return top;
}

//每个分区上得元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 32;
}

//设置元素内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell sizeToFit];
    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 140, 130)];
    //    NSString *imageToLoad = [NSString stringWithFormat:@"%d_full.JPG", indexPath.row];
    //    _imageView.image=[UIImage imageNamed:imageToLoad];
    
    [_imageView setImageWithURL:[NSURL URLWithString:@"http://img.baidu.com/img/image/3bf33a87e950352a5947ae485143fbf2b2.jpg"] placeholderImage:nil];
    
    for (UIView*view in cell.contentView.subviews) {
        if (view) {
            [view removeFromSuperview];
        }
    }
    
    _label=[[UILabel alloc]initWithFrame:CGRectMake(0,140,140,30)];
    _label.textColor=[UIColor whiteColor];
    _label.text=[NSString stringWithFormat:@"{%d,%d}", indexPath.row, indexPath.section];
    _label.textAlignment=NSTextAlignmentCenter;
    [cell.contentView addSubview:_label];
    [cell.contentView addSubview:_imageView];
    return cell;
}

//设置单元格宽度
//设置元素大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(140,160);
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view makeToast:[NSString stringWithFormat:@"点击的是{%d,%d}", indexPath.row, indexPath.section] duration:1.0 position:@"center"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
