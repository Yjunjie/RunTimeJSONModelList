
//
//  NSObject+Property.m
//  RunTimeJSONModelList
//
//  Created by 🍎应俊杰🍎 doublej on 2017/6/6.
//  Copyright © 2017年 doublej. All rights reserved.
//

#import "NSObject+Property.h"
#import "YJJProperty.h"
#import "YJJPropertyType.h"

/**
 *  次结构体是一个属性列表的对象
 */
typedef struct property_t {
    const char *name;
    const char *attributes;
} *propertyStruct;
@implementation NSObject (Property)

//保存foundation框架里面的类
static NSSet *foundationClasses_;

/**
 *  多数情况下不止一次调用了获取属性的方法,对于一个类来说要获取它的全部属性,
 *  只要获取一次就够了.获取到将结果缓存起来,
 *  下次复用.
 */
static NSMutableDictionary *cachedProperties_;

+ (void)load
{
    cachedProperties_ = [NSMutableDictionary dictionary];
}

+ (NSSet *)foundationClasses
{
    if (foundationClasses_ == nil) {
        
        foundationClasses_ = [NSSet setWithObjects:
                              [NSURL class],
                              [NSDate class],
                              [NSValue class],
                              [NSData class],
                              [NSArray class],
                              [NSDictionary class],
                              [NSString class],
                              [NSAttributedString class], nil];
    }
    return foundationClasses_;
}

+ (BOOL)isClassFromFoundation:(Class)className{
    if (className == [NSObject class]) return YES;
    __block BOOL result = NO;
    [[self foundationClasses] enumerateObjectsUsingBlock:^(Class foundationClass, BOOL *stop) {
        if ([className isSubclassOfClass:foundationClass]) {
            result = YES;
            *stop = YES;
        }
    }];
    return result;
}

+(NSArray *)properties{
    NSMutableArray *cachedProperties = cachedProperties_[NSStringFromClass(self)];
    if (!cachedProperties) {//没有找到缓存、则初始化
        NSLog(@"%@调用了properties方法",[self class]);
        cachedProperties = [NSMutableArray array];
        // 获取所有的属性
        unsigned int outCount = 0;
        objc_property_t *properties = class_copyPropertyList(self, &outCount);
        
        for (int i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            YJJProperty *propertyObj = [YJJProperty propertyWithProperty:property];
            [cachedProperties addObject:propertyObj];
            //NSLog(@"%@,%@",propertyObj.name,propertyObj.type.typeClass);
        }
        //释放内存
        free(properties);
        //缓存属性列表
        cachedProperties_[NSStringFromClass(self)] = cachedProperties;
    }
    
    return cachedProperties;
}


@end
