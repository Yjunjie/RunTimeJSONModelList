//
//  BrandType.h
//  RunTimeJSONModelList
//
//  Created by 🍎应俊杰🍎 doublej on 2017/6/6.
//  Copyright © 2017年 doublej. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrandType : NSObject
/** 品牌名称 */
@property (copy, nonatomic) NSString *name;
/** 品牌Logo */
@property (copy, nonatomic) NSString *logoImgName;
/** 品牌大小 */
@property (assign, nonatomic) int sizeNum;
/** 品牌id */
@property (copy, nonatomic) NSString *brandID;
/** 品牌描述 */
@property (copy, nonatomic) NSString *brandDescription;

@end
