//
//  OrderManager.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Order.h"


@interface OrderManager : NSObject

@property (nonatomic) NSMutableArray *orderList;

-(void)loadOrdersWithCompletionBlock:(void (^)(NSArray *objects))callbackBlock;

-(void)addOrderswithDate:(NSString *)date andDescription:(NSString *)descriptions andVerified:(BOOL)verified andPrice:(double)price andImage:(PFFile*)orderImage andOrderType:(orderType)orderType andOrderTitle:(NSString *)orderTitle;


@end
