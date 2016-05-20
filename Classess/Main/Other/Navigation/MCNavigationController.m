//
//  MCNavigationController.m
//  BuBuBa
//
//  Created by goulela on 16/5/18.
//  Copyright © 2016年 bububa. All rights reserved.
//

#import "MCNavigationController.h"

@interface MCNavigationController ()

@end

@implementation MCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航条的背景颜色以及文字颜色和大小
    UINavigationBar * navigationBar = [UINavigationBar appearance];
    
    [navigationBar setBackgroundColor:MCUIColorLightBlue];
    
    //设置背景图片
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_background"] forBarMetrics:0];
    
    //设置导航条文字 大小和颜色
    [navigationBar setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17.0f],NSForegroundColorAttributeName : MCUIColorGray}];
}

@end
