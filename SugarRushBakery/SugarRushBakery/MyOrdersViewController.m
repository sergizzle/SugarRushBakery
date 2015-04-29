//
//  MyOrdersViewController.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/18/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "MyOrdersViewController.h"

@interface MyOrdersViewController ()




@end

@implementation MyOrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}


-(void)viewWillAppear:(BOOL)animated
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.myOrdersTableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


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
   
   // dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //[order fetchIfNeeded];
        
        
        PFFile *file = order.orderImage;
        
        
        
        [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if(!error) {
                UIImage *image = [UIImage imageWithData:data];
                cell.orderPicture.image = image;
            }
        }];
        
        
        cell.orderTitleLabel.text = order.orderTitle;
        
        if(!order.verified)
        {
            cell.isVerifiedLabel.text = @"In Process";
        }
        else
        {
            cell.isVerifiedLabel.text = @"Processed";
        }
        
        [cell setNeedsDisplay];
 //   });
    

    
    return cell;
}



#pragma mark segue stuff


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.myOrder = [self.thisOrderArray objectAtIndex:indexPath.row];
    self.number = indexPath.row;
    [self performSegueWithIdentifier:@"cellSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"cellSegue"]) {
        
        OrderInfoViewController *dest = [segue destinationViewController];
        dest.finalOrder = self.myOrder;
        dest.finalOrderArray = self.thisOrderArray;
        dest.number1 = self.number;
     
    }
}

@end
