//
//  ClassVar.m
//  RuntimeDemo
//
//  Created by zhou on 2017/5/9.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "ClassVar.h"
#import "MyClass.h"
#import <objc/runtime.h>
#define LOG_lINE NSLog(@"\n=====================================================\n")

@interface ClassVar ()

@end

@implementation ClassVar

- (void)viewDidLoad {
    [super viewDidLoad];
    //类相关操作函数
    [self class1];
    //动态创建类
    [self dynamicIncreateClass];
    
   
    
}
//MRC下有效
/*
 有这样一种场景，假设我们有类A和类B，且类B是类A的子类。类B通过添加一些额外的属性来扩展类A。现在我们创建了一个A类的实例对象，并希望在运行时将这个对象转换为B类的实例对象，这样可以添加数据到B类的属性中。这种情况下，我们没有办法直接转换，因为B类的实例会比A类的实例更大，没有足够的空间来放置对象。此时，我们就要以使用以上几个函数来处理这种情况，如下代码所示
 **/
//- (void)example1{
//    NSObject *a = [[NSObject alloc] init];
//    id newB = object_copy(a, class_getInstanceSize(MyClass.class));
//    object_setClass(newB, MyClass.class);
//    object_dispose(a);
//}

//- (void)example2{
//    int numClasses;
//    Class *classes = NULL;
//    
//    numClasses = objc_getClassList(NULL, 0);
//    if (numClasses > 0) {
//        classes = malloc(sizeof(Class) * numClasses);
//        numClasses = objc_getClassList(classes, numClasses);
//        NSLog(@"number of classes: %d",numClasses);
//        for (int i = 0; i < numClasses; i++) {
//            Class cls = classes[i];
//            NSLog(@"class name: %s", class_getName(cls));
//        }
//        free(classes);
//    }http://www.cnblogs.com/whyandinside/archive/2013/02/26/2933552.html
//}


- (void)imp_subMethod1{
    NSLog(@"imp_submethod1");
}

- (void)dynamicIncreateClass{
    Class cls = objc_allocateClassPair(MyClass.class, "MySubClass", 0);
    
    class_addMethod(cls, @selector(subMethod1), class_getMethodImplementation(self.class, @selector(imp_subMethod1)), "V@:");
    class_replaceMethod(cls, @selector(method1), class_getMethodImplementation(self.class, @selector(imp_subMethod1)), "v@:");
    class_addIvar(cls, "_ivar1", sizeof(NSString *), log(sizeof(NSString *)), "i");
    
    objc_property_attribute_t type = {"T","@\"NSString\""};
    objc_property_attribute_t ownership = {"C",""};
    objc_property_attribute_t backingivar = {"V", "_ivar1"};
    objc_property_attribute_t attrs[] = {type, ownership, backingivar};
    
    class_addProperty(cls, "property2", attrs, 3);
    objc_registerClassPair(cls);
    
    id instance = [[cls alloc] init];
    [instance performSelector:@selector(subMethod1)];
    [instance performSelector:@selector(method1)];
}


- (void)class1{
    // Do any additional setup after loading the view.
    MyClass *myClass = [[MyClass alloc] init];
    unsigned int outCount = 0;
    Class cls = myClass.class;
    
    //类名
    NSLog(@"class name %s",class_getName(cls));
    LOG_lINE;
    
    //父类
    NSLog(@"super class name: %s",class_getName(class_getSuperclass(cls)));
    LOG_lINE;
    
    //是否是元类
    NSLog(@"MyClass is %@ a meta-class",(class_isMetaClass(cls) ? @"" : @"not"));
    LOG_lINE;
    
    //获取元类
    Class meta_class = objc_getMetaClass(class_getName(cls));
    NSLog(@"%s's meta-class is %s",class_getName(cls), class_getName(meta_class));
    LOG_lINE;
    
    //实例变量大小
    NSLog(@"instance size: %zu",class_getInstanceSize(cls));
    LOG_lINE;
    
    //成员变量列表
    Ivar *ivars = class_copyIvarList(cls, &outCount);
    for (int i = 0; i < outCount; i ++) {
        Ivar ivar = ivars[i];
        NSLog(@"instance variable's name: %s at index: %d", ivar_getName(ivar), i);
    }
    free(ivars);
    LOG_lINE;
    
    //获取成员变量
    Ivar string = class_getInstanceVariable(cls, "_string");
    if (string != NULL) {
        NSLog(@"instance variable %s",ivar_getName(string));
    }
    LOG_lINE;
    
    //属性操作
    objc_property_t *properties = class_copyPropertyList(cls, &outCount);
    
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSLog(@"property's name: %s",property_getName(property));
    }
    free(properties);
    
    objc_property_t array = class_getProperty(cls, "array");
    if (array != NULL) {
        NSLog(@"property %s", property_getName(array));
    }
    
    LOG_lINE;
    
    //方法操作
    Method *methods = class_copyMethodList(cls, &outCount);
    for (int i = 0; i < outCount; i++) {
        Method method = methods[i];
        NSLog(@"method's signature: %s",sel_getName(method_getName(method)));
    }
    free(methods);
    
    //公有方法
    Method method1 = class_getInstanceMethod(cls, @selector(method1));
    if (method1 != NULL) {
        NSLog(@"method %s", sel_getName(method_getName(method1)));
    }
    
    //类方法
    Method classMethod = class_getClassMethod(cls, @selector(classMethod1));
    if (classMethod != NULL) {
        NSLog(@"class method : %s", sel_getName(method_getName(classMethod)));
    }
    //私有方法
    NSLog(@"MyClass is %@ responsd to selector: method3WithArg1:arg2:",class_respondsToSelector(cls, @selector(method3WithArg1:arg2:)) ? @"" : @" not");
    
    //获取实现
    IMP imp = class_getMethodImplementation(cls, @selector(method1));
    imp(); //调用
    LOG_lINE;
    
    //协议
    Protocol *__unsafe_unretained *protocols = class_copyProtocolList(cls, &outCount);
    Protocol *protocol;
    for (int i = 0; i < outCount; i ++) {
        protocol = protocols[i];
        NSLog(@"protocol name: %s",protocol_getName(protocol));
    }
    NSLog(@"MyClass is %@ responsed to protocol %s",class_conformsToProtocol(cls, protocol) ? @"" : @"not",protocol_getName(protocol));
    
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
