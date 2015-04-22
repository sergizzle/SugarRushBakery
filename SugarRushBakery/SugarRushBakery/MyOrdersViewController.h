//
//  MyOrdersViewController.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/18/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "MyOrdersTableViewCell.h"
#import "Order.h"
#import "OrderManager.h"
#import "OrderViewController.h"

@interface MyOrdersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *myOrdersTableView;

@property NSArray *thisOrderArray;
@end
