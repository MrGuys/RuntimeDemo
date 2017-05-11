//
//  ViewController.m
//  RuntimeDemo
//
//  Created by zhou on 2017/5/4.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ViewController.h"
#import "RuntimeKit.h"
#import "TestClass.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}




- (IBAction)tapButton1:(UIButton *)sender {
    NSString *className = [RuntimeKit fetchClassName:[TestClass class]];
    NSLog(@"测试类的类名为:%@",className);
}

- (IBAction)tapButton2:(id)sender {
    NSArray *ivarList = [RuntimeKit fetchIvarList:[TestClass class]];
    NSLog(@"获取TestClass的成员变量列表:%@", ivarList);
}

- (IBAction)tapButton3:(id)sender {
    NSArray *propertyList = [RuntimeKit fetchPropertyList:[TestClass class]];
    NSLog(@"\n获取TestClass的属性列表:%@", propertyList);
}

- (IBAction)tapButton4:(id)sender {
    NSArray *methodList = [RuntimeKit fetchMethodList:[TestClass class]];
    NSLog(@"获取TestClass的方法列表 %@",methodList);
}

- (IBAction)tapButton5:(id)sender {
    NSArray *protocolList = [RuntimeKit fetchProtocolList:[TestClass class]];
    NSLog(@"获取TestClass遵循的协议的列表 %@",protocolList);
}

- (IBAction)tapButton6:(id)sender {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
