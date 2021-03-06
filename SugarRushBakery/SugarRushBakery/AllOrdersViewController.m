//
//  AllOrdersViewController.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/22/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "AllOrdersViewController.h"

@interface AllOrdersViewController ()

@end

@implementation AllOrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.ordersTable reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.thisOrderArray count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"orderCell";
    
    AllOrdersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[AllOrdersTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    
    Order *order = [self.thisOrderArray objectAtIndex:indexPath.row];
    
    //For some reason, needed this before
   // [order fetchIfNeeded];
    PFFile *file = order.orderImage;
    

    

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a  MM/dd/yyyy"];
    
    cell.dateLabel.text = [dateFormatter stringFromDate:order.dueDate];
    
    [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if(!error) {
            UIImage *image = [UIImage imageWithData:data];
            cell.orderPic.image = image;
        }
    }];
    
    
    
    cell.usernameLabel.text = order.userName;
    
    
    return cell;
}



#pragma mark segue stuff


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.thisOrder = [self.thisOrderArray objectAtIndex:indexPath.row];
    self.number = indexPath.row;
    [self performSegueWithIdentifier:@"cellSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"cellSegue"]) {
        
        AdminOrderViewController *dest = [segue destinationViewController];
        dest.finalOrder = self.thisOrder;
        dest.number1 = self.number;
        dest.editedOrder = self.thisOrderArray;
        
    }
}





@end
