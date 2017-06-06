//
//  BaseModel.h
//  RunTimeJSONModelList
//
//  Created by 🍎应俊杰🍎 doublej on 2017/6/6.
//  Copyright © 2017年 doublej. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface BaseModel : NSObject
@property (strong, nonatomic) NSMutableArray *users;
//@property (strong, nonatomic) UserModel *user;
@property (copy, nonatomic) NSString *code;

@end
