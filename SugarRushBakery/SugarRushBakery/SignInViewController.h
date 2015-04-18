//
//  SignInViewController.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "User.h"
#import <UIKit/UIKit.h>

@interface SignInViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *usernameField;

@property (strong, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)login:(id)sender;


- (IBAction)signup:(id)sender;

@end

