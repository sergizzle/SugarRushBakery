//
//  OrderViewController.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "MyOrdersTableViewCell.h"
#import "Order.h"
#import "OrderManager.h"
#import "MyOrdersViewController.h"


@interface OrderViewController : UIViewController

@property NSArray *myOrdersArray;

- (IBAction)premadeButton:(id)sender;
- (IBAction)customButton:(id)sender;
- (IBAction)MyOrdersButton:(id)sender;

@end
