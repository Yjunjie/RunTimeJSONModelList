//
//  ViewController.m
//  RunTimeJSONModelList
//
//  Created by doublej on 2017/6/6.
//  Copyright © 2017年 doublej. All rights reserved.
//

#import "ViewController.h"
#import "UserModel.h"
#import "BrandType.h"
#import "YJJModel.h"
#import "BaseModel.h"
#import "BookModel.h"


@interface ViewController ()
@property (nonatomic, strong) NSDictionary *modelDic;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 230, 100, 100);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btActions) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    
}

-(void)btActions{
    NSLog(@"modelDic==%@",self.modelDic);
    // 2.将字典转为UserModel模型
    BaseModel *baseModel = [BaseModel objectWithKeyValues:self.modelDic];
    NSLog(@"baseModel==%@==%@==%@",baseModel,baseModel.users,baseModel.code);
    
    for (UserModel *user in baseModel.users) {
        NSString *nickname = user.nickname;
        NSString *photo = user.photo;
        int age = user.age;
        NSString *ID = user.ID;
        int sex = user.sex;
        NSLog(@"nickname=%@, photo=%@, ID=%@ age=%d sex=%d",nickname,photo,ID,age,sex);
        NSString *logoImgName = user.brandType.logoImgName;
        NSString *name = user.brandType.name;
        int sizeNum = user.brandType.sizeNum;
        NSString *brandID = user.brandType.brandID;
        NSString *brandDescription = user.brandType.brandDescription;
        NSLog(@"logoImgName=%@, name=%@, brandID=%@ brandDescription=%@ sizeNum=%d", logoImgName,name,brandID,brandDescription,sizeNum);
        
        for (BookModel *book in user.books) {
            NSLog(@"name=%@,bookID=%@",book.name,book.bookID);
        }
        
    }
}

-(NSDictionary*)modelDic
{
    // 1.定义一个字典
    NSDictionary *dict = @{
                           @"users" : @[
                                   @{
                                       @"books":@[
                                               @{@"name" : @"ayjj111",
                                                 @"bookID" : @"a11111111111"
                                                 },
                                               @{@"name" : @"ayjj222",
                                                 @"bookID" : @"a22222222222"
                                                 }
                                               ],
                                       @"nickname" : @"double-j",
                                       @"photo" : @"double-j.png",
                                       @"age" : @25,
                                       @"sex" : @"1",
                                       @"gay" : @"1",
                                       @"id" : @"111",
                                       @"brandType" : @{
                                               @"name" : @"object-C-JSONModel",
                                               @"sizeNum" : @"22",
                                               @"id" : @"11111111111",
                                               @"description" : @"description",
                                               @"logoImgName" : @"logoImgName.png"
                                               }
                                       },
                                   
                                   @{
                                       @"books":@[
                                               @{@"name" : @"byjj111",
                                                 @"bookID" : @"b11111111111"
                                                 },
                                               @{@"name" : @"byjj222",
                                                 @"bookID" : @"b22222222222"
                                                 }
                                               ],
                                       @"nickname" : @"yjj",
                                       @"photo" : @"yjj.png",
                                       @"age" :  @25,
                                       @"sex" : @"2",
                                       @"gay" : @"2",
                                       @"id" : @"222",                                       @"brandType" : @{
                                               @"name" : @"swift-JSONModel",
                                               @"sizeNum" : @"44",
                                               @"id" : @"22222222222",
                                               @"description" : @"description22",
                                               @"logoImgName" : @"logoImgName22.png"
                                               }
                                       }
                                   ],
                           @"code" : @"200"
                           };
    return dict;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
