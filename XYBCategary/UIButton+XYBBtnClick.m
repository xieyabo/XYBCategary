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
- (void) setClick:(click)click
{
    objc_setAssociatedObject(self, asssociateKey, click, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self removeTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    if (click) {
        [self addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (click)click
{
    return objc_getAssociatedObject(self, asssociateKey);
}
-(void)buttonClick{
    if (self.click) {
        self.click();
    }
}
@end
