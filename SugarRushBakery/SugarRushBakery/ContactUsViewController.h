//
//  ContactUsViewController.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h> 
#import <MessageUI/MFMailComposeViewController.h>



@interface ContactUsViewController : UIViewController <MFMailComposeViewControllerDelegate> 
- (IBAction)email:(id)sender;

@end
