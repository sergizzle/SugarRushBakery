//
//  User.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "User.h"

@implementation User

@dynamic firstName;
@dynamic lastName;

+ (void)load {
    [self registerSubclass];
}

+ (User *)user {
    return (User *)[PFUser user];
}

+ (User *)currentUser {
    return (User *)[PFUser currentUser];
}

@end
