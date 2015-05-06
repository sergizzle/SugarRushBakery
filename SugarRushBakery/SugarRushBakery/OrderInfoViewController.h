//
//  OrderInfoViewController.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/22/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "ViewController.h"
#import "MyOrdersViewController.h"

@interface OrderInfoViewController : UIViewController

@property Order *finalOrder;
@property NSInteger number1;
@property NSMutableArray *finalOrderArray;


@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UIButton *cancelOrderButton;

@property (strong, nonatomic) IBOutlet UIButton *payNow;

@property (strong, nonatomic) IBOutlet UIImageView *orderImage;
@property (strong, nonatomic) IBOutlet UITextView *orderDescription;


- (IBAction)cancelOrderButton:(id)sender;

- (IBAction)payNow:(id)sender;

@end
