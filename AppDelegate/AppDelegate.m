//
//  AppDelegate.m
//  BuBuBa
//
//  Created by goulela on 16/5/18.
//  Copyright © 2016年 bububa. All rights reserved.
//

#import "AppDelegate.h"

// 引导页
#import "MCIntroViewController.h"

#import "MCTabbarController.h"

// 宏定义
#define kVersion @"version"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    // 获取应用版本号
    NSDictionary * infoDict = [NSBundle mainBundle].infoDictionary;
    NSString *currentVersion = infoDict[(NSString *)kCFBundleVersionKey];

    NSString * saveVersion = [MCTool MCGetObjectForKey:kVersion];
    
    if ([saveVersion isEqualToString:currentVersion])
    {
        // 不是新版本
        [self gotoMainController];
    }
    else
    {
        // 进入新特征介绍页面
        [MCTool MCSetObject:currentVersion forKey:kVersion];
        
        [self gotoIntroducePage];
    }
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma 进入主页
- (void)gotoMainController
{
    MCTabbarController * tabbar = [[MCTabbarController alloc] init];
    
    self.window.rootViewController = tabbar;
}

#pragma mark 进入介绍页面
- (void)gotoIntroducePage
{
    MCIntroViewController * introViewController = [[MCIntroViewController alloc] init];
    
    self.window.rootViewController = introViewController;
}



@end
