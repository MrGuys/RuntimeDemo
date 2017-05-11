//
//  RuntimeKit.h
//  RuntimeDemo
//
//  Created by zhou on 2017/5/4.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeKit : NSObject

/**
 获取类名

 @param class 要获取类名的类
 @return 类名
 */
+ (NSString *)fetchClassName:(Class)class;

/**
 获取成员变量

 @param class 要获取成员变量的类
 @return 获取到的成员变量
 */
+ (NSArray *)fetchIvarList:(Class)class;

/**
 获取类的属性列表，包括私有和公有属性，以及定义在延展中的属性

 @param class 要获取的类
 @return 属性列表数组
 */
+ (NSArray *)fetchPropertyList:(Class)class;

/**
 获取类的实例方法列表：getter, setter,对象方法等。当不能获取类方法

 @param class 要获取的类
 @return 方法列表
 */
+ (NSArray *)fetchMethodList:(Class)class;

/**
 获取协议列表

 @param class 需要获取协议的类
 @return 协议列表
 */
+ (NSArray *)fetchProtocolList:(Class)class;

/**
 给类添加新方法与实现

 @param class 相对应的类
 @param methodSel 方法名称
 @param methodSelImp1 对应方法实现的fangfam 
 */
+ (void)addMethod:(Class)class method:(SEL)methodSel mehtod:(SEL)methodSelImp1;
@end
