//
//  OrderInfoViewController.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/22/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "OrderInfoViewController.h"

@interface OrderInfoViewController ()

@end

@implementation OrderInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(!self.finalOrder.verified)
    {
        self.payNow.hidden = YES;
    }
    
    //Get the order Image
    PFFile *file = self.finalOrder.orderImage;
    [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if(!error) {
            UIImage *image = [UIImage imageWithData:data];
            self.orderImage.image = image;
        }
    }];
    
    self.titleLabel.text = self.finalOrder.orderTitle;
    self.orderDescription.text = self.finalOrder.descriptions;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)cancelOrderButton:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                    message:@"Are you sure you want to delete your order?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Ok", nil];
    [alert show];
    
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 1) {
        
        
#pragma mark- used this for deleting users order array
//        User *thisUser = [User currentUser];
//        [thisUser.ordersArray removeObjectAtIndex:_number1];
//        
//        
//        //Delete order from user order array
//        [thisUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            if (!error) {
//                [[NSNotificationCenter defaultCenter]
//                 postNotificationName:@"ParseSaveComplete"
//                 object:self];
//            } else {
//                
//            }
//        }];
        
        //Delete the object from Order Class
        PFQuery *query = [PFQuery queryWithClassName:@"Order"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *orders, NSError *error) {
            if (!error)
            {
                for (PFObject *order in orders)
                {
                    if ([order.objectId isEqual:self.finalOrder.objectId])
                    {

                        [order deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                            if (succeeded){
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                message:@"Order has been cancelled."
                                                                               delegate:self
                                                                      cancelButtonTitle:@"Ok"
                                                                      otherButtonTitles:nil];
                                
                                [alert show];
                                
                                //delete from local array
                                [self.finalOrderArray removeObjectAtIndex:self.number1];
                                [[self navigationController] popViewControllerAnimated:YES];
                            } else {
                                UIAlertView *wrong = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                message:@"Order was not cancelled correctly."
                                                                               delegate:self
                                                                      cancelButtonTitle:@"Ok"
                                                                      otherButtonTitles:nil];
                                [wrong show];
                                [[self navigationController] popViewControllerAnimated:YES]; 
                            }
                        }];
                    }
                }
            }
            else
            {
                NSLog(@"%@",error);
            }
            
        }];
        
        
        
        
    }
    
}

- (IBAction)payNow:(id)sender {
}



@end
