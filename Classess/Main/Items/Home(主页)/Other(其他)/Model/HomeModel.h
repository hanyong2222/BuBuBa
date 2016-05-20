//
//  HomeModel.h
//  BuBuBa
//
//  Created by goulela on 16/5/19.
//  Copyright © 2016年 bububa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject

// 图片路径
@property (nonatomic, copy) NSString * image;

// 标题
@property (nonatomic, copy) NSString * title;

// 详情
@property (nonatomic, copy) NSString  * detail;

// 观看
@property (nonatomic, copy) NSString * look;

// 赞
@property (nonatomic, copy) NSString * good;

// 转载
@property (nonatomic, copy) NSString * reprint;

@end
