//
//  RADataObject.h
//  TreeTable
//
//  Created by Apple on 12/9/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RADataObject : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *children;

- (id)initWithName:(NSString *)name children:(NSArray *)array;

+ (id)dataObjectWithName:(NSString *)name children:(NSArray *)children;
@end
