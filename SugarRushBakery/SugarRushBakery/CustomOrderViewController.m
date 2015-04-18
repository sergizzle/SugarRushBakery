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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



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
    
//    NSData *imageData = UIImagePNGRepresentation(chosenImage);
//    PFFile *userImage =[PFFile fileWithName:@"ProfileImage" data:imageData];
//    
//    [userImage saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (!error) {
//            if(succeeded) {
//                PFUser *user = [PFUser currentUser];
//                user[@"ProfileImage"] = userImage;
//                [user saveInBackground];
//            }
//        } else {
//            NSLog(@"Image upload failed.");
//        }
//    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

-(void) updateImage{
    PFUser *user = [PFUser currentUser];
    PFFile *file = user[@"ProfileImage"];
    
    [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if(!error) {
            UIImage *image = [UIImage imageWithData:data];
            self.imageView.image = image;
        }
    }];
}


- (IBAction)submitOrder:(id)sender {
    
    NSLog(@"Test submit");
    
    Order *temp = [[Order alloc]init];
    
    NSString *tempString = self.descriptionField.text;
    
    
#pragma mark FIX
    //HERE
    //SHIT WENT DOWN- NEEDS FIXING
    temp.description = @"Hi";
    
    NSDate *currentTime = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm   dd/MM/yyyy"];
    temp.date = [dateFormatter stringFromDate:currentTime];
    
    [self.manager addOrderswithDate:temp.date andDescription:temp.description andVerified:NO andPrice:0];
    
//    User *currentUser = [[User alloc]init];
//    currentUser = [User currentUser];
//    
//    if(!currentUser.ordersArray)
//    {
//        currentUser.ordersArray = [ NSMutableArray new];
//    }
//    
//    [currentUser.ordersArray addObject:temp];
//    //save the object to Parse
//    [currentUser saveInBackground];
    
    
   
    
//    [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (!error) {
//            [[NSNotificationCenter defaultCenter]
//             postNotificationName:@"ParseSaveComplete"
//             object:self];
//        } else {NSLog(@"fail submit");
//            
//        }
//    }];

    
   
}
@end
