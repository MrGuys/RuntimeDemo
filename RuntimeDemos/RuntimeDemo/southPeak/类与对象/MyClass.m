//
//  MyClass.m
//  RuntimeDemo
//
//  Created by zhou on 2017/5/9.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MyClass.h"
@interface MyClass (){
    NSInteger _instance1;
    NSString *_instance2;
}
@property (nonatomic, assign)NSUInteger integer;
@end
@implementation MyClass
+ (void)classMethod1{
    
}

- (void)method1{
    NSLog(@"call method method1");
}

- (void)method2{
    
}

- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString *)arg2{
    NSLog(@"arg1 : %ld , arg2 : %@",arg1, arg2);
}

@end
