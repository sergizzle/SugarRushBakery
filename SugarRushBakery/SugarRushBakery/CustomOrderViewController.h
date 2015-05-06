//
//  CustomOrderViewController.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/17/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "OrderManager.h"




@interface CustomOrderViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIAlertViewDelegate, UITextViewDelegate, UITextFieldDelegate>

- (IBAction)selectImage:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UITextView *descriptionField;

- (IBAction)submitOrder:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *orderTitle;

@property (strong, nonatomic) IBOutlet UIDatePicker *dueDate;

@property (strong, nonatomic) UIImage *image;

@property (strong, nonatomic) IBOutlet UIButton *selectImage;
@end
