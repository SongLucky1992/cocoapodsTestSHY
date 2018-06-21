//
//  Config.h
//  StretchHeadControls
//
//  Created by 宋好云 on 2017/11/5.
//  Copyright © 2017年 宋好云. All rights reserved.
//

#define WIDTH [[UIScreen mainScreen]bounds].size.width
#define HEIGHT [[UIScreen mainScreen]bounds].size.height

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

