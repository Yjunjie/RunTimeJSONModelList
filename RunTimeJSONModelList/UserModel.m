
//
//  UserModel.m
//  RunTimeJSONModelList
//
//  Created by 🍎应俊杰🍎 doublej on 2017/6/6.
//  Copyright © 2017年 doublej. All rights reserved.
//

#import "UserModel.h"
#import "BookModel.h"

@implementation UserModel

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"ID" : @"id"//把服务器返回的id属性替换为ID类型
             };
}


+ (NSDictionary *)objectClassInArray
{
    return @{
             @"books" : @"BookModel"
             };
}

@end
