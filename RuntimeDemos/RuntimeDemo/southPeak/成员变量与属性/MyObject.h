//
//  MyObject.h
//  RuntimeDemo
//
//  Created by zhou on 2017/5/10.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyObject : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *status;

- (void)setDataWithDic:(NSDictionary *)dic;
@end
