//
//  NSObject+KeyValueObject.h
//  RunTimeJSONModelList
//
//  Created by 🍎应俊杰🍎 doublej on 2017/6/6.
//  Copyright © 2017年 doublej. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YJJKeyValue <NSObject>
@optional
/**
 *  用于指定一个数组中元素的类型
 *
 *  @return 返回一个字典，值表示对应的类型
 */
+ (NSDictionary *) objectClassInArray;
/**
 *  实际开发中,服务器LOW命名可能会使用关键字作为JSON字段 例如 id 这时需要此方法替换成非关键在
 *
 *  如 ID
 *
 *  @return 返回一个对应的字典
 */
+ (NSDictionary *)replacedKeyFromPropertyName;

@end

@interface NSObject (KeyValueObject)<YJJKeyValue>
/**
 *  返回解析的实例对象
 *
 *  @param keyValues 传入一个字典字典
 *
 *  @return 返回一个解析好的实例对象
 */
+ (instancetype)objectWithKeyValues:(id)keyValues;

@end
