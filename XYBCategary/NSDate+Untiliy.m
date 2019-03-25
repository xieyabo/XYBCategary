//
//  NSDate+Untiliy.m
//  TabViewRowHeight
//
//  Created by 杭州帮聚 on 2019/3/25.
//  Copyright © 2019 谢亚波. All rights reserved.
//

#import "NSDate+Untiliy.h"

@implementation NSDate (Untiliy)

/**
 时间转时间戳
 @pram date 时间
 @pram formatter 格式
 return 时间戳
 **/
+ (NSString *)xyb_dateToTimeStr:(NSDate *) date formatter:(NSString *)formatter
{
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%0.f",timeInterval];
}

/**
 时间戳转时间
 @pram timeStr 时间戳
 @pram formatter 格式
 return 时间
 **/

+ (NSDate *)xyb_timeStrToDate:(NSString *)timeStr formatter:(NSString *)formatter
{
    NSTimeInterval interval = [timeStr doubleValue];
    return [self dateWithTimeIntervalSince1970:interval];
}

/**
 时间转字符串
 @pram date  时间
 @pram formatter 格式
 return 时间字符串
 **/

+ (NSString *)xyb_dateBecomeStr:(NSDate *)date formatter:(NSString *)formatter
{
    return [[self xyb_stringToFormatter:formatter] stringFromDate:date];
}

/**
 时间转字符串
 @pram time  时间字符串
 @pram formatter 格式
 return 时间
 **/
+ (NSDate *)xyb_strBecomeDate:(NSString *)time formatter:(NSString *)formatter
{
    return [[self xyb_stringToFormatter:formatter] dateFromString:time];
}


+ (NSDateFormatter *)xyb_stringToFormatter:(NSString *)formatterStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    if (formatterStr.length==0) {
        [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    }else{
        [formatter setDateFormat:formatterStr];
    }
    return formatter;
}

@end
