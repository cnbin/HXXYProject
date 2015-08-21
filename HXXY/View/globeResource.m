//
//  globeResource.m
//  HXXY
//
//  Created by Apple on 1/8/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "globeResource.h"

@implementation globeResource
__strong static globeResource *share = nil;

+ (instancetype)sharedInstance
{
    static dispatch_once_t pred = 0;
    dispatch_once(&pred, ^{
        share = [[super allocWithZone:NULL] init];
    });
    return share;
}

- (void)setBool:(BOOL)value forKey:(NSString *)defaultName{

    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)boolForKey:(NSString *)defaultName{
    
    if ([[NSUserDefaults standardUserDefaults]valueForKey:defaultName])
    {
        return (BOOL)[[NSUserDefaults standardUserDefaults] valueForKey:defaultName];
    }
    return NO;
}

-(void)setValue:(id)value forKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

@end
