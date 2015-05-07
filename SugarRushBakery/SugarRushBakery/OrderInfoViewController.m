//
//  OrderInfoViewController.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/22/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "OrderInfoViewController.h"

@interface OrderInfoViewController ()
    @property (nonatomic, strong, readwrite) PayPalConfiguration *payPalConfiguration;
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Start out working with the test environment! When you are ready, switch to PayPalEnvironmentProduction.
    [PayPalMobile preconnectWithEnvironment:PayPalEnvironmentNoNetwork];
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
    // Create a PayPalPayment
    PayPalPayment *payment = [[PayPalPayment alloc] init];
    
    
    NSDecimalNumber *numba = (NSDecimalNumber *) [NSDecimalNumber numberWithDouble:self.finalOrder.price];
    
    // Amount, currency, and description
    payment.amount = numba;//[[NSDecimalNumber alloc] initWithString:@"39.95"];
    payment.currencyCode = @"USD";
    payment.shortDescription = self.finalOrder.orderTitle;//@"Awesome saws";
    
    // Use the intent property to indicate that this is a "sale" payment,
    // meaning combined Authorization + Capture.
    // To perform Authorization only, and defer Capture to your server,
    // use PayPalPaymentIntentAuthorize.
    // To place an Order, and defer both Authorization and Capture to
    // your server, use PayPalPaymentIntentOrder.
    // (PayPalPaymentIntentOrder is valid only for PayPal payments, not credit card payments.)
    payment.intent = PayPalPaymentIntentSale;
    
    // If your app collects Shipping Address information from the customer,
    // or already stores that information on your server, you may provide it here.
//    payment.shippingAddress = address; // a previously-created PayPalShippingAddress object
    
    // Several other optional fields that you can set here are documented in PayPalPayment.h,
    // including paymentDetails, items, invoiceNumber, custom, softDescriptor, etc.
    
    // Check whether payment is processable.
    if (!payment.processable) {
        // If, for example, the amount was negative or the shortDescription was empty, then
        // this payment would not be processable. You would want to handle that here.
    }
    
    PayPalPaymentViewController *paymentViewController;
    paymentViewController = [[PayPalPaymentViewController alloc] initWithPayment:payment
                                                                   configuration:self.payPalConfiguration
                                                                        delegate:self];
    
    // Present the PayPalPaymentViewController.
    [self presentViewController:paymentViewController animated:YES completion:nil];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _payPalConfiguration = [[PayPalConfiguration alloc] init];
        
        // See PayPalConfiguration.h for details and default values.
        // Should you wish to change any of the values, you can do so here.
        // For example, if you wish to accept PayPal but not payment card payments, then add:
        _payPalConfiguration.acceptCreditCards = NO;
        // Or if you wish to have the user choose a Shipping Address from those already
        // associated with the user's PayPal account, then add:
        _payPalConfiguration.payPalShippingAddressOption = PayPalShippingAddressOptionPayPal;
    }
    return self;
}

- (void)payPalPaymentViewController:(PayPalPaymentViewController *)paymentViewController
                 didCompletePayment:(PayPalPayment *)completedPayment {
    // Payment was processed successfully; send to server for verification and fulfillment.
    [self verifyCompletedPayment:completedPayment];
    
    // Dismiss the PayPalPaymentViewController.
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)payPalPaymentDidCancel:(PayPalPaymentViewController *)paymentViewController {
    // The payment was canceled; dismiss the PayPalPaymentViewController.
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)verifyCompletedPayment:(PayPalPayment *)completedPayment {
    // Send the entire confirmation dictionary
    NSData *confirmation = [NSJSONSerialization dataWithJSONObject:completedPayment.confirmation
                                                           options:0
                                                             error:nil];
    
    // Send confirmation to your server; your server should verify the proof of payment
    // and give the user their goods or services. If the server is not reachable, save
    // the confirmation and try again later.
}

@end
