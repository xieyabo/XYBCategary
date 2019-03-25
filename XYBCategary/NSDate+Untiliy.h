//
//  NSDate+Untiliy.h
//  TabViewRowHeight
//
//  Created by 杭州帮聚 on 2019/3/25.
//  Copyright © 2019 谢亚波. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Untiliy)

/**
    时间转时间戳
    @pram date 时间
    @pram formatter 格式
    return 时间戳
 **/
+ (NSString *)xyb_dateToTimeStr:(NSDate *) date formatter:(NSString *)formatter;

/**
 时间戳转时间
 @pram timeStr 时间戳
 @pram formatter 格式
 return 时间
 **/

+ (NSDate *)xyb_timeStrToDate:(NSString *)timeStr formatter:(NSString *)formatter;

/**
 时间转字符串
 @pram date  时间
 @pram formatter 格式
 return 时间字符串
 **/

+ (NSString *)xyb_dateBecomeStr:(NSDate *)date formatter:(NSString *)formatter;

/**
 时间转字符串
 @pram time  时间字符串
 @pram formatter 格式
 return 时间
 **/
+ (NSDate *)xyb_strBecomeDate:(NSString *)time formatter:(NSString *)formatter;




@end

NS_ASSUME_NONNULL_END
