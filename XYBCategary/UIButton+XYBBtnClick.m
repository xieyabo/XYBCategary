//
//  UIButton+XYBBtnClick.m
//  xybceshi
//
//  Created by 杭州帮聚 on 2018/11/27.
//  Copyright © 2018 杭州帮聚. All rights reserved.
//

#import "UIButton+XYBBtnClick.h"
static const void *asssociateKey = @"xybbtnclickasssociateKey";
@implementation UIButton (XYBBtnClick)

- (void)btnAddAction:(void(^)(void))click
{
    void(^action)(void) = objc_getAssociatedObject(self, asssociateKey);
    if (action==nil) {
        objc_setAssociatedObject(self, asssociateKey, click, OBJC_ASSOCIATION_RETAIN);
        [self addTarget:self action:@selector(btnAddClick) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)btnAddClick
{
    void(^action)(void) = objc_getAssociatedObject(self, asssociateKey);
    if (action) {
        action();
    }
}

@end
