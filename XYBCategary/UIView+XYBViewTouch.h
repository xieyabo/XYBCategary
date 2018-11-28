//
//  UIView+XYBViewTouch.h
//  xybceshi
//
//  Created by 杭州帮聚 on 2018/11/27.
//  Copyright © 2018 杭州帮聚. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (XYBViewTouch)

/*
 获取到父容器的控制器的方法
 */
- (UIViewController *)GetViewVC;

/**
 设置点击事件
 @param clicked 事件处理内容
 **/
- (void)clicked:(nonnull void(^)( UITapGestureRecognizer * _Nonnull gesture))clicked
       delegate:(nullable id <UIGestureRecognizerDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
