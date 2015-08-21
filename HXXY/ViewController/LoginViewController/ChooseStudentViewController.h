//
//  ChooseStudentViewController.h
//  HXXY
//
//  Created by Apple on 12/16/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "HXBaseViewController.h"

@class  ChooseStudentViewController;
@protocol ChooseStudentViewControllerDelegate  <NSObject>

-(void)ChooseStudentViewController:(ChooseStudentViewController *)passController ;

@end

@interface ChooseStudentViewController : HXBaseViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
{
    UILabel  *  _chooseLabel;
}

typedef enum:NSUInteger{
    imageTag1=0,
    imageTag2,
    imageButtonTag,
    loginButtonTag,
    imageTag3
}Tag;

@property (nonatomic,weak)id<ChooseStudentViewControllerDelegate> delegate;
@property (nonatomic,strong) UIButton * imageButton;
@property (nonatomic,strong) UIButton * image1;
@property (nonatomic,strong) UIButton * image2;
@property (nonatomic,strong) UIButton * image3;
@property (nonatomic,strong) UIImage *savedImage;

@property (nonatomic,assign) NSInteger babyImageIndexTag;
@end
