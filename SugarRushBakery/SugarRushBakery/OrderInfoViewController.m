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
        User *thisUser = [User currentUser];
        [thisUser.ordersArray removeObjectAtIndex:_number1];
        
        
        //Delete order from user order array
        [thisUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                [[NSNotificationCenter defaultCenter]
                 postNotificationName:@"ParseSaveComplete"
                 object:self];
            } else {
                
            }
        }];
        
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
                                NSLog(@"BOOOOOM"); 
                            } else {
                                NSLog(@"DELETE ERRIR");
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
        
        
            [[self navigationController] popViewControllerAnimated:YES]; 
        
    }
    
}

- (IBAction)payNow:(id)sender {
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
