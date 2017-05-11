//
//  MethodController.m
//  RuntimeDemo
//
//  Created by zhou on 2017/5/10.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "MethodController.h"

@interface MethodController ()

@end

@implementation MethodController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //两个类之间，不管它们是父类与子类的关系，还是之间没有这种关系，只要方法名相同，那么方法的SEL就是一样的。每一个方法都对应着一个SEL。所以在Objective-C同一个类(及类的继承体系)中，不能存在2个同名的方法，即使参数类型不同也不行。相同的方法只能对应一个SEL。这也就导致Objective-C在处理相同方法名且参数个数相同但类型不同的方法方面的能力很差。如在某个类中定义以下两个方法：
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
