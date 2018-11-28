//
//  XYBCategaryHeader.h
//  xybceshi
//
//  Created by 杭州帮聚 on 2018/11/28.
//  Copyright © 2018 杭州帮聚. All rights reserved.
//

#ifndef XYBCategaryHeader_h
#define XYBCategaryHeader_h

#import "UIButton+XYBBtnClick.h"
#import "UIView+XYBViewTouch.h"
#import "NSUserDefaults+Utiliy.h"
#import "NSObject+Untill.h"
#import "NSString+XYBStringUntill.h"


#define fDeviceWidth ([UIScreen mainScreen].bounds.size.width)
#define fDeviceHeight ([UIScreen mainScreen].bounds.size.height)

#define IS_IPHONE4                  (fDeviceHeight < 568)
#define IS_IPHONE5                  (fDeviceHeight == 568)
#define IS_IPHONE6                  (fDeviceHeight == 667)
#define IS_IPHONE6P                 (fDeviceHeight == 736)
#define IS_IPHONEx                  (fDeviceHeight >= 812)
#define FONT(x)         [UIFont systemFontOfSize:(IS_IPHONE6P?x+1:(IS_IPHONE5?x-2:x))]
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self
#define SS(strongSelf) __strong __typeof(&*weakSelf)strongSelf = weakSelf

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define KNavHeight              IS_IPHONEx?84:64
#define KFooterHeight           IS_IPHONEx?34:0

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define KProduction YES
#define NSLog(FORMAT, ...) fprintf(stderr,"\n %s:%d   %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__LINE__, [[[NSString alloc] initWithData:[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] dataUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding] UTF8String]);
#else
#define KProduction NO
#define NSLog(...);
#endif

#endif /* XYBCategaryHeader_h */
