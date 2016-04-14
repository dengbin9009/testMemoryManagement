//
//  DBObject.m
//  testMemoryManagement
//
//  Created by DaBin on 16/3/29.
//  Copyright © 2016年 DaBin. All rights reserved.
//

#import "DBObject.h"

static NSInteger count;


//static NSArray *arr = @[@"asd",@"as"];
static NSArray *arr;

@interface DBObject (){
    
}

@property (nonatomic, strong) NSString *privateFav;

- (void)aaaaaa;

@end

@implementation DBObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        count++;
    }
    return self;
}

+ (void)initialize
{
    if (self == [DBObject class]) {
        count = 0;
        arr = @[@"asd"];
        arr = @[@"asd",@"as"];
        NSLog(@"%@",arr);
    }
}

+ (NSInteger)getCount {
    return count;
}

//- (instancetype)copy{
//    DBObject *newObject = [[DBObject alloc]init];
//    newObject.db_name = self.db_name;
//    newObject.db_sex = self.db_sex;
//    newObject.db_age = self.db_age;
//    return newObject;
////    [super copy];
////    return self;
//}

- (instancetype)copyWithZone:(NSZone *)zone{
    DBObject *newObject = [DBObject allocWithZone:zone];
    newObject.db_name = [self.db_name copyWithZone:zone];
    newObject.db_sex = self.db_sex;
    newObject.db_age = self.db_age;
    return newObject;
}


- (void)aaaaaa{
    NSLog(@"%s",__FUNCTION__);
}

@end
