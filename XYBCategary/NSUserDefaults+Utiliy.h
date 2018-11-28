//
//  NSUserDefaults+Utiliy.h
//  bangju
//
//  Created by 谢亚波 on 16/10/19.
//  Copyright © 2016年 谢亚波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Utiliy)

/**
 存入自定义对象
 @param object 需要存入的自定义对象
 @param key 自定义对象对应的key
 **/
+ (void)writeWithObject:(id)object
                 forKey:(NSString *)key;

/**
 获取自定义对象
 @param key 自定义对象对应的key
 @return 返回自定义对象
 **/
+ (id)readObjectWithKey:(NSString *)key;

/**
 删除自定义对象
 @param key 自定义对象对应的key
 **/
+ (void)removeObjectForKey:(NSString *)key;

@end
