//
//  Order.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <Parse/Parse.h>

@interface Order : PFObject <PFSubclassing>

typedef enum{
    custom,
    defined
} orderType;


@property orderType OrderType;
@property NSString *description;
@property BOOL verified;
@property double price;
@property NSString *date;
//image


@end
