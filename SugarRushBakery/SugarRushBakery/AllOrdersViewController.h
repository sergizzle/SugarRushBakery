//
//  AllOrdersViewController.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/22/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "ViewController.h"
#import "ApplicationOwnerViewController.h"
#import "AllOrdersTableViewCell.h"
#import "AdminOrderViewController.h"

@interface AllOrdersViewController : ViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *ordersTable;
@property NSMutableArray *thisOrderArray;

@property OrderManager *manager;
@property Order *thisOrder;
@property NSInteger number;



@end
