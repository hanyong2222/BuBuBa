//
//  MCTool.m
//  BuBuBa
//
//  Created by goulela on 16/5/19.
//  Copyright © 2016年 bububa. All rights reserved.
//

#import "MCTool.h"

#define MCUserDefaults [NSUserDefaults standardUserDefaults]

@implementation MCTool

+ (double)MCGetDeviceVersion
{
    return  [[UIDevice currentDevice].systemVersion doubleValue];
}

#pragma mark UserDefault id类型写入
+ (void)MCSetObject:(id)object forKey:(NSString *)key
{
    [MCUserDefaults setObject:object forKey:key];
    [MCUserDefaults synchronize];
}

#pragma mark UserDefault BOOL类型写入
+ (void)MCSetBool:(BOOL)b forKey:(NSString *)key
{
    [MCUserDefaults setBool:b forKey:key];
    [MCUserDefaults synchronize];
}

#pragma mark UserDefault id类型读出
+ (id)MCGetObjectForKey:(NSString *)key
{
    return [MCUserDefaults objectForKey:key];
}

#pragma mark UserDefault BOOL类型读出
+ (BOOL)MCGetBoolForKey:(NSString *)key
{
    return [MCUserDefaults boolForKey:key];
}

#pragma mark UserDefault 移除
+ (void)MCRemoveObjectforKey:(NSString *)key
{
    [MCUserDefaults removeObjectForKey:key];
    [MCUserDefaults synchronize];
}

//#pragma mark 获取图片缓存
//+ (NSString *)MCGetImageCache
//{
//    NSString *cacheSizeStr;
//    NSUInteger cacheSize = [[SDImageCache sharedImageCache] getSize];
//    // 缓存的最小单位 B
//    if (cacheSize < 1024)
//    {
//        cacheSizeStr = [NSString stringWithFormat:@"%lu B", (unsigned long)cacheSize];
//    }
//    else if(cacheSize >= 1024 && cacheSize < 1024 * 1024)
//    {
//        cacheSizeStr = [NSString stringWithFormat:@"%.2f KB", cacheSize / 1024.0];
//    }
//    else if (cacheSize >= 1024 * 1024 && cacheSize < 1024 * 1024 * 1024)
//    {
//        cacheSizeStr = [NSString stringWithFormat:@"%.2f MB", cacheSize / (1024 * 1024.0)];
//    }
//    else
//    {
//        cacheSizeStr = [NSString stringWithFormat:@"%.2f GB", cacheSize / (1024 * 1024 * 1024.0)];
//    }
//    return cacheSizeStr;
//}
//
//
//
#pragma mark 添加导航条左侧元素项
//方法封装中包含事件的时候,注意点 1.需要传进来一个Target(即:点击事件中的target:self). 2.传过来一个选择器,selected:(SEL)selector
+ (void)MCAddLeftBarButtonItemWithFrame:(CGRect)frame textColor:(UIColor *)color font:(UIFont *)font target:(id)target selected:(SEL)selector image:(UIImage *)image who:(UINavigationItem *)navigationItem  text:(NSString *)text andIsHighLight:(BOOL)isHighLight
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitle:text forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button.titleLabel.font = font;
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    button.adjustsImageWhenHighlighted = isHighLight;
    navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

#pragma mark 添加导航条右侧元素项
+ (void)MCAddRightBarButtonItemWithFrame:(CGRect)frame textColor:(UIColor *)color font:(UIFont *)font target:(id)target selected:(SEL)selector image:(UIImage *)image who:(UINavigationItem *)navigationItem text:(NSString *)text andIsHighLight:(BOOL)isHighLight
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitle:text forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button.titleLabel.font = font;
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    button.adjustsImageWhenHighlighted = isHighLight;
    navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}
//
//
//#pragma mark 添加警示框 (取消和确定)
//+ (void)MCAlertControllerWithViewController:(UIViewController *)viewController style:(UIAlertControllerStyle )alertStyle title:(NSString *)title message:(NSString *)message cancelButtonTilte:(NSString *)cancelButtonTilte otherButtonTitle:(NSString *)otherButtonTitle  confirm:(void (^)())confirm cancle:(void (^)())cancle
//{
//    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertStyle];
//    
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTilte style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//        cancle();
//    }];
//    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        confirm();
//    }];
//    // Add the actions.
//    [alertController addAction:cancelAction];
//    [alertController addAction:otherAction];
//    [viewController presentViewController:alertController animated:YES completion:nil];
//}
//
//#pragma mark 添加警示框或者下拉菜单 (取消按钮)
//
//+ (void)MCAlertController_cancel_WithViewController:(UIViewController *)viewController style:(UIAlertControllerStyle )alertStyle title:(NSString *)title message:(NSString *)message cancelButtonTilte:(NSString *)cancelButtonTilte  cancle:(void (^)())cancle
//{
//    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertStyle];
//    
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTilte style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//        if (cancle) {
//            cancle();
//        }
//    }];
//    
//    // Add the actions.
//    [alertController addAction:cancelAction];
//    [viewController presentViewController:alertController animated:YES completion:nil];
//}
//
//#pragma mark 警示框-网络异常提示
//+ (void)MCAlert_abnormalNetworkWithViewController:(UIViewController *)viewController andCancel:(void (^)())cancle
//{
//    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"提示信息" message:@"您是网络异常,请稍后再试" preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//        if (cancle) {
//            cancle();
//        }
//    }];
//    
//    [alertController addAction:cancelAction];
//    [viewController presentViewController:alertController animated:YES completion:nil];
//}
//
//#pragma mark 网络请求 -->> get
//+ (void)MCSendGETNetWorkWithUrl:(NSString *)url parameters:(NSDictionary *)dict success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock
//{
//    
//    NSURL *URL = [NSURL URLWithString:url];
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager GET:URL.absoluteString parameters:dict progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        successBlock (responseObject);
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        failureBlock(error);
//    }];
//}
//
//#pragma mark 网络请求 -->> post
//+ (void)MCSEndPOSTNetWorkWithUrl:(NSString *)url parameters:(NSDictionary *)dict success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock
//{
//    NSURL * URL = [NSURL URLWithString:url];
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager POST:URL.absoluteString parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        successBlock(responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        failureBlock(error);
//    }];
//}
//
//#pragma mark 金币大小写
//+ (NSString *)changetoBigMoney:(NSString *)numstr
//{
//    double numberals=[numstr doubleValue];
//    NSArray *numberchar = @[@"零",@"壹",@"贰",@"叁",@"肆",@"伍",@"陆",@"柒",@"捌",@"玖"];
//    NSArray *inunitchar = @[@"",@"拾",@"佰",@"仟"];
//    NSArray *unitname = @[@"",@"万",@"亿",@"万亿"];
//    //金额乘以100转换成字符串（去除圆角分数值）
//    NSString *valstr=[NSString stringWithFormat:@"%.2f",numberals];
//    NSString *prefix;
//    NSString *suffix;
//    if (valstr.length<=2) {
//        prefix=@"零元";
//        if (valstr.length==0) {
//            suffix=@"零角零分";
//        }
//        else if (valstr.length==1)
//        {
//            suffix=[NSString stringWithFormat:@"%@分",[numberchar objectAtIndex:[valstr intValue]]];
//        }
//        else
//        {
//            NSString *head=[valstr substringToIndex:1];
//            NSString *foot=[valstr substringFromIndex:1];
//            suffix=[NSString stringWithFormat:@"%@角%@分",[numberchar objectAtIndex:[head intValue]],[numberchar objectAtIndex:[foot intValue]]];
//        }
//    }
//    else
//    {
//        prefix=@"";
//        suffix=@"";
//        int flag = (int)valstr.length-2;
//        NSString *head=[valstr substringToIndex:flag-1];
//        NSString *foot=[valstr substringFromIndex:flag];
//        if (head.length>13) {
//            return @"数值太大（最大支持13位整数），无法处理";
//        }
//        //处理整数部分
//        NSMutableArray *ch=[[NSMutableArray alloc]init];
//        for (int i = 0; i < head.length; i++) {
//            NSString * str=[NSString stringWithFormat:@"%x",[head characterAtIndex:i]-'0'];
//            [ch addObject:str];
//        }
//        int zeronum=0;
//        
//        for (int i=0; i<ch.count; i++) {
//            int index=(ch.count -i-1)%4;//取段内位置
//            int indexloc=(int)(ch.count -i-1)/4;//取段位置
//            if ([[ch objectAtIndex:i] isEqualToString:@"0"]) {
//                zeronum++;
//            }
//            else
//            {
//                if (zeronum!=0) {
//                    if (index!=3) {
//                        prefix=[prefix stringByAppendingString:@"零"];
//                    }
//                    zeronum=0;
//                }
//                prefix=[prefix stringByAppendingString:[numberchar objectAtIndex:[[ch objectAtIndex:i]intValue]]];
//                prefix=[prefix stringByAppendingString:[inunitchar objectAtIndex:index]];
//            }
//            if (index ==0 && zeronum<4) {
//                prefix=[prefix stringByAppendingString:[unitname objectAtIndex:indexloc]];
//            }
//        }
//        prefix =[prefix stringByAppendingString:@"元"];
//        //处理小数位
//        if ([foot isEqualToString:@"00"]) {
//            suffix =[suffix stringByAppendingString:@"整"];
//        }
//        else if ([foot hasPrefix:@"0"])
//        {
//            NSString *footch=[NSString stringWithFormat:@"%x",[foot characterAtIndex:1]-'0'];
//            suffix=[NSString stringWithFormat:@"%@分",[numberchar objectAtIndex:[footch intValue]]];
//        }
//        else
//        {
//            NSString *headch=[NSString stringWithFormat:@"%x",[foot characterAtIndex:0]-'0'];
//            NSString *footch=[NSString stringWithFormat:@"%x",[foot characterAtIndex:1]-'0'];
//            suffix=[NSString stringWithFormat:@"%@角%@分",[numberchar objectAtIndex:[headch intValue]],[numberchar objectAtIndex:[footch intValue]]];
//        }
//    }
//    return [prefix stringByAppendingString:suffix];
//}




@end