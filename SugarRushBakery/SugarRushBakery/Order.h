//
//  Order.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <Parse/Parse.h>
#import "User.h"

typedef enum{
    custom,
    defined
} orderType;

@interface Order : PFObject <PFSubclassing>

@property NSString *customer;
@property orderType OrderType;
@property NSString *descriptions;
@property BOOL verified;
@property double price;
@property NSString *date;
@property PFFile *orderImage;
@property NSString *orderTitle;



@end
