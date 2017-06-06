//
//  UserModel.h
//  RunTimeJSONModelList
//
//  Created by 🍎应俊杰🍎 doublej on 2017/6/6.
//  Copyright © 2017年 doublej. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BrandType.h"
typedef enum {
    SexMaleType,
    SexFemaleType
} Sex;

@interface UserModel : NSObject

//@property (copy, nonatomic) NSString *code;

@property (strong, nonatomic) NSMutableArray *books;
/** 昵称 */
@property (copy, nonatomic) NSString *nickname;
/** 头像 */
@property (copy, nonatomic) NSString *photo;
/** 年龄 */
@property (assign, nonatomic) unsigned int age;

/** 性别 */
@property (assign, nonatomic) Sex sex;
/** 同性恋 */
@property (assign, nonatomic, getter=isGay) BOOL gay;

@property (nonatomic, strong) id test;
//子类属性 用户代言品牌类型
@property (nonatomic, strong) BrandType *brandType;
/** id */
@property (copy, nonatomic) NSString *ID;
@end
