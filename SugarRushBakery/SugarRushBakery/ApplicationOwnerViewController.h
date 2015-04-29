//
//  ApplicationOwnerViewController.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import "OrderManager.h"
#import "AllOrdersViewController.h"


@interface ApplicationOwnerViewController : UIViewController

@property OrderManager *manager;
@property NSMutableArray *ordersArray;

- (IBAction)ordersButton:(id)sender;

@end
