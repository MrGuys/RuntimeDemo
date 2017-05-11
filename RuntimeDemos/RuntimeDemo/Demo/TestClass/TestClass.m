//
//  TestClass.m
//  RuntimeDemo
//
//  Created by zhou on 2017/5/5.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "TestClass.h"
@interface TestClass ()
{
    NSInteger _var1;
    int _var2;
    BOOL _var3;
    double _var4;
    float _var5;
}
@property (nonatomic, strong)NSMutableArray *privateProperty1;
@property (nonatomic, strong)NSNumber *privateProperty2;
@property (nonatomic, strong)NSDictionary *privateProperty3;
@end
@implementation TestClass


- (void)privateTestMethod1{
    NSLog(@"privateTestMethod1");
}
- (void)privateTestmethod2{
    NSLog(@"privateTestMethod2");
}
- (void)method1{
    NSLog(@"我是Method1的实现");
}

@end
