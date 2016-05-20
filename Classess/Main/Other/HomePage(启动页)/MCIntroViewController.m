//
//  MCIntroViewController.m
//  BuBuBa
//
//  Created by goulela on 16/5/19.
//  Copyright © 2016年 bububa. All rights reserved.
//

#import "MCIntroViewController.h"
#import "MCTabbarController.h"

#define kImageCount 4


@interface MCIntroViewController ()

@property (nonatomic, strong) UIScrollView * scrollView;

@property (nonatomic, strong) UIImageView  * imageView;

@end

@implementation MCIntroViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self basicSetting];
    
    // 添加滑动视图
    [self addScrollView];
}


#pragma mark - 系统代理

#pragma mark - 点击事件
- (void)gotoMainController
{
    MCLogDebug(@"main");
    
    MCTabbarController * tabbar = [[MCTabbarController alloc] init];
    [self presentViewController:tabbar animated:YES completion:nil];
}

#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting
{
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark 添加滑动视图
- (void)addScrollView
{
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, 0, MCScreenWidth, MCScreenHeight);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(MCScreenWidth * kImageCount, 0);
    
    
    for (int i = 0; i < kImageCount; i ++)
    {
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.userInteractionEnabled = YES;
        imageView.frame = CGRectMake(i * MCScreenWidth, 0, MCScreenWidth, MCScreenHeight);
        imageView.image =  [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",i + 1]];
        [self.scrollView addSubview:imageView];
        
        if ((kImageCount - 1) == i)
        {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, 80, 80);
            button.center = CGPointMake(MCScreenWidth / 2, MCScreenHeight - 150);
            button.backgroundColor = [UIColor orangeColor];
            [button setTitle:@"进入应用" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(gotoMainController) forControlEvents:UIControlEventTouchUpInside];
            
            [imageView addSubview:button];
        }
    }
    [self.view addSubview:self.scrollView];
}



@end
