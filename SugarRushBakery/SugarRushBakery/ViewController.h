//
//  ViewController.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import "GallerySelectionViewController.h"
#import "OrderViewController.h"

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

@property NSMutableArray *biscuitImages;
@property NSMutableArray *cakeImages;
@property NSMutableArray *cakepopImages;
@property NSMutableArray *chocolateImages;
@property NSMutableArray *cookieImages;
@property NSMutableArray *cupcakeImages;
@property NSMutableArray *flowerImages;

@property NSMutableArray *biscuitImagePaths;
@property NSMutableArray *cakeImagePaths;
@property NSMutableArray *cakepopImagePaths;
@property NSMutableArray *chocolateImagePaths;
@property NSMutableArray *cookieImagePaths;
@property NSMutableArray *cupcakeImagePaths;
@property NSMutableArray *flowerImagePaths;

@end

