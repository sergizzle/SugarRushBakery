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


-(void)addOrderswithDate:(NSString *)date andDescription:(NSString *)description andVerified:(BOOL)verified andPrice:(double)price
{
    Order *toAdd = [Order object];
    toAdd.date = date;
    toAdd.description = description;
    toAdd.price = price;
    toAdd.verified = verified;
    
    
    //save the object to Parse
    [toAdd saveInBackground];
    
    //add it to the local list
    [self.orderList addObject:toAdd];
}

//-(void)addOrderswithDate:(NSString *)date andDescription:(NSString *)description andVerified:(BOOL)verified
//{
//    Order *toAdd = [Order object];
//    toAdd.date = date;
//    toAdd.description = description;
//    //toAdd.price = price;
//    toAdd.verified = verified;
//
//
//    //save the object to Parse
//    [toAdd saveInBackground];
//
//    //add it to the local list
//    [self.orderList addObject:toAdd];
//}

@end
