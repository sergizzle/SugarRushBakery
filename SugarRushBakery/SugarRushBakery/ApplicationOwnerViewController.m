//
//  ApplicationOwnerViewController.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "ApplicationOwnerViewController.h"

@interface ApplicationOwnerViewController ()

@end

@implementation ApplicationOwnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.manager = [[OrderManager alloc]init];
    if(!self.ordersArray) self.ordersArray = [[NSMutableArray alloc]init];

    [self.manager loadOrdersWithCompletionBlock:^(NSArray *objects) {
        
        self.ordersArray = self.manager.orderList;

    }];
 
}

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ordersSegue"])
            {
                AllOrdersViewController *dest = [segue destinationViewController];
                dest.thisOrderArray = self.ordersArray;
            }
 
}


- (IBAction)ordersButton:(id)sender {
    [self performSegueWithIdentifier:@"ordersSegue" sender:self];
}


@end
