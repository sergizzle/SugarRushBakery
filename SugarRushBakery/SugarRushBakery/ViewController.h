//
//  ViewController.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import "User.h"

@interface ViewController : UIViewController

//Outlets
@property (strong, nonatomic) IBOutlet UIButton *signinOutlet;
@property (strong, nonatomic) IBOutlet UIButton *signOutOutlet;
@property (strong, nonatomic) IBOutlet UIButton *admin;

//Labels

@property (strong, nonatomic) IBOutlet UILabel *currentUserLabel;

//Buttons
- (IBAction)signOutButton:(id)sender;
- (IBAction)SignInButton:(id)sender;
- (IBAction)GalleryButton:(id)sender;
- (IBAction)ContactButton:(id)sender;
- (IBAction)AboutUsButton:(id)sender;
- (IBAction)OrdersButton:(id)sender;
- (IBAction)admin:(id)sender;

@end

