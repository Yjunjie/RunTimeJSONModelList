//
//  YJJProperty.h
//  RunTimeJSONModelList
//
//  Created by 🍎应俊杰🍎 doublej on 2017/6/6.
//  Copyright © 2017年 doublej. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJJPropertyType.h"
#import <objc/runtime.h>
@class YJJPropertyType;
@interface YJJProperty : NSObject

/**
 *  这个类包含属性的名字、属性的类型信息两个属性
 */
//成员属性的名字 
@property (nonatomic, readonly) NSString *name;
//成员属性的类型
@property (nonatomic, readonly) YJJPropertyType *type;
+ (instancetype)propertyWithProperty:(objc_property_t)property;

@end
