//
//  NSMutableArray+Dengbin.m
//  testMemoryManagement
//
//  Created by DaBin on 16/3/29.
//  Copyright © 2016年 DaBin. All rights reserved.
//

#import "NSMutableArray+Dengbin.h"

@implementation NSMutableArray (Dengbin)

- (void)addCategoryObject:(id)obj{
    NSLog(@"%s",__FUNCTION__);
    [self addObject:obj];
}

@end
