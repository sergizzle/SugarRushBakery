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

@end
