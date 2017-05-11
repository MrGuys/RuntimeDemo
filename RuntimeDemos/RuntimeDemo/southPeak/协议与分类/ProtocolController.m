//
//  ProtocolController.m
//  RuntimeDemo
//
//  Created by zhou on 2017/5/10.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ProtocolController.h"
#import "RuntimeCategoryClass.h"
#import <objc/Object.h>
@interface ProtocolController ()

@end

@implementation ProtocolController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    unsigned int outCount = 0;
    Method *methodList = class_copyMethodList(RuntimeCategoryClass.class, &outCount);
    
    for (int i = 0; i < outCount; i++) {
        Method method = methodList[i];
        const char *name = sel_getName(method_getName(method));
        NSLog(@"RuntimeCategoryClass's method: %s", name);
        if (strcmp(name, sel_getName(@selector(method2)))) {
            NSLog(@"分类方法method2在objc_class的方法列表中");
        }
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
