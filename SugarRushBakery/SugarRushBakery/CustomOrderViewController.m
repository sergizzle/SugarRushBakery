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
    self.descriptionField.delegate = self;
    self.orderTitle.delegate = self;
  
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - These methods are to hide keyboard and show it
- (BOOL)textViewShouldReturn:(UITextView *)textView {
    [textView resignFirstResponder];
    return NO;
}

//Hide keyboard by touching background
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}



//Declare a delegate, assign your textField to the delegate and then include these methods   :textfield

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [self.view endEditing:YES];
    return YES;
}

//Declare a delegate, assign your textField to the delegate and then include these methods :textview

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    return YES;
}


- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [self.view endEditing:YES];
    return YES;
}


- (void)keyboardDidShow:(NSNotification *)notification
{
    // Assign new frame to your view
    [self.view setFrame:CGRectMake(0,-110,320,460)]; //here taken -20 for example i.e. your view will be scrolled to -20. change its value according to your requirement.
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(0,0,320,460)];
}

-(void)Orderplaced
{
    UIAlertView *confirmed = [[UIAlertView alloc] initWithTitle:@"Congratulations"
                                                        message:@"Your order has been placed."
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    confirmed.tag = 1;
    
    
    [confirmed show];
    
    
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
        
        
        NSDate *pickerDate = self.dueDate.date;
        
        NSData *imageData = UIImagePNGRepresentation(self.imageView.image);
        PFFile *orderImage =[PFFile fileWithName:@"OrderImage" data:imageData];
        
        
        
        
        
        [self.manager addOrderswithDate:pickerDate andDescription:tempString andVerified:NO andPrice:0 andImage:orderImage andOrderType:0 andOrderTitle:ordertitle];
  
        [self Orderplaced];

    }
    
    if(alertView.tag == 1)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
