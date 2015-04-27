//
//  ViewController.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self viewWillAppear:YES];
    
    //BISCUITS
    self.biscuitImages = [[NSMutableArray alloc] init];
    self.biscuitImagePaths = [[NSMutableArray alloc] init];
    NSArray *biscuits = [[NSBundle mainBundle]pathsForResourcesOfType:@"jpg" inDirectory:@"Biscuits"];
    if (biscuits) {
        [self.biscuitImagePaths addObjectsFromArray:biscuits];
    }
    for(NSString *imagePath in self.biscuitImagePaths) {
        [self.biscuitImages addObject:[UIImage imageWithContentsOfFile:imagePath]];
    }
    
    //CAKEPOPS
    self.cakepopImages = [[NSMutableArray alloc] init];
    self.cakepopImagePaths = [[NSMutableArray alloc] init];
    NSArray *cakepops = [[NSBundle mainBundle]pathsForResourcesOfType:@"jpg" inDirectory:@"Cakepops"];
    if (cakepops) {
        [self.cakepopImagePaths addObjectsFromArray:cakepops];
    }
    for(NSString *imagePath in self.cakepopImagePaths) {
        [self.cakepopImages addObject:[UIImage imageWithContentsOfFile:imagePath]];
    }
    
    //CAKES
    self.cakeImages = [[NSMutableArray alloc] init];
    self.cakeImagePaths = [[NSMutableArray alloc] init];
    NSArray *cakes = [[NSBundle mainBundle]pathsForResourcesOfType:@"jpg" inDirectory:@"Cakes"];
    if (cakes) {
        [self.cakeImagePaths addObjectsFromArray:cakes];
    }
    for(NSString *imagePath in self.cakeImagePaths) {
        [self.cakeImages addObject:[UIImage imageWithContentsOfFile:imagePath]];
    }
    
    //CHOCOLATES
    self.chocolateImages = [[NSMutableArray alloc] init];
    self.chocolateImagePaths = [[NSMutableArray alloc] init];
    NSArray *chocolates = [[NSBundle mainBundle]pathsForResourcesOfType:@"jpg" inDirectory:@"Chocolate"];
    if (chocolates) {
        [self.chocolateImagePaths addObjectsFromArray:chocolates];
    }
    for(NSString *imagePath in self.chocolateImagePaths) {
        [self.chocolateImages addObject:[UIImage imageWithContentsOfFile:imagePath]];
    }
    
    //COOKIES
    self.cookieImages = [[NSMutableArray alloc] init];
    self.cookieImagePaths = [[NSMutableArray alloc] init];
    NSArray *cookies = [[NSBundle mainBundle]pathsForResourcesOfType:@"jpg" inDirectory:@"Cookies"];
    if (cookies) {
        [self.cookieImagePaths addObjectsFromArray:cookies];
    }
    for(NSString *imagePath in self.cookieImagePaths) {
        [self.cookieImages addObject:[UIImage imageWithContentsOfFile:imagePath]];
    }
    
    //CUPCAKES
    self.cupcakeImages = [[NSMutableArray alloc] init];
    self.cupcakeImagePaths = [[NSMutableArray alloc] init];
    NSArray *cupcakes = [[NSBundle mainBundle]pathsForResourcesOfType:@"jpg" inDirectory:@"Cupcakes"];
    if (cupcakes) {
        [self.cupcakeImagePaths addObjectsFromArray:cupcakes];
    }
    for(NSString *imagePath in self.cupcakeImagePaths) {
        [self.cupcakeImages addObject:[UIImage imageWithContentsOfFile:imagePath]];
    }
    
    //FLOWERS
    self.flowerImages = [[NSMutableArray alloc] init];
    self.flowerImagePaths = [[NSMutableArray alloc] init];
    NSArray *flowers = [[NSBundle mainBundle]pathsForResourcesOfType:@"jpg" inDirectory:@"Flowers"];
    if (flowers) {
        [self.flowerImagePaths addObjectsFromArray:flowers];
    }
    for(NSString *imagePath in self.flowerImagePaths) {
        [self.flowerImages addObject:[UIImage imageWithContentsOfFile:imagePath]];
    }


}

-(void)viewWillAppear:(BOOL)animated
{

    self.admin.hidden = YES;
    self.currentUserLabel.text = @"";
    self.signOutOutlet.hidden = YES;
    self.signinOutlet.hidden = NO;
    
    //Make sign in dissapear when a user is signed in
    if([User currentUser] !=NULL)
    {
        self.signOutOutlet.hidden = NO;
        self.signinOutlet.hidden = YES;
        NSString *name = [[User currentUser] username];

        self.currentUserLabel.text = [NSString stringWithFormat:@"Welcome %@", name];
        
        //Admin button shows
        if([[[User currentUser]username] isEqual:@"Sergizzle"])
        {
            self.admin.hidden = NO;
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)signOutButton:(id)sender {
    
    User *currentUser = [[User alloc]init];
    currentUser = [User currentUser];
    [PFUser logOut];

    self.signinOutlet.hidden = NO;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                    message:@"You are signed out."
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
    
    [self viewWillAppear:YES];

}

- (IBAction)SignInButton:(id)sender {
    
     [self   performSegueWithIdentifier:@"signin" sender:self];
}

- (IBAction)GalleryButton:(id)sender {
    [self   performSegueWithIdentifier:@"gallerySegue" sender:self];
}

- (IBAction)ContactButton:(id)sender {
    [self   performSegueWithIdentifier:@"contact" sender:self];
}

- (IBAction)AboutUsButton:(id)sender {
}

- (IBAction)OrdersButton:(id)sender {
    if(![User currentUser])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"You must first sign in."
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Sign In", nil];
        [alert show];
    }
    else
    {
        [self performSegueWithIdentifier:@"order" sender:self];
    }
    
}

- (IBAction)admin:(id)sender {
    [self performSegueWithIdentifier:@"Owner" sender:self];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 1) {
        [self   performSegueWithIdentifier:@"signin" sender:self];
        
    }
}

//@property NSMutableArray *biscuitImages;
//@property NSMutableArray *cakeImages;
//@property NSMutableArray *cakepopImages;
//@property NSMutableArray *chocolateImages;
//@property NSMutableArray *cookieImages;
//@property NSMutableArray *cupcakeImages;
//@property NSMutableArray *flowerImages;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"gallerySegue"]) {
        
        GalleryViewController *dest = [segue destinationViewController];
        dest.biscuitImages = self.biscuitImages;
        dest.cakeImages = self.cakeImages;
        dest.cakepopImages = self.cakepopImages;
        dest.chocolateImages = self.chocolateImages;
        dest.cookieImages = self.cookieImages;
        dest.cupcakeImages = self.cupcakeImages;
        dest.flowerImages = self.flowerImages;
        
    }
}

@end
