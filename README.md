# RunTimeJSONModelList
RunTimeJSONModelList运行时字典转模型  http://www.jianshu.com/p/cd6cd4362791
Model *model = [BaseModel objectWithKeyValues:dic];

支持关键字字段转换
+ (NSDictionary *)replacedKeyFromPropertyName
{
   return @{
           @"ID" : @"id"//把服务器返回的id属性替换为ID类型
        };
}

多层JSON一步转模型
