//
//  Status.m
//  HCDExtension
//
//  Created by 黄成都 on 15/9/20.
//  Copyright (c) 2015年 黄成都. All rights reserved.
//
#import "StatusResult.h"
#import "Status.h"
#import "BookModel.h"
@implementation Status


+ (NSDictionary *)objectClassInArray
{
    return @{
             @"books" : @"BookModel"
             };
}

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"texta" : @"text"//把服务器返回的id属性替换为ID类型
             };
}

@end
