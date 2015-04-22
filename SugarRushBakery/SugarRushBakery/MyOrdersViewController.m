//
//  MyOrdersViewController.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/18/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "MyOrdersViewController.h"

@interface MyOrdersViewController ()

@property Order *thisOrder;


@end

@implementation MyOrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}

-(void)viewWillAppear:(BOOL)animated
{
//    User *currentUser = [User currentUser];
//    self.thisOrderArray = currentUser.ordersArray;
//    [self.myOrdersTableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.thisOrderArray count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"orderCell";
    
    MyOrdersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[MyOrdersTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
  
    Order *order = [self.thisOrderArray objectAtIndex:indexPath.row];

    
   // cell.orderTitleLabel.text = order.orderTitle;
    if(!order.verified)
    {
        cell.isVerifiedLabel.text = @"In Process";
    }
    else
    {
        cell.isVerifiedLabel.text = @"Processed";
    }
    
    
  
    cell.orderTitleLabel.text = order.descriptions;
    
    
    User *currentUser = [User currentUser];
    
    
    return cell;
}

@end