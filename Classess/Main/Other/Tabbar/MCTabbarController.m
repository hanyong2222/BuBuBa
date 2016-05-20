//
//  MCTabbarController.m
//  BuBuBa
//
//  Created by goulela on 16/5/18.
//  Copyright © 2016年 bububa. All rights reserved.
//

#import "MCTabbarController.h"

// 子控制器
#import "HomeViewController.h"
#import "ClassViewController.h"
#import "ShopCarViewController.h"
#import "MineViewController.h"

// 导航器
#import "MCNavigationController.h"

//
#import "UIImage+image.h"



@interface MCTabbarController ()

@end

@implementation MCTabbarController

//修改本类下的TabbarItem的字体颜色
+ (void)initialize
{
    //获取当前类下的UITabbarItem
    
    UITabBarItem * item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = MCUIColorGray;
    
    [item setTitleTextAttributes:dic forState:UIControlStateSelected];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //添加所有自控制器
    [self addAllChildViewController];
}

- (void)addAllChildViewController
{
    // 主页
    HomeViewController *home = [[HomeViewController alloc] init];
    MCNavigationController * homeNav = [[MCNavigationController alloc] initWithRootViewController:home];
    [self setUpOneChildViewController:homeNav image:@"Tabbar_shouye" selectedImage:@"Tabbar_shouye_sel" andTitle:@"主页"];
    
    // 分类
    ClassViewController * class = [[ClassViewController alloc] init];
    MCNavigationController * classNav = [[MCNavigationController alloc] initWithRootViewController:class];
    [self setUpOneChildViewController:classNav image:@"Tabbar_fenlei" selectedImage:@"Tabbar_fenlei_sel" andTitle:@"分类"];
    
    // 购物车
    ShopCarViewController * shopCar = [[ShopCarViewController alloc] init];
    MCNavigationController * shopCarNav = [[MCNavigationController alloc] initWithRootViewController:shopCar];
    [self setUpOneChildViewController:shopCarNav image:@"Tabbar_gouwuche" selectedImage:@"Tabbar_gouwuch_sel" andTitle:@"购物车"];
    
    // 我的
    MineViewController * mine = [[MineViewController alloc] init];
    MCNavigationController * mineNav = [[MCNavigationController alloc] initWithRootViewController:mine];
    [self setUpOneChildViewController:mineNav image:@"Tabbar_geren" selectedImage:@"Tabbar_geren_sel" andTitle:@"我的"];
}

#pragma mark 添加一个子控制器
- (void)setUpOneChildViewController:(UINavigationController *)nav image:(NSString *)image selectedImage:(NSString *)selectedImage andTitle:(NSString *)title
{
    nav.view.backgroundColor = [UIColor lightGrayColor];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:image];
    
    //添加一张原始的没有被渲染的图片.
    nav.tabBarItem.selectedImage = [UIImage imageWithOriginalName:selectedImage];
    [self addChildViewController:nav];
}

@end
