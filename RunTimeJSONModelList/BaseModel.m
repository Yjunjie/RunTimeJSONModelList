
//
//  BaseModel.m
//  RunTimeJSONModelList
//
//  Created by 🍎应俊杰🍎 doublej on 2017/6/6.
//  Copyright © 2017年 doublej. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

+ (NSDictionary *)objectClassInArray
{
    return @{
             @"users" : @"UserModel"//users数组里面的类型是UserModel
             };
}

@end
