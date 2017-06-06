//
//  NSObject+Property.h
//  RunTimeJSONModelList
//
//  Created by 🍎应俊杰🍎 doublej on 2017/6/6.
//  Copyright © 2017年 doublej. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Property)

/**
 *  这个方法返回对象包含的属性列表。列表中的每个对象包含名字和类型信息
 *
 *  @return 属性列表
 */
+ (NSArray *)properties;
/**
 *  判断是否是foundation框架的类
 *
 *  @param className 类名字
 *
 *  @return 返回布尔值
 */
+ (BOOL)isClassFromFoundation:(Class)className;

@end
