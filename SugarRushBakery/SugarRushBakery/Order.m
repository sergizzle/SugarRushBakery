//
//  Order.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "Order.h"

@implementation Order

@dynamic verified;
@dynamic descriptions;
@dynamic OrderType;
@dynamic price;
@dynamic date;
@dynamic orderImage;
@dynamic orderTitle;
@dynamic thisUser;

+ (NSString *)parseClassName {
    return @"Order";
}

+ (void)initialize {
    [super initialize];
    [self registerSubclass];
}

//-(NSString *)description
//{
//    return @"Order";
//}

@end
