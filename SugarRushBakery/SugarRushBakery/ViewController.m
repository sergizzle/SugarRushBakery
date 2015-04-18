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
    [self viewWillAppear:YES];

}

- (IBAction)SignInButton:(id)sender {
    
     [self   performSegueWithIdentifier:@"signin" sender:self];
}

- (IBAction)GalleryButton:(id)sender {
}

- (IBAction)ContactButton:(id)sender {
}

- (IBAction)AboutUsButton:(id)sender {
}

- (IBAction)OrdersButton:(id)sender {
}
@end
