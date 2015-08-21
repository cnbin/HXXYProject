//
//  SaveLoginViewController.h
//  HXXY
//
//  Created by Apple on 12/13/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "HXBaseViewController.h"


@class SaveLoginViewController;
@protocol SaveLoginViewControllerDelegate <NSObject>

-(void)SaveLoginViewController:(SaveLoginViewController *)passController;

@end

@interface SaveLoginViewController : HXBaseViewController<NSXMLParserDelegate>
{
    UITextField  * saveLoginText;
}

@property (nonatomic,weak) id< SaveLoginViewControllerDelegate> delegate;


// 当前标签的名字 ,currentTagName 用于存储正在解析的元素名
@property (strong ,nonatomic) NSString * currentTagName;

@property (strong,nonatomic) NSMutableDictionary * dict;

@end
