//
//  BadgeView.m
//  HXXY
//
//  Created by Apple on 1/8/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "BadgeView.h"
#import "globeResource.h"

@implementation BadgeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _ViewTag=[globeResource sharedInstance].shareViewTag;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:_ViewTag object:nil];
        
    }
    return self;
}

- (void)themeNotification:(NSNotification *)notification {
    
    [self removeBadge];
}

- (void)removeBadge {
    
    [self removeFromSuperview];
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:_ViewTag object:nil];
}

@end
