//
//  AdminOrderViewController.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/26/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "AdminOrderViewController.h"

@interface AdminOrderViewController ()

@end

@implementation AdminOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.priceLabel.text = [NSString stringWithFormat:@"%.2f", self.finalOrder.price];
    if(!self.finalOrder.verified)
    {
         self.verified.text = @"No";
    }
    else{
        self.verified.text = @"Yes";
    }
   
 

   
    
    PFFile *file = self.finalOrder.orderImage;
    [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if(!error) {
            UIImage *image = [UIImage imageWithData:data];
            self.orderPicture.image = image;
        }
    }];

    self.detailsTextView.text = self.finalOrder.descriptions;
    
    
    
   
    self.enterPriceTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Set the price to enter money field only
- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    static NSString *numbers = @"0123456789";
    static NSString *numbersPeriod = @"01234567890.";
    static NSString *numbersComma = @"0123456789,";
    
    //NSLog(@"%d %d %@", range.location, range.length, string);
    if (range.length > 0 && [string length] == 0) {
        // enable delete
        return YES;
    }
    
    NSString *symbol = [[NSLocale currentLocale] objectForKey:NSLocaleDecimalSeparator];
    if (range.location == 0 && [string isEqualToString:symbol]) {
        // decimalseparator should not be first
        return NO;
    }
    NSCharacterSet *characterSet;
    NSRange separatorRange = [textField.text rangeOfString:symbol];
    if (separatorRange.location == NSNotFound) {
        if ([symbol isEqualToString:@"."]) {
            characterSet = [[NSCharacterSet characterSetWithCharactersInString:numbersPeriod] invertedSet];
        }
        else {
            characterSet = [[NSCharacterSet characterSetWithCharactersInString:numbersComma] invertedSet];
        }
    }
    else {
        // allow 2 characters after the decimal separator
        if (range.location > (separatorRange.location + 2)) {
            return NO;
        }
        characterSet = [[NSCharacterSet characterSetWithCharactersInString:numbers] invertedSet];
    }
    return ([[string stringByTrimmingCharactersInSet:characterSet] length] > 0);
}



- (IBAction)emailButton:(id)sender {
        
        // Email Subject
        NSString *emailTitle = @"";
        // Email Content
        NSString *messageBody = @"";
        // To address
        NSArray *toRecipents = [NSArray arrayWithObject:self.finalOrder.email];
        
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:NO];
        [mc setToRecipients:toRecipents];
        
        // Present mail view controller on screen
        [self presentViewController:mc animated:YES completion:NULL];
        
    }



    
    - (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
    {
        switch (result)
        {
            case MFMailComposeResultCancelled:
                NSLog(@"Mail cancelled");
                break;
            case MFMailComposeResultSaved:
                NSLog(@"Mail saved");
                break;
            case MFMailComposeResultSent:
                NSLog(@"Mail sent");
                break;
            case MFMailComposeResultFailed:
                NSLog(@"Mail sent failure: %@", [error localizedDescription]);
                break;
            default:
                break;
        }
        
        // Close the Mail Interface
        [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)verifyOrderButton:(id)sender {
    if(!self.finalOrder.verified)
    {
        self.finalOrder.verified = YES;
        self.verified.text = @"Yes";
    }
    else{
        self.finalOrder.verified = NO;
        self.verified.text = @"No";
    }
   
    
}
- (IBAction)setPriceButton:(id)sender {
    self.finalOrder.price = self.enterPriceTextField.text.doubleValue;
    self.priceLabel.text = [NSString stringWithFormat:@"%.2f", self.finalOrder.price];

}

- (IBAction)deleteOrderButton:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"Order"];
    [query getObjectInBackgroundWithId:self.finalOrder.objectId block:^(PFObject *order, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
      [order deleteInBackground];
        
    }];
    
    //Delete from segue array
    [self.editedOrder removeObjectAtIndex:_number1];
    
    //Get the user with the order
    PFQuery *query1 = [User query];
    [query1 whereKey:@"username" equalTo:self.finalOrder.userName];
    NSArray *user = [query1 findObjects];
    User *thisUser = [user objectAtIndex:0];


    //XCODE, WHY DO I NEED TO DO THIS? Works with temparray
    NSArray *tempArray = [thisUser.ordersArray copy];
     int count = 0;
    
    for(Order *object in tempArray)
    {
       
        if(self.finalOrder.objectId == object.objectId)
        {
            [thisUser.ordersArray removeObjectAtIndex:count];
        }
        count++;
    }
    

    [thisUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [[NSNotificationCenter defaultCenter]
             postNotificationName:@"ParseSaveComplete"
             object:self];
        } else {
            
        }
    }];
    
    

    
     [[self navigationController] popViewControllerAnimated:YES];
    
}

- (IBAction)saveButton:(id)sender {
    
    PFQuery *query = [PFQuery queryWithClassName:@"Order"];
    [query getObjectInBackgroundWithId:self.finalOrder.objectId block:^(PFObject *order, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
      
        if(self.finalOrder.verified)
        {
            order[@"verified"] = @YES;
        }
        else{
            order[@"verified"]= @NO;
        }
        
        NSNumber *aNumber = [NSNumber numberWithDouble:self.finalOrder.price];

        order[@"Price"] = aNumber;
        [order saveInBackground];
        
    }];
    
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }



@end
