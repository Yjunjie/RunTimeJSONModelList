
//
//  BrandType.m
//  RunTimeJSONModelList
//
//  Created by 🍎应俊杰🍎 doublej on 2017/6/6.
//  Copyright © 2017年 doublej. All rights reserved.
//

#import "BrandType.h"

@implementation BrandType

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"brandID" : @"id",//把服务器返回的id属性替换为ID类型
             @"brandDescription" : @"description"
             };
}

@end
