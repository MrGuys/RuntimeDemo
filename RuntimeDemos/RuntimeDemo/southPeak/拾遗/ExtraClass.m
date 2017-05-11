//
//  ExtraClass.m
//  RuntimeDemo
//
//  Created by zhou on 2017/5/11.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ExtraClass.h"

@implementation ExtraClass
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self test];
    }
    return self;
}
/*
当我们使用super来接收消息时，编译器会生成一个objc_super结构体。就上面的例子而言，这个结构体的receiver就是MyViewController对象，与self相同；superClass指向MyViewController的父类UIViewController。

接下来，发送消息时，不是调用objc_msgSend函数，而是调用objc_msgSendSuper函数，其声明如下：
id objc_msgSendSuper ( struct objc_super *super, SEL op, ... );
该函数第一个参数即为前面生成的objc_super结构体，第二个参数是方法的selector。该函数实际的操作是：从objc_super结构体指向的superClass的方法列表开始查找viewDidLoad的selector，找到后以objc->receiver去调用这个selector，而此时的操作流程就是如下方式了
objc_msgSend(objc_super->receiver, @selector(viewDidLoad))
由于objc_super->receiver就是self本身，所以该方法实际与下面这个调用是相同的：
objc_msgSend(self, @selector(viewDidLoad))

**/

- (void)test{
    //简而言之，消息接收者都是self，但是super是在父类的方法列表里找方法，而self是在本类中的方法列表找
    NSLog(@"self class: %@",self.class);
    NSLog(@"super class: %@",super.class);
}

@end
