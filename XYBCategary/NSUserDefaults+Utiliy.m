//
//  NSUserDefaults+Utiliy.m
//  bangju
//
//  Created by 谢亚波 on 16/10/19.
//  Copyright © 2016年 谢亚波. All rights reserved.
//

#import "NSUserDefaults+Utiliy.h"

@implementation NSUserDefaults (Utiliy)

+ (void)writeWithObject:(id)object
                 forKey:(NSString *)key
{
    [self removeObjectForKey:key];
    
    NSUserDefaults *userDefault = [self standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object requiringSecureCoding:YES error:nil];
    [userDefault setObject:data
                    forKey:key];
    [userDefault synchronize];
}

+ (id)readObjectWithKey:(NSString *)key
{
    NSUserDefaults *userDefault = [self standardUserDefaults];
    id obj = [userDefault objectForKey:key];
    if (obj) {
        return [NSKeyedUnarchiver unarchiveObjectWithData:obj];
    } else {
        return nil;
    }
}

+ (void)removeObjectForKey:(NSString *)key
{
    NSUserDefaults *userDefault = [self standardUserDefaults];
    [userDefault removeObjectForKey:key];
    [userDefault synchronize];
}


@end
