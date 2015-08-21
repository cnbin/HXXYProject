//
//  userTableViewCell.m
//  HXXY
//
//  Created by Apple on 1/14/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "userTableViewCell.h"

@implementation userTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark 设置Cell的边框宽度
- (void)setFrame:(CGRect)frame {
    frame.origin.x += 9;
    frame.size.width -= 2 * 9;
    [super setFrame:frame];
}
@end
