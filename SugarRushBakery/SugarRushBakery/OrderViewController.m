//
//  OrderViewController.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()

@property OrderManager *manager;


@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.manager = [[OrderManager alloc]init];
    if(!self.myOrdersArray) self.myOrdersArray = [[NSArray alloc]init];
    
    //Load orders from parse
    [self.manager loadOrdersWithCompletionBlock:^(NSArray *objects) {
        
        self.myOrdersArray = self.manager.orderList;
        User *currentUser = [User currentUser];
        
//        for(id order in self.myOrdersArray)
//        {
//            if([currentUser.username isEqual:(Order*)order).customer]);
//            {
//                [self.myOrdersArray addObject:order];
//            }
//        }
        
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //Link the object from 1st to 2nd controller
    if ([[segue identifier] isEqualToString:@"myOrder"])
    {
        MyOrdersViewController *dest = [segue destinationViewController];
        dest.thisOrderArray = self.myOrdersArray;
    }
}


- (IBAction)premadeButton:(id)sender {
}

- (IBAction)customButton:(id)sender {
    [self performSegueWithIdentifier:@"customOrder" sender:self];
}

- (IBAction)MyOrdersButton:(id)sender {
    [self performSegueWithIdentifier:@"myOrder" sender:self];
}
@end
