
//
//  NSMutableArray+Category3.m
//  testMemoryManagement
//
//  Created by DaBin on 16/3/29.
//  Copyright © 2016年 DaBin. All rights reserved.
//

#import "NSMutableArray+Category3.h"

@implementation NSMutableArray (Category3)

- (void)addCategoryObject:(id)obj{
    NSLog(@"%s",__FUNCTION__);
    [self addObject:obj];
}

@end
