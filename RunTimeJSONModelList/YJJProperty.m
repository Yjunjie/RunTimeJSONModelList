
//
//  YJJProperty.m
//  RunTimeJSONModelList
//
//  Created by 🍎应俊杰🍎 doublej on 2017/6/6.
//  Copyright © 2017年 doublej. All rights reserved.
//

#import "YJJProperty.h"
#import "YJJPropertyType.h"
@implementation YJJProperty
/**
 *  初始化一个对象
 *
 *  @param property 类型信息
 *
 *  @return 返回自定义的类型信息
 */
+ (instancetype)propertyWithProperty:(objc_property_t)property{
    return  [[YJJProperty alloc] initWithProperty:property];
}


- (instancetype)initWithProperty:(objc_property_t)property{
    if (self = [super init]) {
        _name = @(property_getName(property));
        NSLog(@"_name===%@",_name);
        _type = [YJJPropertyType propertyTypeWithAttributeString:@(property_getAttributes(property))];;
        NSLog(@"_type===%@",_type);
    }
    return self;
}

@end
