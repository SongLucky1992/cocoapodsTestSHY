//
//  CustomNavigationBar.m
//  StretchHeadControls
//
//  Created by 宋好云 on 2017/11/6.
//  Copyright © 2017年 宋好云. All rights reserved.
//

#import "CustomNavigationBar.h"
#import "Config.h"

@interface CustomNavigationBar ()
//@property (nonatomic, strong) UILabel*
@end

@implementation CustomNavigationBar

+ (instancetype)navigationBar {
    return [[self alloc]initWithFrame:CGRectMake(0, 0, WIDTH, kTopHeight)];
}

- (UILabel*)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(44, kStatusBarHeight, WIDTH-44*2, kNavBarHeight)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

@end
