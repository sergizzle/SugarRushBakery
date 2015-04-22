//
//  CustomOrderViewController.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "CustomOrderViewController.h"



@interface CustomOrderViewController ()

@property OrderManager *manager;

@end


@implementation CustomOrderViewController



- (void)viewDidLoad {
    [super viewDidLoad];
     self.manager = [[OrderManager alloc] init];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)selectImage:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    

    
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}




- (IBAction)submitOrder:(id)sender {
    
    
    if(!self.imageView.image)
    {
        UIAlertView *noImage = [[UIAlertView alloc] initWithTitle:@"Error"
                                                          message:@"Please select an image."
                                                         delegate:self
                                                cancelButtonTitle:@"Ok"
                                                otherButtonTitles:nil];
        [noImage show];
    }
    
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirm"
                                                    message:@"Are you sure you want to place your order?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Ok", nil];
    [alert show];
    }
    
    
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 1) {
        
        
        
        NSString *tempString = self.descriptionField.text;
        NSString *ordertitle = self.orderTitle.text;
        
        
        //Get the date of the transaction
        NSString *currentDate;
        NSDate *currentTime = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"hh:mm   dd/MM/yyyy"];
        currentDate = [dateFormatter stringFromDate:currentTime];
        
        NSData *imageData = UIImagePNGRepresentation(self.imageView.image);
        PFFile *orderImage =[PFFile fileWithName:@"OrderImage" data:imageData];
        
        
        
        
        
        [self.manager addOrderswithDate:currentDate andDescription:tempString andVerified:NO andPrice:0 andImage:orderImage andOrderType:0 andOrderTitle:ordertitle];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        UIAlertView *confirmed = [[UIAlertView alloc] initWithTitle:@"Congratulations"
                                                        message:@"Your order has been placed."
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [confirmed show];


    }
}
@end
