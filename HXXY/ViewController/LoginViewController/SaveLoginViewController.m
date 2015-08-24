//
//  SaveLoginViewController.m
//  HXXY
//
//  Created by Apple on 12/13/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "SaveLoginViewController.h"
#import "NSString+URLEncoding.h"
#import "NSNumber+Message.h"

@interface SaveLoginViewController ()

@end

@implementation SaveLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"设置密码";
    _dict =[[NSMutableDictionary alloc]init];
    [self initView];
}

-(void)initView{
    UILabel * saveLoginpassword=[[UILabel alloc]initWithFrame:CGRectMake(20, 100, 150, 30)];
    saveLoginpassword.text=@"设置登录密码:";
    [self.view addSubview:saveLoginpassword];
    
    saveLoginText=[[UITextField alloc]initWithFrame:CGRectMake(130,saveLoginpassword.frame.origin.y, 170, 30)];
    saveLoginText.borderStyle=UITextBorderStyleRoundedRect;
    saveLoginText.placeholder=@"输入4-12位密码";
    saveLoginText.textAlignment =NSTextAlignmentCenter;
    saveLoginText.clearButtonMode = UITextFieldViewModeWhileEditing;
    saveLoginText.keyboardType = UIKeyboardTypeNumberPad;
    saveLoginText.secureTextEntry=YES;
    saveLoginText.returnKeyType =UIReturnKeyDone;
    [self.view addSubview:saveLoginText];
    
    UIButton *saveButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    saveButton.frame=CGRectMake(20,saveLoginpassword.frame.origin.y+saveLoginpassword.frame.size.height+20, 280, 30);
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [saveButton setBackgroundColor:SystemThemeColor];
    [saveButton.layer setMasksToBounds:YES];
    [saveButton.layer setCornerRadius:10.0];
    [saveButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];

}

-(void)buttonAction:(UIButton *)button{
    
    if (saveLoginText.text.length == 0) {
        [self.view makeToast:@"密码不能为空。" duration:1.0 position:@"center"];
        return;
    }
    if (![saveLoginText.text isEqual:@"1"]) {
        [self.view makeToast:@"密码错误。" duration:1.0 position:@"center"];
        return;
    }
    
    [self.delegate SaveLoginViewController:self];
    
   // [self startRequest];
    
   
}
/*
 * 开始请求Web Service
 */
-(void)startRequest
{
    
//    NSString *strURL = [[NSString alloc] initWithFormat:@"http://www.rjt0663.com/RjtSchool/WebService/User_Login.asmx/getStuList"];
//    
//    NSURL *url = [NSURL URLWithString:[strURL URLEncodedString]];
//    
//    NSString *post = [NSString stringWithFormat:@"id=%@",saveLoginText.text];
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
    
    NSString *strURL = [[NSString alloc] initWithFormat:@"http://www.rjt0663.com/RjtSchool/WebService/User_Login.asmx"];
    NSURL *url = [NSURL URLWithString:[strURL URLEncodedString]];
    
    NSString * envelopeText = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soap:Body>"
    "<getStuList xmlns=\"http://www.rjt0663.com/\">"
    "<id>%@</id>"
    "</getStuList>"
    "</soap:Body>"
    "</soap:Envelope>",saveLoginText.text];
    
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
    
    if ([_currentTagName isEqualToString:@"ID"]) {
        [_dict setObject:string forKey:@"ID"];
    }
    if([_currentTagName isEqualToString:@"CreateDate"])
    {
        [_dict setObject:string forKey:@"CreateDate"];
    }
    if ([_currentTagName isEqualToString:@"IsAvailable"]) {
        [_dict setObject:string forKey:@"IsAvailable"];
    }
    if([_currentTagName isEqualToString:@"StudentName"])
    {
        [_dict setObject:string forKey:@"StudentName"];
    }
    if ([_currentTagName isEqualToString:@"Sex"]) {
        [_dict setObject:string forKey:@"Sex"];
    }
    if([_currentTagName isEqualToString:@"ParentsID"])
    {
        [_dict setObject:string forKey:@"ParentsID"];
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
    NSLog(@"ID %@",[_dict objectForKey:@"ID"]);
    NSLog(@"CreateDate %@",[_dict objectForKey:@"CreateDate"]);
    NSLog(@"IsAvailable %@",[_dict objectForKey:@"IsAvailable"]);
    NSLog(@"StudentName %@",[_dict objectForKey:@"StudentName"]);
    NSLog(@"Sex %@",[_dict objectForKey:@"Sex"]);
    NSLog(@"ParentsID %@",[_dict objectForKey:@"ParentsID"]);
    
    if ([[_dict objectForKey:@"ID"]isEqualToString:@"3"]) {
        
        [self.view makeToast:@"保存成功" duration:1.0 position:@"center"];
        double delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self.delegate SaveLoginViewController:self];
        });

   }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
