//
//  Order.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <Parse/Parse.h>

@interface Order : PFObject <PFSubclassing>


@property NSString *descriptions;
@property BOOL verified;
@property double price;
@property NSDate *dueDate;
@property PFFile *orderImage;
@property NSString *orderTitle;
@property NSString *userID;
@property NSString *userName;
@property NSString *email;
@property BOOL paidFor;
@property BOOL orderComplete;

@end
