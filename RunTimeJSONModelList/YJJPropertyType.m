
//
//  YJJPropertyType.m
//  RunTimeJSONModelList
//
//  Created by 🍎应俊杰🍎 doublej on 2017/6/6.
//  Copyright © 2017年 doublej. All rights reserved.
//

#import "YJJPropertyType.h"
#import "YJJPropertyConst.h"
#import "YJJProperty.h"
#import "NSObject+Property.h"
@implementation YJJPropertyType

/**
 *  用于缓存一些常用类型的type，避免多次调用
 */
static NSMutableDictionary *cachedTypes_;
+ (void)load
{
    cachedTypes_ = [NSMutableDictionary dictionary];
}

+ (instancetype)propertyTypeWithAttributeString:(NSString *)string{
    return [[YJJPropertyType alloc] initWithTypeString:string];
}

- (instancetype)initWithTypeString:(NSString *)string
{
    NSLog(@"string=====%@",string);
    NSUInteger loc = 1;
    NSUInteger len = [string rangeOfString:@","].location - loc;
    NSString *typeCode = [string substringWithRange:NSMakeRange(loc, len)];
    //如果以前没有缓存对应type。。则初始化。
    if (!cachedTypes_[typeCode])
    {
        NSLog(@"cachedTypes=====%@",typeCode);
        self = [super init];
        [self getTypeCode:typeCode];
        cachedTypes_[typeCode] = self;
    }
    
    return self;
}

- (void)getTypeCode:(NSString *)code
{
    NSLog(@"code===%@",code);
    if ([code isEqualToString:YJJPropertyTypeId]) {
        _idType = YES;
    } else if (code.length > 3 && [code hasPrefix:@"@\""]) {
        // 去掉@"和"，截取中间的类型名称
        _code = [code substringWithRange:NSMakeRange(2, code.length - 3)];
        _typeClass = NSClassFromString(_code);
        _numberType = (_typeClass == [NSNumber class] || [_typeClass isSubclassOfClass:[NSNumber class]]);
        //
        _fromFoundation = [NSObject isClassFromFoundation:_typeClass];
    }
    // 是否为数字类型uppercaseString capitalizedString
    NSString *lowerCode = code.lowercaseString;
    NSString *upperCode = code.uppercaseString;
    NSString *capitaCode = code.capitalizedString;
    NSArray *numberTypes = @[YJJPropertyTypeInt, YJJPropertyTypeShort, YJJPropertyTypeBOOL1, YJJPropertyTypeBOOL2, YJJPropertyTypeFloat, YJJPropertyTypeDouble, YJJPropertyTypeLong, YJJPropertyTypeChar];
    //boole类型是number类型的一种。
    if ([numberTypes containsObject:lowerCode]||[numberTypes containsObject:upperCode]||[numberTypes containsObject:capitaCode]) {
        _numberType = YES;
        
        if ([lowerCode isEqualToString:YJJPropertyTypeBOOL1]
            || [lowerCode isEqualToString:YJJPropertyTypeBOOL2]) {
            _boolType = YES;
        }
    }
}


@end
