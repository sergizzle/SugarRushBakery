//
//  OrderManager.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "OrderManager.h"

@implementation OrderManager


- (NSMutableArray *)orderList {
    if(!_orderList) _orderList = [NSMutableArray new];
    
    return _orderList;
}

- (instancetype) init {
    self = [super init];
    
    if(self){
        
    }
    
    return self;
}

-(void)loadOrdersWithCompletionBlock:(void (^)(NSArray *objects))callbackBlock {
    PFQuery *threadListQuery = [Order query];
    
    [threadListQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (objects.count > 0 && !error) {
            
            _orderList = [objects mutableCopy];
            //load the contents asynchronously
            callbackBlock(self.orderList);
        }
    }];
}


-(void)addOrderswithDate:(NSDate *)date andDescription:(NSString *)descriptions andVerified:(BOOL)verified andPrice:(double)price andImage:(PFFile*)orderImage andOrderType:(orderType) orderType andOrderTitle:(NSString *)orderTitle
{
    Order *toAdd = [Order object];
    toAdd.dueDate = date;
    toAdd.descriptions = descriptions;
    toAdd.price = price;
    toAdd.verified = verified;
    toAdd.orderImage = orderImage;
    toAdd.OrderType = orderType;
    toAdd.orderTitle = orderTitle;

    PFUser *currentUser = [PFUser currentUser];
    toAdd.userID = currentUser.objectId;
    toAdd.userName = currentUser.username;
    toAdd.email = currentUser.email;

    
    //save the object to Parse
    [toAdd saveInBackground];
    
    
    //add it to the local list
    [self.orderList addObject:toAdd];
    
    UIAlertView *confirmed = [[UIAlertView alloc] initWithTitle:@"Congratulations"
                                                        message:@"Your order has been placed."
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [confirmed show];
}



@end
