//
//  ViewController.m
//  testMemoryManagement
//
//  Created by DaBin on 16/3/29.
//  Copyright © 2016年 DaBin. All rights reserved.
//

#import "ViewController.h"
#import "DBObject.h"
#import "NSMutableArray+Category1.h"
#import "NSMutableArray+Category0.h"
#import "NSMutableArray+Category2.h"
#import "NSMutableArray+Category3.h"
#import "NSMutableArray+Dengbin.h"

@interface ViewController ()

@end


//static NSArray *arr = @[@"5",@"6",@"7"];

//static CGFloat gf = 0.0;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self copySystemObject];
    [self copyCustomObject];
    [self categorySomeMethName];
    [self autoReleasePool];
    [self cacheNumber];
    // Do any additional setup after loading the view, typically from a nib.
}


/**
 *  测试copy在系统对象上的效果
 *  结论：被copy的新数组中的简单对象（NSString）被改变时不影响原数组中的对象
 *       复杂对象被改变时会影响原数组中的对象
 *  原因：简单对象存的是内容，而复杂对象存的是指针
 */
- (void)copySystemObject{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithDictionary:@{@"a":@"b"}];
    NSMutableArray *array1 = [[NSMutableArray alloc]initWithArray:@[@"1",dic,@"3"]];
    NSMutableArray *array2 = [array1 copy];
    NSMutableArray *array3 = [array1 mutableCopy];
    NSLog(@"old array2:\n:%@",array2);
    
    [array1 insertObject:@"0" atIndex:0];
    NSLog(@"new insert array1:\n:%@",array1);
    NSLog(@"new insert array2:\n:%@",array2);
    NSLog(@"new insert array3:\n:%@",array3);
    
    [array1 removeLastObject];
    NSLog(@"new delete array1:\n:%@",array1);
    NSLog(@"new delete array2:\n:%@",array2);
    NSLog(@"new delete array3:\n:%@",array3);
    
    [array1 setObject:@"999" atIndexedSubscript:1];
    NSLog(@"new reset array1:\n:%@",array1);
    NSLog(@"new reset array2:\n:%@",array2);
    NSLog(@"new reset array3:\n:%@",array3);
    
    NSMutableDictionary *dic2 = array1[2];
    [dic2 setObject:@"c" forKey:@"a"];
    NSLog(@"new reset array1:\n:%@",array1);
    NSLog(@"new reset array2:\n:%@",array2);
    NSLog(@"new reset array3:\n:%@",array3);
}

/**
 *  测试copy在自定义对象上的效果（效果为深复制）
 *  结论：可在DBObject重写copy或者在类DBObject中实现NSCopying协议
 */
- (void)copyCustomObject{
    DBObject *aPerson = [[DBObject alloc]init];
    aPerson.db_age = 18;
    aPerson.db_sex = @"男";
    aPerson.db_name = @"马云";
    // 使用指针获取类变量
    aPerson->_db_sss = @"asd";
//    aPerson->privateFav = @"asd";
    [aPerson performSelector:@selector(aaaaaa)];
    
    DBObject *copiedPerson = [aPerson copy];
    NSLog(@"copiedPerson:\n%@",copiedPerson.db_name);
    
    DBObject *newPerson = aPerson;
    newPerson.db_name = @"马化腾";
    
    NSLog(@"aPerson:\n%@",aPerson.db_name);
    NSLog(@"copiedPerson:\n%@",copiedPerson.db_name);
    NSLog(@"newPerson:\n%@",newPerson.db_name);
}


/**
 *  测试多个分类重名时，方法的调用顺序
 *  结论：在编译时文件的编译顺序决定最后的调用方法
 * （文件的编译顺序可以在Build Phases->Compile Sources中找到，也就是设置ARC或者非ARC的地方）
 */
- (void)categorySomeMethName{
    NSMutableArray *array = [[NSMutableArray alloc]initWithObjects:@"1", nil];
    [array addCategoryObject:@"2"];
}


#pragma mark - http://blog.devtang.com/2014/03/21/weak_object_lifecycle_and_tagged_pointer/
// 在64位处理器和32位处理器下下面两个方法输出有区别
- (void)autoReleasePool{
    
    __weak NSNumber *number = [NSNumber numberWithInt:100];
    NSLog(@"number = %@", number);
    
    __weak NSNumber *number2;
    @autoreleasepool {
        number2 = [NSNumber numberWithInt:100];
    }
    NSLog(@"number2 = %@", number2);
}

- (void)cacheNumber{
    NSNumber *number = [NSNumber numberWithInt:10];
    NSNumber *another = [NSNumber numberWithInt:10];
    NSLog(@"%p %p", number, another);
    
    number = [NSNumber numberWithInt:100999999];
    another = [NSNumber numberWithInt:100999999];
    NSLog(@"%p %p", number, another);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
