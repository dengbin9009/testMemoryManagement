//
//  NSMutableArray+Category2.m
//  testMemoryManagement
//
//  Created by DaBin on 16/3/29.
//  Copyright © 2016年 DaBin. All rights reserved.
//

#import "NSMutableArray+Category2.h"

@implementation NSMutableArray (Category2)

- (void)addCategoryObject:(id)obj{
    NSLog(@"%s",__FUNCTION__);
    [self addObject:obj];
}

@end
