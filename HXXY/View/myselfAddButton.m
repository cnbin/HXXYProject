//
//  myselfAddButton.m
//  HXXY
//
//  Created by Apple on 1/12/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "myselfAddButton.h"

@implementation myselfAddButton

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctx, 0, 199.0/255.0f,140.0f/255.0f, 1.0);//坐标颜色
    CGContextMoveToPoint(ctx, 15, 30);//起点坐标 (x1,y1)
    CGContextAddLineToPoint(ctx, 45,30);//终点坐标(x2,y2)
    CGContextStrokePath(ctx);
    
    CGContextRef ct = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ct, 0, 199.0/255.0f,140.0f/255.0f, 1.0);
    CGContextMoveToPoint(ct, 30, 15);
    CGContextAddLineToPoint(ct, 30,45);
    CGContextStrokePath(ct);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat lengths[] = {5,5,5,5}; //虚线样式
    CGRect aRect= CGRectMake(0,0,60,60); // (图型x坐标,图形y坐标,直径,直径)
    CGContextSetRGBStrokeColor(context, 0, 199.0/255.0f,140.0f/255.0f, 1.0);
    CGContextSetLineDash(context, 0, lengths, 1);
    CGContextSetLineWidth(context, 1.0); //1.0 线宽
    CGContextAddEllipseInRect(context, aRect); //椭圆
    CGContextDrawPath(context, kCGPathStroke);
}

@end
