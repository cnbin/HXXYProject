//
//  globeResource.h
//  HXXY
//
//  Created by Apple on 1/8/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface globeResource : NSObject

#define selectedCellIndex [NSString stringWithFormat:@"%d",indexPath.row]
#define SystemThemeColor [UIColor colorWithRed:0 green:199.0f/255.0f blue:140.0f/255.0f alpha:1.0f]

@property (nonatomic,copy)   NSString * shareViewTag;
@property (nonatomic,assign) NSInteger sum;
@property (nonatomic,assign) NSInteger cellBadegnum;

@property (nonatomic,copy) NSString * name;
@property (nonatomic,assign)BOOL value;

@property (nonatomic,assign) NSInteger babyImageIndex;

@property (nonatomic,copy)   NSMutableArray * shareGradeArray;


+ (instancetype)sharedInstance;

- (void)setBool:(BOOL)value forKey:(NSString *)defaultName;
- (BOOL)boolForKey:(NSString *)defaultName;

@end
