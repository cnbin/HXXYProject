//
//  ViewController.m
//  TreeTable
//
//  Created by Apple on 12/9/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "BaoBaoZaiXianViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BaoBaoZaiXianViewController ()

@end

@implementation BaoBaoZaiXianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title=@"宝宝在线";
    
    RADataObject *dayiban = [RADataObject dataObjectWithName:@"大(1)班" children:nil];
    // self.expanded = dayiban;
    
    RADataObject *daban = [RADataObject dataObjectWithName:@"大班"
                                                  children:[NSArray arrayWithObjects:dayiban, nil]];
    
    RADataObject *damenkou = [RADataObject dataObjectWithName:@"大门口" children:nil];
    RADataObject *shitang = [RADataObject dataObjectWithName:@"食堂" children:nil];
    
    RADataObject *qishanyoueryuan = [RADataObject dataObjectWithName:@"岐山幼儿园"
                                                            children:[NSArray arrayWithObjects:damenkou, shitang, daban, nil]];
    
    
    RADataObject *youerxiaoban= [RADataObject dataObjectWithName:@"幼儿小班"children:nil];
    RADataObject *damenkou2 = [RADataObject dataObjectWithName:@"大门口" children:nil];
    RADataObject *shitang2 = [RADataObject dataObjectWithName:@"食堂" children:nil];
    
    RADataObject *qishanyoueryuan2 = [RADataObject dataObjectWithName:@"好宝宝幼儿园"
                                                             children:[NSArray arrayWithObjects:damenkou2,youerxiaoban,shitang2, nil]];
    
    self.data = [NSArray arrayWithObjects:qishanyoueryuan,qishanyoueryuan2, nil];
    self.treeView=[[RATreeView alloc]initWithFrame:self.view.frame];
    self.treeView.delegate=self;
    self.treeView.dataSource=self;
    self.treeView.separatorStyle=RATreeViewCellSeparatorStyleSingleLine;
    [self.treeView reloadData];
    [self.treeView setBackgroundColor:UIColorFromRGB(0xF7F7F7)];
    [self.view addSubview:self.treeView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.treeView.frame=CGRectMake(0,0, self.view.frame.size.width,960);

}

#pragma mark TreeView Delegate methods
- (CGFloat)treeView:(RATreeView *)treeView heightForRowForItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    return 40;
}

- (NSInteger)treeView:(RATreeView *)treeView indentationLevelForRowForItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    return 3 * treeNodeInfo.treeDepthLevel;
}

//这个函数决定 是否可以展开，通过设定我们可以设置哪些单元格可以展开到下一层，哪些不可以展开
- (BOOL)treeView:(RATreeView *)treeView shouldExpandItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    return YES;
}

//这个函数：当我们数据重新加载时，我们来决定，展开哪个单元；在项目中我的成员列表刷新后，要重新加载数据，同时要展开我的成员列表
- (BOOL)treeView:(RATreeView *)treeView shouldItemBeExpandedAfterDataReload:(id)item treeDepthLevel:(NSInteger)treeDepthLevel
{
    if ([item isEqual:self.expanded]) {
        return YES;
    }
    return NO;
    
    //    RADataObject *objec = (RADataObject *)item;
    //    if ([objec.name isEqualToString:@"大门口"]) {
    //        return YES;
    //    }
    //    return NO;
}

//在单元格显示之前（或者说将要显示时）我们可以做些设置，这里是设置相应深度的颜色背景
- (void)treeView:(RATreeView *)treeView willDisplayCell:(UITableViewCell *)cell forItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    if (treeNodeInfo.treeDepthLevel == 0) {
//        cell.backgroundColor = UIColorFromRGB(0xF7F7F7);
        cell.backgroundColor =[UIColor colorWithRed:176/255.0 green:224/255.0 blue:230/255.0 alpha:1.0];
    } else if (treeNodeInfo.treeDepthLevel == 1) {
//        cell.backgroundColor = UIColorFromRGB(0x4876FF);
         cell.backgroundColor = cell.backgroundColor=[UIColor colorWithRed:227/255.0 green:207/255.0 blue:87/255.0 alpha:1.0];
    } else if (treeNodeInfo.treeDepthLevel == 2) {
//        cell.backgroundColor = UIColorFromRGB(0x7CFC00);
        cell.backgroundColor =[UIColor colorWithRed:0 green:199/255.0 blue:140/255.0 alpha:1.0];
    }
}

//这里就是我们最熟悉的点击cell处理函数，看代码慢慢体会treeNodeInfo的使用，不想多说了
-(void)treeView:(RATreeView *)treeView didSelectRowForItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    //NSInteger count = treeNodeInfo.parent.children.count;//你点击的该单元的父节点有多少个成员
    NSInteger treeDpthLevelValue = treeNodeInfo.treeDepthLevel;
    NSInteger positionInSiblingsValue = treeNodeInfo.positionInSiblings;
    if (treeDpthLevelValue == 0)
    {
        if (positionInSiblingsValue == 0 ) {
            NSLog(@"first");
        }else if(positionInSiblingsValue == 1){
            NSLog(@"two");
        }else if(positionInSiblingsValue == 2){
            
            
        }else if(positionInSiblingsValue == 3){
            
            
        }else if(positionInSiblingsValue == 4){
            NSLog(@"shezhe");
        }
    }else if (treeDpthLevelValue == 1)
    {
        if (positionInSiblingsValue == 0)
        {
            NSLog(@"one");
        }else if(positionInSiblingsValue == 1) {
            NSLog(@"two");
            
        }else if(positionInSiblingsValue == 2){
            NSLog(@"three");
        }
        
    }
}

#pragma mark TreeView Data Source
- (UITableViewCell *)treeView:(RATreeView *)treeView cellForItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    // NSInteger numberOfChildren = [treeNodeInfo.children count];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    // cell.detailTextLabel.text = [NSString stringWithFormat:@"Number of children %d", numberOfChildren];
    cell.textLabel.text = ((RADataObject *)item).name;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (treeNodeInfo.treeDepthLevel == 0) {
        cell.detailTextLabel.textColor = [UIColor blackColor];
    }
    return cell;
}

//返回每一层包含成员的个数，来制表
- (NSInteger)treeView:(RATreeView *)treeView numberOfChildrenOfItem:(id)item
{
    if (item == nil) {
        return [self.data count];
    }
    RADataObject *data = item;
    return [data.children count];
}

//返回对象
- (id)treeView:(RATreeView *)treeView child:(NSInteger)index ofItem:(id)item
{
    RADataObject *data = item;
    if (item == nil) {
        return [self.data objectAtIndex:index];
    }
    return [data.children objectAtIndex:index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
