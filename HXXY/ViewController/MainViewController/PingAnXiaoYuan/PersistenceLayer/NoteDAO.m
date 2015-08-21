//
//  NoteDAO.m
//  HXXY
//
//  Created by Apple on 8/18/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "NoteDAO.h"

@implementation NoteDAO


//查询所有数据方法
-(void) findAll
{
    _GradeArray=[[NSMutableArray alloc]init];
    _ClassesArray=[[NSMutableArray alloc]init];
    _StudentNameArray=[[NSMutableArray alloc]init];
    _InOutArray=[[NSMutableArray alloc]init];
    _IotimeArray=[[NSMutableArray alloc]init];
    _listData = [[NSMutableArray alloc]init];
   
    [self startRequest];

}

//插入Note方法
-(void) create:(Note*)model
{
    
}

//删除Note方法
-(void) remove:(Note*)model
{

}

//修改Note方法
-(void) modify:(Note*)model
{

}


-(void)startRequest{
    
    NSString *strURL = [[NSString alloc] initWithFormat:@"http://192.168.66.139/readCardRecord/readCardRecord.asmx"];
    NSURL *url = [NSURL URLWithString:[strURL URLEncodedString]];
    
    NSString * envelopeText = [NSString stringWithFormat:@"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                               "<soap:Body>"
                               "<GetCardRecordList xmlns=\"http://tempuri.org/\" />"
                               "</soap:Body>"
                               "</soap:Envelope>"];
    
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

#pragma mark- NSURLConnection 回调方法
#pragma mark 接受到响应
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (!self.receiveData) {
        self.receiveData = [NSMutableData data];
    } else {
        [self.receiveData setData:nil];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
  
    [self.receiveData appendData:data];
   
}

-(void) connection:(NSURLConnection *)connection didFailWithError: (NSError *)error {
    
    NSLog(@"%@",[error localizedDescription]);
}

- (void) connectionDidFinishLoading: (NSURLConnection*) connection {
    
    NSLog(@"请求完成...");
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:self.receiveData];
    parser.delegate = self;
    [parser parse];
    
    _GradeArray = (NSMutableArray *)[[_GradeArray reverseObjectEnumerator] allObjects];
    _ClassesArray = (NSMutableArray *)[[_ClassesArray reverseObjectEnumerator] allObjects];
    _StudentNameArray = (NSMutableArray *)[[_StudentNameArray reverseObjectEnumerator] allObjects];
    _InOutArray = (NSMutableArray *)[[_InOutArray reverseObjectEnumerator] allObjects];
    _IotimeArray = (NSMutableArray *)[[ _IotimeArray  reverseObjectEnumerator] allObjects];
    _listData = [NSMutableArray arrayWithObjects:_GradeArray,_ClassesArray,_StudentNameArray,_InOutArray,_IotimeArray,nil];
    [self.delegate findAllFinished:_listData];
    
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
 
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
   
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

    if ([_currentTagName isEqualToString:@"GradeName"]) {
        
        [_GradeArray addObject:string];
    }
    
    if([_currentTagName isEqualToString:@"ClassesName"])
    {
        [_ClassesArray addObject:string];
    }
    
    if ([_currentTagName isEqualToString:@"StudentName"]) {
        
        [_StudentNameArray addObject:string];

    }
    
    if ([_currentTagName isEqualToString:@"InOut"]) {
        
        NSString * IoOutString = [string stringByReplacingOccurrencesOfString:@"进" withString:@"已到校"];
        [_InOutArray addObject:IoOutString];
    }
    
    if ([_currentTagName isEqualToString:@"CreateDate"]) {
        
//        方法一
//        NSMutableString * CurrentString  = [[NSMutableString alloc]initWithString:string];
//        NSRange range = NSMakeRange(10, 1);
//        [CurrentString replaceOccurrencesOfString:@"T" withString:@" " options:NSCaseInsensitiveSearch range:range];
//        NSString * finalString =  [[CurrentString stringByReplacingOccurrencesOfString:@"." withString:@" "] substringToIndex:19];
//        [_IotimeArray addObject:finalString ];
        
       NSString *CurrentString = [[string stringByReplacingOccurrencesOfString:@"T" withString:@" "] substringToIndex:19];
       [_IotimeArray addObject:CurrentString];
    }
    
    
    
}

@end
