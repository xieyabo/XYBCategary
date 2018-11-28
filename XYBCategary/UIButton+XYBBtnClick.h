//
//  UIButton+XYBBtnClick.h
//  xybceshi
//
//  Created by 杭州帮聚 on 2018/11/27.
//  Copyright © 2018 杭州帮聚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void(^click)(void);
NS_ASSUME_NONNULL_BEGIN

@interface UIButton (XYBBtnClick)

@property (nonatomic , copy)click click;

@end

NS_ASSUME_NONNULL_END
