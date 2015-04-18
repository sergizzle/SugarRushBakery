//
//  SignUpViewController.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <Parse/Parse.h>
#import <UIKit/UIKit.h>



//Text fields
@interface SignUpViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *firstNameField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameField;
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *emailAddressField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordField;

//Button
- (IBAction)signUp:(id)sender;

@end
