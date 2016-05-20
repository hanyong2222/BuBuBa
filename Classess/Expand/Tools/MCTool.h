//
//  MCTool.h
//  BuBuBa
//
//  Created by goulela on 16/5/19.
//  Copyright © 2016年 bububa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^SuccessBlock)(id data);
typedef void(^FailureBlock)(NSError * error);

@interface MCTool : NSObject

+ (double)MCGetDeviceVersion;

//NSUserDefault写入
+ (void)MCSetObject:(id)object forKey:(NSString *)key;
+ (void)MCSetBool:(BOOL)b forKey:(NSString *)key;

//NSUserDefault读出
+ (id)MCGetObjectForKey:(NSString *)key;
+ (BOOL)MCGetBoolForKey:(NSString *)key;

//NSUserDefault移除
+ (void)MCRemoveObjectforKey:(NSString *)key;

////获取图片缓存
//+ (NSString *)MCGetImageCache;
//
//添加左侧元素项
+ (void)MCAddLeftBarButtonItemWithFrame:(CGRect)frame textColor:(UIColor *)color font:(UIFont *)font target:(id)target selected:(SEL)selector image:(UIImage *)image who:(UINavigationItem *)navigationItem  text:(NSString *)text andIsHighLight:(BOOL)isHighLight;

//添加右侧元素项
+ (void)MCAddRightBarButtonItemWithFrame:(CGRect)frame textColor:(UIColor *)color font:(UIFont *)font target:(id)target selected:(SEL)selector image:(UIImage *)image who:(UINavigationItem *)navigationItem text:(NSString *)text andIsHighLight:(BOOL)isHighLight;
//
////添加警示框或者下拉菜单 (确定和取消按钮)
//+ (void)MCAlertControllerWithViewController:(UIViewController *)viewController style:(UIAlertControllerStyle )alertStyle title:(NSString *)title message:(NSString *)message cancelButtonTilte:(NSString *)cancelButtonTilte otherButtonTitle:(NSString *)otherButtonTitle  confirm:(void (^)())confirm cancle:(void (^)())cancle;
//
////添加警示框或者下拉菜单 (取消按钮)
//+ (void)MCAlertController_cancel_WithViewController:(UIViewController *)viewController style:(UIAlertControllerStyle )alertStyle title:(NSString *)title message:(NSString *)message cancelButtonTilte:(NSString *)cancelButtonTilte  cancle:(void (^)())cancle;
//
//// 添加警示框-网络异常显示的情况
//+ (void)MCAlert_abnormalNetworkWithViewController:(UIViewController *)viewController andCancel:(void (^)())cancle;
//
////金额小写转大写
//+ (NSString *)changetoBigMoney:(NSString *)numstr;
//
////网络请求 -->> get
//+ (void)MCSendGETNetWorkWithUrl:(NSString *)url parameters:(NSDictionary *)dict success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock;
//
////网络请求 -->> post
//+ (void)MCSEndPOSTNetWorkWithUrl:(NSString *)url parameters:(NSDictionary *)dict success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock;

@end
