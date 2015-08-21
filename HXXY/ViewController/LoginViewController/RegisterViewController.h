//
//  RegisterViewController.h
//  HXXY
//
//  Created by Apple on 12/13/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "HXBaseViewController.h"

@class RegisterViewController;
@protocol RegisterViewControllerDelegate <NSObject>

-(void)RegisterViewController:(RegisterViewController *)passController ;

@end

@interface RegisterViewController : HXBaseViewController
{
    UITextField  * registerpasswordText;
}

@property (nonatomic,weak) id<RegisterViewControllerDelegate> delegate;

@end
