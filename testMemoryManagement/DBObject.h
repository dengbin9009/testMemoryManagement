//
//  DBObject.h
//  testMemoryManagement
//
//  Created by DaBin on 16/3/29.
//  Copyright © 2016年 DaBin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DBObject : NSObject <NSCopying>

@property (nonatomic, copy) NSString *db_name;
@property (nonatomic, copy) NSString *db_sex;
@property (nonatomic, assign) CGFloat db_age;

@end
