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
    
    
    [order fetchIfNeeded];
    PFFile *file = order.orderImage;
    
  
    
//    //Find the user that placed the order
//    PFQuery *query = [PFQuery queryWithClassName:@"User"];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *users, NSError *error) {
//        if (!error)
//        {
//            for (User *user in users)
//            {
//                if ([user.objectId isEqual:order.objectId])
//                {
//                    cell.orderTitleLabel.text = user.username;
//                }
//            }
//        }
//        else
//        {
//            NSLog(@"%@",error);
//        }
//        
//    }];
    

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a  MM/dd/yyyy"];
    
    cell.orderTitleLabel.text = [dateFormatter stringFromDate:order.dueDate];
    
    [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if(!error) {
            UIImage *image = [UIImage imageWithData:data];
            cell.orderPicture.image = image;
        }
    }];
    
    
   
    
//    if(!order.verified)
//    {
//        cell.isVerifiedLabel.text = @"In Process";
//    }
//    else
//    {
//        cell.isVerifiedLabel.text = @"Processed";
//    }
    
    cell.isVerifiedLabel.text = order.userName;
    
    
    return cell;
}



#pragma mark segue stuff


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    self.myOrder = [self.thisOrderArray objectAtIndex:indexPath.row];
//    self.number = indexPath.row;
//    [self performSegueWithIdentifier:@"cellSegue" sender:self];
//}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    if ([[segue identifier] isEqualToString:@"cellSegue"]) {
//        
//        OrderInfoViewController *dest = [segue destinationViewController];
//        dest.finalOrder = self.myOrder;
//        dest.number1 = self.number;
//        
//    }
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
