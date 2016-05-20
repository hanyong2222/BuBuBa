//
//  UIImage+image.m
//  BuBuBa
//
//  Created by goulela on 16/5/18.
//  Copyright © 2016年 bububa. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)

+ (instancetype)imageWithOriginalName:(NSString *)imageName
{
    UIImage * image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
