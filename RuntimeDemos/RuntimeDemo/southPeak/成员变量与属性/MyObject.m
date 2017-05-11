//
//  MyObject.m
//  RuntimeDemo
//
//  Created by zhou on 2017/5/10.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MyObject.h"
#import <objc/runtime.h>
static NSMutableDictionary *map = nil;
@implementation MyObject
+ (void)load{
    map = [NSMutableDictionary dictionary];
    map[@"name1"] = @"name";
    map[@"status1"] = @"status";
    map[@"name2"] = @"name";
    map[@"status2"] = @"status";
}


- (void)setDataWithDic:(NSDictionary *)dic{
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *propertyKey = [self propertyForKey:key];
        if (propertyKey) {
            objc_property_t property = class_getProperty([self class], [propertyKey UTF8String]);
            NSString *attributeString = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
            [self setValue:obj forKey:propertyKey];
        }
    }];
}


- (NSString *)propertyForKey:(NSString *)key{
    return [map objectForKey:key];
}
@end
