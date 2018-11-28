//
//  NSObject+Untill.m
//  YiYunTong
//
//  Created by 谢亚波 on 2018/3/20.
//  Copyright © 2018年 谢亚波. All rights reserved.
//

#import "NSObject+Untill.h"

@implementation NSObject (Untill)

- (void)setModelVauleWithValue:(id) value WithPropotyname:(NSString *) name
{
    if (self) {
        if (name.length==0) {
            return;
        }
        NSString *key = [NSString stringWithFormat:@"set%@%@:",[name substringToIndex:1].uppercaseString,[name substringFromIndex:1]];
        SEL setSel = NSSelectorFromString(key);
        if ([self respondsToSelector:setSel]) {
            ((void (*) (id,SEL,id)) objc_msgSend) (self,setSel,value);
        }
    }
}
- (NSString *)keyValuesWithObjectWithName:(NSString *)name
{
    
    const char *propertyName = [name cStringUsingEncoding:NSASCIIStringEncoding];
    SEL getter = sel_registerName(propertyName);
    if ([self respondsToSelector:getter]) {
        id value = ((id (*) (id,SEL)) objc_msgSend) (self,getter);
        /*判断当前属性是不是Model*/
        if ([value isKindOfClass:[self class]] && value) {
            value = [value keyValuesWithObjectWithName:name];
        }
        if (value) {
            return value;
        }else{
            return @"";
        }
    }
    return @"";
}

- (NSDictionary *)keyValuesWithObject
{
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return props;
}

+ (id)objecWithKeyValues:(NSDictionary *)aDictionary
{
    id objc = [[self alloc] init];
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    unsigned int outCount = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &outCount);
    for (int i = 0; i < outCount; i ++) {
        objc_property_t property = propertyList[i];
        //生成getter方法，并用objc_msgSend调用
        const char *propertyName = property_getName(property);
        [arr addObject:[NSString stringWithFormat:@"%s",propertyName]];
    }
    
    for (NSString *key in aDictionary.allKeys) {
        id value = aDictionary[key];
        /*判断当前属性是不是Model*/
        objc_property_t property = class_getProperty(self, key.UTF8String);
        unsigned int outCount = 0;
        objc_property_attribute_t *attributeList = property_copyAttributeList(property, &outCount);
        objc_property_attribute_t attribute;
        NSString *typeString;
        if (attributeList==nil) {
            typeString = @"";
        }else{
            attribute = attributeList[0];
            typeString = [NSString stringWithUTF8String:attribute.value];
        }
        if ([typeString isEqualToString:@"@\"TestModel\""]) {
            value = [self objecWithKeyValues:value];
        }
        /**********************/
        //生成setter方法，并用objc_msgSend调用
        NSString *methodName = [NSString stringWithFormat:@"set%@%@:",[key substringToIndex:1].uppercaseString,[key substringFromIndex:1]];
        SEL setter = sel_registerName(methodName.UTF8String);
        if ([objc respondsToSelector:setter]) {
            if ([arr containsObject:key]) {
                ((void (*) (id,SEL,id)) objc_msgSend) (objc,setter,value);
            }
        }
    }
    return objc;
}
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication].delegate window];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC=window.rootViewController;
    //    如果是present上来的appRootVC.presentedViewController 不为nil
    if (appRootVC.presentedViewController) {
        //多层present
        while (appRootVC.presentedViewController) {
            appRootVC = appRootVC.presentedViewController;
            if (appRootVC) {
                nextResponder = appRootVC;
            }else{
                break;
            }
        }
        //        nextResponder = appRootVC.presentedViewController;
    }else{
        
        //        NSLog(@"===%@",[window subviews]);
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        //        UINavigationController * nav = tabbar.selectedViewController ; 上下两种写法都行
        result=nav.childViewControllers.lastObject;
        
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else if([nextResponder isKindOfClass:[UIWindow class]]){
        UIWindow *window = (UIWindow *)nextResponder;
        result = window.rootViewController;
    }else if([nextResponder isKindOfClass:[UIWindow class]]){
        UIWindow *window = (UIWindow *)nextResponder;
        if ([window.rootViewController isKindOfClass:[UITabBarController class]]) {
            UITabBarController * tabbar = (UITabBarController *)window.rootViewController;
            UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
            //        UINavigationController * nav = tabbar.selectedViewController ; 上下两种写法都行
            result=nav.childViewControllers.lastObject;
        }else{
            result = window.rootViewController;
        }
    }else{
        result = nextResponder;
    }
    return result;
}

@end
