//
//  MyClass.h
//  RuntimeDemo
//
//  Created by zhou on 2017/5/9.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject<NSCopying, NSCoding>
@property (nonatomic, strong)NSArray *array;
@property (nonatomic, copy)NSString *string;

- (void)method1;
- (void)method2;
+ (void)classMethod1;
@end
