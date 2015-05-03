//
//  OrderViewController.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()

@property NSMutableArray *tempArray;

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [[OrderManager alloc]init];
    if(!self.myOrdersArray) self.myOrdersArray = [[NSMutableArray alloc]init];
    
    //Load the orders that belong to the current user
    PFUser *thisUser = [PFUser currentUser];
    PFQuery *query1 = [Order query];
     [query1 whereKey:@"userName" equalTo:thisUser.username];
    
    [query1 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                if (!error) {
                    
                    for (PFObject *object in objects) {
                        [self.myOrdersArray addObject:object];
                    }

                    
                } else {
                    // Log details of the failure
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];    
}


-(void)viewWillAppear:(BOOL)animated
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   // Link the object from 1st to 2nd controller
    if ([[segue identifier] isEqualToString:@"myOrder"])
    {
        MyOrdersViewController *dest = [segue destinationViewController];
        dest.thisOrderArray = self.myOrdersArray;
    } else if ([[segue identifier] isEqualToString:@"orderToGallery"]) {
        GalleryViewController *dest = [segue destinationViewController];
        dest.biscuitImages = self.biscuitImages;
        dest.cakeImages = self.cakeImages;
        dest.cakepopImages = self.cakepopImages;
        dest.chocolateImages = self.chocolateImages;
        dest.cookieImages = self.cookieImages;
        dest.cupcakeImages = self.cupcakeImages;
        dest.flowerImages = self.flowerImages;
    }
}


- (IBAction)premadeButton:(id)sender {
    [self performSegueWithIdentifier:@"orderToGallery" sender:self];
}

- (IBAction)customButton:(id)sender {
    [self performSegueWithIdentifier:@"customOrder" sender:self];
}

- (IBAction)MyOrdersButton:(id)sender {
    [self performSegueWithIdentifier:@"myOrder" sender:self];
}

@end
