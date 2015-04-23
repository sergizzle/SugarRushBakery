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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelOrderButton:(id)sender {
}

- (IBAction)payNow:(id)sender {
}
@end
