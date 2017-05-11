//
//  RuntimeCategoryClass.h
//  RuntimeDemo
//
//  Created by zhou on 2017/5/10.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeCategoryClass : NSObject
- (void)method1;
@end

@interface RuntimeCategoryClass(Category)
- (void)method2;
@end
