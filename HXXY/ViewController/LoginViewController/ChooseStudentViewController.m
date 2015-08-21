//
//  ChooseStudentViewController.m
//  HXXY
//
//  Created by Apple on 12/16/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "ChooseStudentViewController.h"
#import "myselfAddButton.h"
@interface ChooseStudentViewController ()

@end

@implementation ChooseStudentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"宝宝选择";
    [self initView];
}

-(void)initView{
    _chooseLabel=[[UILabel alloc]initWithFrame:CGRectMake(20,70, 100, 30)];
    _chooseLabel.text=@"请选择宝宝:";
    [self.view addSubview:_chooseLabel];

    _image1=[[UIButton alloc]initWithFrame:CGRectMake(35, _chooseLabel.frame.origin.y+_chooseLabel.frame.size.height+10, 60, 60)];
    [_image1.layer setMasksToBounds:YES];
    [_image1.layer setCornerRadius:30.0];
    [_image1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    _image1.tag=imageTag1;
    
    [self addBabyHeader:_image1 pictureTag:0];
    
    _image2=[[UIButton alloc]initWithFrame:CGRectMake(_image1.frame.origin.x+_image1.frame.size.width+35, 110, 60, 60)];
    [_image2.layer setMasksToBounds:YES];
    [_image2.layer setCornerRadius:30.0];
    [_image2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    _image2.tag=imageTag2;
    
    _image3=[[UIButton alloc]initWithFrame:CGRectMake(_image1.frame.origin.x+_image1.frame.size.width+35, 110, 60, 60)];
    [_image3.layer setMasksToBounds:YES];
    [_image3.layer setCornerRadius:30.0];
    [_image3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    _image3.tag=imageTag3;
    
    _imageButton=[[myselfAddButton alloc]initWithFrame:CGRectMake(_image1.frame.origin.x+_image1.frame.size.width+35, _chooseLabel.frame.origin.y+_chooseLabel.frame.size.height+10, 60, 60)];
    
    _imageButton.tag=imageButtonTag;
    [self.view addSubview:_imageButton];
    _babyImageIndexTag=[globeResource sharedInstance].babyImageIndex;
    
    UILabel *isAutoLoginLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 200, 80, 30)];
    [self.view addSubview:isAutoLoginLabel];
    isAutoLoginLabel.text=@"自动登录:";
    UISwitch *isAutoLoginSwitch=[[UISwitch alloc] initWithFrame:CGRectMake(isAutoLoginLabel.frame.origin.x+isAutoLoginLabel.frame.size.width+10, 200, 60,30)];
    isAutoLoginSwitch.onTintColor=SystemThemeColor;
    isAutoLoginSwitch.tintColor=SystemThemeColor;
    [isAutoLoginSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:isAutoLoginSwitch];
    
    UIButton * loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginButton.frame =CGRectMake((self.view.frame.size.width-60)/2, 250, 60, 30);
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setBackgroundColor:SystemThemeColor];
    [loginButton.layer setMasksToBounds:YES];
    [loginButton.layer setCornerRadius:10.0];
    loginButton.tag=loginButtonTag;
    [loginButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
  
    BOOL isAddbabyButton=[[NSUserDefaults standardUserDefaults] boolForKey:@"key_isAddbabyButton"];
    if (isAddbabyButton) {
        [self addBabyHeader:_image2 pictureTag:2];
        _imageButton.frame=CGRectMake(_image1.frame.origin.x+_image1.frame.size.width+35*2+60*1, 110, 60, 60);
    }
    
    BOOL isAddbaby=[[NSUserDefaults standardUserDefaults] boolForKey:@"key_isAddbaby"];
    if (isAddbaby) {
        [_image2 removeFromSuperview];
        [self addBabyHeader:_image3 pictureTag:1];
        _imageButton.frame=CGRectMake(_image1.frame.origin.x+_image1.frame.size.width+35*2+60*1, 110, 60, 60);
    }
    
}

-(void) addBabyHeader:(UIButton *)button pictureTag:(NSInteger)num {
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:[NSString stringWithFormat:@"%d.png",num]];
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    if(savedImage!=nil){
        [button setImage:savedImage forState:UIControlStateNormal];
    }
    else{
        [button setImage:[UIImage imageNamed:@"default_img.jpg"] forState:UIControlStateNormal];
    }
    [self.view addSubview:button];
}


#pragma mark - 登录事件
-(void)buttonAction:(UIButton *)button{
    
    switch (button.tag){
        case imageTag1:{
            [self whenClickHeadImage];
            _babyImageIndexTag=imageTag1;
            [_imageButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
        }
            break;
        case imageTag2:{
            [self whenClickHeadImage];
            _babyImageIndexTag=imageTag2;
            _imageButton.enabled=NO;
        }
            break;
        case imageButtonTag:{
            [self whenClickHeadImage];
            _babyImageIndexTag=imageButtonTag;
            _imageButton.enabled=YES;
        }
            break;
       
        case loginButtonTag:{
            BOOL isChoosed=[[NSUserDefaults standardUserDefaults] boolForKey:@"key_isChoosed"];
            if (isChoosed) {
                [self.delegate ChooseStudentViewController:self];
            }else{
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:@"请先选择宝宝" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alert show];
            }
       }
             break;
        default:
            break;
    }
    
}

#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
   
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self saveImage:image withName:[NSString stringWithFormat:@"%d.png",_babyImageIndexTag]];
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:[NSString stringWithFormat:@"%d.png",_babyImageIndexTag]];
    _savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    [self babyImage:_babyImageIndexTag];
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

- (void)babyImage:(NSInteger)num{
    switch (num) {
        case imageTag1:
            
            [_image1 setImage:_savedImage forState:UIControlStateNormal];
            
            break;
        case imageTag2:
        {
             [_image3 setImage:_savedImage forState:UIControlStateNormal];
             [self userDefault];
        }
            break;
        case imageButtonTag:{
            [self.view addSubview:_image2];
            [_image2 setImage:_savedImage forState:UIControlStateNormal];
            _imageButton.frame=CGRectMake(_image1.frame.origin.x+_image1.frame.size.width+35*2+60*1, 110, 60, 60);
            [self userDefaultButton];
        }
             break;
        default:
            break;
    }
}

-(void)userDefault{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"key_isAddbaby"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(void)userDefaultButton{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"key_isAddbabyButton"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
#pragma mark - 自动登录
-(void)switchAction:(UISwitch *)ActionSwitch{
    BOOL isButtonOn=[ActionSwitch isOn];
    if (isButtonOn) {
        NSLog(@"设置自动登录");
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"key_isAutoSwitch"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }else{
        NSLog(@"取消自动登录");
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"key_isAutoSwitch"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

#pragma mark - 点击头像
-(void)whenClickHeadImage{
    
    UIActionSheet *sheet;
    sheet = [[UIActionSheet alloc] initWithTitle:@"宝宝头像选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"从相册选择" otherButtonTitles:@"从相机中选择", nil];
    sheet.tag = 255;
    sheet.actionSheetStyle = UIBarStyleBlackOpaque;
    [sheet showInView:self.view];
}

#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    //读取图片数据，设置压缩系数为0.5.
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    // 将图片写入文件
    NSLog(@"图片保存path:%@",fullPath);
    [imageData writeToFile:fullPath atomically:NO];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"key_isChoosed"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

#pragma mark - actionsheet delegate
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 255) {
        NSUInteger sourceType = 0;
        switch (buttonIndex) {
            case 0:
                // 相册  或者 UIImagePickerControllerSourceTypePhotoLibrary
                sourceType =  UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                NSLog(@"选择相册图片");
                break;
                //相机
            case 1:
            {
                sourceType = UIImagePickerControllerSourceTypeCamera;
                if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:@"Test on real device, camera is not available in simulator" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                    [alert show];
                    return;
                }
            }
                break;
            case 2:
                NSLog(@"取消");
                // 取消
                return;
        }
        // 跳转到相机或相册页面
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate =self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = sourceType;
        [self presentViewController:imagePickerController animated:YES completion:^{}];
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
