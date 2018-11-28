//
//  NSObject+Untill.h
//  YiYunTong
//
//  Created by 谢亚波 on 2018/3/20.
//  Copyright © 2018年 谢亚波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <objc/message.h>
@interface NSObject (Untill)

- (void)setModelVauleWithValue:(id) value WithPropotyname:(NSString *) name;

- (NSString *)keyValuesWithObjectWithName:(NSString *)name;

- (NSDictionary *)keyValuesWithObject;

+ (id)objecWithKeyValues:(NSDictionary *)aDictionary;
- (UIViewController *)getCurrentVC;
@end
