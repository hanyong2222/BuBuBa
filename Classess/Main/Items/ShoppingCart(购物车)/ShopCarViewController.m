//
//  ShopCarViewController.m
//  BuBuBa
//
//  Created by goulela on 16/5/19.
//  Copyright © 2016年 bububa. All rights reserved.
//

#import "ShopCarViewController.h"

@interface ShopCarViewController ()

@end

@implementation ShopCarViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self basicSetting];
}


#pragma mark - 系统代理

#pragma mark - 点击事件

#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting
{
    self.title = @"购物车";
    
}

#pragma mark - setter & getter

@end
