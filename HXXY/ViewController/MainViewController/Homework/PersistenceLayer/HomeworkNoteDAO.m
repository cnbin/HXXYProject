//
//  NoteDAO.m
//  HXXY
//
//  Created by Apple on 8/18/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "HomeworkNoteDAO.h"

@implementation HomeworkNoteDAO


//查询所有数据方法
-(void) findAll
{
    _titleArray = [[NSMutableArray alloc]init];
    _contentArray = [[NSMutableArray alloc]init];
    _datetimeArray = [[NSMutableArray alloc]init];
    _listData = [[NSMutableArray alloc]init];

    [self startRequest];

}

//插入Note方法
-(void) create:(HomeworkNote*)model
{
    
}

//删除Note方法
-(void) remove:(HomeworkNote*)model
{

}

//修改Note方法
-(void) modify:(HomeworkNote*)model
{

}


-(void)startRequest{
    
    NSString *strURL = [[NSString alloc] initWithFormat:@"http://192.168.66.146/HXXYWebservice/HXXY.asmx"];
    NSURL *url = [NSURL URLWithString:[strURL URLEncodedString]];
    
    NSString * envelopeText = [NSString stringWithFormat:@"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                               "<soap:Body>"
                               "<GetHomework xmlns=\"http://tempuri.org/\" />"
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
    
    _listData = [NSMutableArray arrayWithObjects:_titleArray,_contentArray,_datetimeArray,nil];
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
    
    NSLog(@"string is %@",string);
    if ([_currentTagName isEqualToString:@"Title"]) {
        
        [_titleArray addObject:string];
        
    }
    if([_currentTagName isEqualToString:@"Content"])
    {
        
        [_contentArray addObject:string];
    }
    if ([_currentTagName isEqualToString:@"Time"]) {
        
        [_datetimeArray addObject:string];
    }
    
}

@end
