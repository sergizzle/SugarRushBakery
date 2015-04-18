//
//  SignUpViewController.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "User.h"
#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signUp:(id)sender {
    NSString *firstName = [self.firstNameField.text stringByTrimmingCharactersInSet:
                           [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *lastName = [self.lastNameField.text stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [self.emailAddressField.text stringByTrimmingCharactersInSet:
                       [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *confirmPassword = [self.confirmPasswordField.text stringByTrimmingCharactersInSet:
                                 [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] == 0 || [password length] == 0 || [email length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Missing Field!"
                                                            message:@"Make sure you enter a username, password, and email address!"
                                                           delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    } else if (![password isEqual:confirmPassword]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Passwords Do Not Match!"
                                                            message:@"Plese reenter your password!"
                                                           delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    } else {
        User *newUser = [User user];
        newUser.firstName = firstName;
        newUser.lastName = lastName;
        newUser.username = username;
        newUser.email = email;
        newUser.password = password;
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error) {
                //                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!"]
                //                                                    message:[error.userInfo objectForKey:@"error"]
                //                                                    delegate:nil
                //                                                    cancelButtonTitle:@"OK"
                //                                                    otherButtonTitles:nil];
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                                    message:[error.userInfo objectForKey:@"error"]
                                                                   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            } else {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
    }

}
@end
