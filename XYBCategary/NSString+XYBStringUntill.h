//
//  NSString+XYBStringUntill.h
//  xybceshi
//
//  Created by 杭州帮聚 on 2018/11/28.
//  Copyright © 2018 杭州帮聚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (XYBStringUntill)
/*
 字符串是否只包含数字或者字母
 字符串长度6-16位
 */

- (BOOL)stringContainFigureOrWorld;


/*
 验证码
 length验证码长度，（一般4到6位）
 */

- (BOOL)stringIsVerifyCodeWithLength:(int)length;

/*
 验证邮箱
 */

- (BOOL)stringIsEmailAddress;


/*
 身份证验证
 */
- (BOOL)stringAccurateVerifyIDCardNumber;

/*
 手机号验证
 */

- (BOOL)stringIsMobileNumber;

/*
 银行号验证
 */
- (BOOL)stringCheckBankCardNo;

/*
 车牌
 */

- (BOOL)stringIsCarNum;

/*
 md5加密
 */

- (NSString *) md5;
@end

NS_ASSUME_NONNULL_END
