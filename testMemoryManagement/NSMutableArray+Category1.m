//
//  NSMutableArray+Category1.m
//  testMemoryManagement
//
//  Created by DaBin on 16/3/29.
//  Copyright © 2016年 DaBin. All rights reserved.
//

#import "NSMutableArray+Category1.h"

@implementation NSMutableArray (Category1)

- (void)addCategoryObject:(id)obj{
    NSLog(@"%s",__FUNCTION__);
    [self addObject:obj];
}


@end
