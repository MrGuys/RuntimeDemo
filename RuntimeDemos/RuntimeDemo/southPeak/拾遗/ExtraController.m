//
//  ExtraController.m
//  RuntimeDemo
//
//  Created by zhou on 2017/5/11.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ExtraController.h"
#import "ExtraClass.h"
#import "MyRuntimeBlock.h"
#import <objc/runtime.h>
#define LOG_lINE NSLog(@"\n=====================================================\n")

@interface ExtraController ()

@end

@implementation ExtraController

- (void)viewDidLoad {
    [super viewDidLoad];
    ExtraClass *class = [ExtraClass new];
    //库相关操作
    NSLog(@"获取指定类所在的动态库");
    NSLog(@"UIView's Frameworks:%s",class_getImageName(NSClassFromString(@"UIView")));
    
    NSLog(@"获取指定库或框架中所有类的类名");
    unsigned int outCount;
    const char **classes = objc_copyClassNamesForImage(class_getImageName(NSClassFromString(@"UIView")), &outCount);
    for (int i = 0; i < outCount; i++) {
        NSLog(@"class name:%s",classes[i]);
    }
    LOG_lINE;
    //块操作
    IMP imp = imp_implementationWithBlock(^(id obj, NSString *str){
        NSLog(@"%@",str);
    });
    class_addMethod(MyRuntimeBlock.class, @selector(testBlock:), imp, "v@:@");
    MyRuntimeBlock *runtime = [[MyRuntimeBlock alloc] init];
    [runtime performSelector:@selector(testBlock:) withObject:@"hello world"];

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
