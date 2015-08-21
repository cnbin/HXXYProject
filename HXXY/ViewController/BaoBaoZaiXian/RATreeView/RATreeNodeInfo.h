
//The MIT License (MIT)
//
//Copyright (c) 2013 Rafał Augustyniak
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of
//this software and associated documentation files (the "Software"), to deal in
//the Software without restriction, including without limitation the rights to
//use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//the Software, and to permit persons to whom the Software is furnished to do so,
//subject to the following conditions:
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import <Foundation/Foundation.h>

@interface RATreeNodeInfo : NSObject

@property (nonatomic, getter = isExpanded, readonly) BOOL expanded;//判断是否展开
@property (nonatomic, readonly) NSInteger treeDepthLevel;//树状展开的深度，也就是层次级别

@property (nonatomic, readonly) NSInteger siblingsNumber;
@property (nonatomic, readonly) NSInteger positionInSiblings; //在每个层次中，我们选择的单元处于的位置，也就是索引

@property (strong, nonatomic, readonly) RATreeNodeInfo *parent;   //我们选择的cell的上一级信息汇总
@property (strong, nonatomic, readonly) NSArray *children; //我们选择的cell 的子类包含的成员数组

@property (strong, nonatomic, readonly) id item;

@end
