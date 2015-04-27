//
//  AdminOrderViewController.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/26/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllOrdersViewController.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface AdminOrderViewController : UIViewController <UITextFieldDelegate, MFMailComposeViewControllerDelegate>

@property NSInteger number1;
@property Order *finalOrder;
@property NSMutableArray *editedOrder;

@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UIImageView *orderPicture;
- (IBAction)emailButton:(id)sender;

- (IBAction)deleteOrderButton:(id)sender;

- (IBAction)saveButton:(id)sender;

- (IBAction)verifyOrderButton:(id)sender;

@property (strong, nonatomic) IBOutlet UITextView *detailsTextView;

- (IBAction)setPriceButton:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *verified;

@property (strong, nonatomic) IBOutlet UITextField *enterPriceTextField;

@end
