//
//  ShouYeViewController.m
//  HXXY
//
//  Created by Apple on 11/17/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//
#import "Toast+UIView.h"
#import "LoginViewController.h"
#import "AFNetworking.h"
#import "LoginViewController.h"
#import "ForgetPasswordViewController.h"
#import "NSString+URLEncoding.h"
#import "NSNumber+Message.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"登录";
    [self initView];
    _dict =[[NSMutableDictionary alloc]init];
}

-(void)initView{
    
    UIImageView *Headerview=[[UIImageView alloc]initWithFrame:CGRectMake(130, 75, 60, 60)];
    Headerview.image=[UIImage imageNamed:@"10"];
    [self.view addSubview:Headerview];
    
    UILabel *label= [[UILabel alloc]initWithFrame:CGRectMake(100, 140, 160, 30)];
    label.text=@"华讯星园欢迎你!";
    [self.view addSubview:label];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 199/255.0f, 140/255.0f, 1 });
    
    phonenumText=[[UITextField alloc]initWithFrame:CGRectMake(20,180, 280, 30)];
    phonenumText.placeholder=@" 请输入手机号";
    phonenumText.keyboardType = UIKeyboardTypeNumberPad;
    phonenumText.returnKeyType=UIReturnKeyDone;
    phonenumText.clearButtonMode = UITextFieldViewModeWhileEditing;
    [phonenumText.layer setBorderWidth:1.0];
    [phonenumText.layer setCornerRadius:8.0];
    [phonenumText.layer setBorderColor:colorref];
    [self.view addSubview:phonenumText];

    passwordText=[[UITextField alloc]initWithFrame:CGRectMake(20,225,235, 30)];
    passwordText.placeholder=@" 请输入动态密码";
    passwordText.textAlignment =NSTextAlignmentLeft;
    passwordText.returnKeyType=UIReturnKeyDone;
    passwordText.clearButtonMode = UITextFieldViewModeWhileEditing;
    [passwordText.layer setBorderWidth:1.0];
    [passwordText.layer setCornerRadius:8.0];
    [passwordText.layer setBorderColor:colorref];
    [self.view addSubview:passwordText];
    
    UIImageView *codeImage = [[UIImageView alloc] initWithFrame:CGRectMake(260, 225, 40, 30)];
    codeImage.userInteractionEnabled = YES;
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_async(mainQueue, ^(void) {
        [self getVCCode:codeImage];
    });
    
    [codeImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewEvent:)]];
    [self.view addSubview:codeImage];
    
    loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginButton.frame=CGRectMake(20, passwordText.frame.origin.y+40, 280, 30);
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setBackgroundColor:SystemThemeColor];
    [loginButton.layer setBorderWidth:1.0];
    [loginButton.layer setBorderColor:colorref];//边框颜色;

    [loginButton.layer setMasksToBounds:YES];
    [loginButton.layer setCornerRadius:10.0];
    loginButton.tag=1;
    [loginButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    forgetButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    forgetButton.frame=CGRectMake(20, loginButton.frame.size.height+loginButton.frame.origin.y+5, 60, 30);
    [forgetButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
    forgetButton.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:13];;
    [forgetButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [forgetButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    forgetButton.tag=2;
    [self.view addSubview:forgetButton];
}

#pragma mark 点击验证码图片执行的操作
-(void)imageViewEvent:(UITapGestureRecognizer *)gesture{
    [self getVCCode:(UIImageView *)gesture.view];
}

#pragma mark 获取验证码图片
-(void)getVCCode:(UIImageView *)imageView{
    // 获取当前时间
    NSDate *date = [NSDate date];
    AFHTTPRequestOperationManager *operationManage = [AFHTTPRequestOperationManager manager];
    operationManage.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    // 发送请求获取验证码图片
    [operationManage GET:[NSString stringWithFormat:@"http://192.168.20.5/qzf.mn/CreateCheckCode.aspx?%f", [date timeIntervalSince1970]] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // 设置imageview上的图片
        imageView.image = [UIImage imageWithData:operation.responseData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"imgerror-->%@", error.localizedDescription);
    }];
}

#pragma mark 验证验证码是否正确
-(BOOL)checkCode:(NSString *)code{
    NSArray *cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage].cookies;
    //    NSLog(@"cookies-->%@", cookies);
    for (NSHTTPCookie *cookie in cookies) {
        if ([cookie.name isEqualToString:@"CheckCode"]) {
            // 不考虑大小写比较两个字符串是否相同
            if ([cookie.value caseInsensitiveCompare:code] == NSOrderedSame) {
                return YES;
            }
        }
    }
    return NO;
}


-(void)buttonAction:(UIButton *)button{
    
     [self.delegate LoginViewController:self];
    
    switch (button.tag) {
        case 1:
        {
            if (phonenumText.text.length == 0) {
                [self.view makeToast:@"手机号不能为空。" duration:1.0 position:@"center"];
                return;
            }
            
            if (![phonenumText.text isEqual:@"1"]) {
                [self.view makeToast:@"请输入正确手机号。" duration:1.0 position:@"center"];
                return;
                
            }
            
            if (passwordText.text.length == 0) {
                [self.view makeToast:@"动态密码不能为空。" duration:1.0 position:@"center"];
                return;
            }
            
            if (![self checkCode:passwordText.text]) {
                [self.view makeToast:@"动态密码错误，请重新输入！" duration:1.0 position:@"center"];
                return;
            }
            
            [self startRequest];
            
        }
            break;
        case 2:
        {
            NSLog(@"请注册");
            ForgetPasswordViewController * forgetPasswordViewController=[[ForgetPasswordViewController alloc]init];
            [self presentViewController: forgetPasswordViewController animated:YES completion:nil];
        }
            
        default:
            break;
    }
}

/*
 * 开始请求Web Service
 */
-(void)startRequest
{
    
    //post请求
//    NSString *strURL = [[NSString alloc] initWithFormat:@"http://www.rjt0663.com/RjtSchool/WebService/User_Login.asmx/login"];
//    
//    NSURL *url = [NSURL URLWithString:[strURL URLEncodedString]];
//    
//    NSString *post = [NSString stringWithFormat:@"number=%@&psw=%@",phonenumText.text,pswText.text];
//    
//    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding];
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod:@"POST"];
//    [request setHTTPBody:postData];
//    
//    NSURLConnection *connection = [[NSURLConnection alloc]
//                                   initWithRequest:request delegate:self];
//    if (connection) {
//        
//    }
    
    
    //get请求
//    NSString *strURL = [[NSString alloc] initWithFormat:@"http://www.rjt0663.com/RjtSchool/WebService/User_Login.asmx/login?number=%@&psw=%@",phonenumText.text,pswText.text];
//    NSURL *url = [NSURL URLWithString:[strURL URLEncodedString]];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//    if (connection) {
//        
//    }
    

    NSString *strURL = [[NSString alloc] initWithFormat:@"http://192.168.20.5/HXXYWebservice/HXXY.asmx"];
    NSURL *url = [NSURL URLWithString:[strURL URLEncodedString]];
    
    NSString * envelopeText = [NSString stringWithFormat:@"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                               "<soap:Body>"
                               "<GetLogin xmlns=\"http://tempuri.org/\">"
                               "<i>%@</i>"
                               "</GetUserInfo>"
                               "</soap:Body>"
                               "</soap:Envelope>",phonenumText.text];
    
    NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [envelope length]] forHTTPHeaderField:@"Content-Length"];
    
    NSURLConnection *connection = [[NSURLConnection alloc]
                                   initWithRequest:request delegate:self];
    
    
    if (connection) {
        
    }

}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    //     NSLog(@"开始解析文档");
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    //      NSLog(@"结束解析文档");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    //把elementName 赋值给 成员变量 currentTagName
    _currentTagName  = elementName ;
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    string  = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([string isEqualToString:@""]) {
        return;
    }

    if([_currentTagName isEqualToString:@"GetLoginResult"])
    {
        [_dict setObject:string forKey:@"GetLoginResult"];
    }
    
}

#pragma mark- NSURLConnection 回调方法
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    [parser parse];
   }

-(void) connection:(NSURLConnection *)connection didFailWithError: (NSError *)error {
    
    NSLog(@"%@",[error localizedDescription]);
}

- (void) connectionDidFinishLoading: (NSURLConnection*) connection {
    
     NSLog(@"请求完成...");
     NSLog(@"GetUserInfoResult %@",[_dict objectForKey:@"GetLoginResult"]);
    if ([[_dict objectForKey:@"GetLoginResult"]isEqualToString:@"1"]) {

        [self.view makeToast:@"登陆成功" duration:1.0 position:@"center"];
        double delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self.delegate LoginViewController:self];
        });
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

