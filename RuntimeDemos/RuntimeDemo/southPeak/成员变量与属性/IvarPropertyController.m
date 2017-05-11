//
//  IvarPropertyController.m
//  RuntimeDemo
//
//  Created by zhou on 2017/5/10.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "IvarPropertyController.h"
#import "MyObject.h"
@interface IvarPropertyController ()

@end

@implementation IvarPropertyController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic1 = @{@"name1": @"张三",@"status1": @"start"};
    NSDictionary *dic2 = @{@"name2": @"张三",@"status2": @"end"};
    
    MyObject *obj1 = [MyObject new];
    [obj1 setDataWithDic:dic1];
    
    MyObject *obj2 = [MyObject new];
    [obj2 setDataWithDic:dic2];
    
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
