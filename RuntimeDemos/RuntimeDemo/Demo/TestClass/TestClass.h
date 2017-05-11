//
//  TestClass.h
//  RuntimeDemo
//
//  Created by zhou on 2017/5/5.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestClass : NSObject<NSCoding, NSCopying>
@property (nonatomic, strong)NSArray *publicProperty1;
@property (nonatomic, strong)NSString *publicProperty2;

+ (void)classMethod:(NSString *)value;
- (void)publicTestMehtod1:(NSString *)value1 second:(NSString *)value2;
- (void)publicTesstMethod2;

- (void)method1;
@end
