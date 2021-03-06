//
//  PremadeViewController.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/27/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "PremadeViewController.h"

@interface PremadeViewController ()


@end

@implementation PremadeViewController
@synthesize image;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(self.image) {
        [self.imageView setImage: self.image];
    }
    //[self.imageView reloadInputViews];
    
    //_imageView = [[UIImageView alloc]initWithImage:image];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) viewWillAppear:(BOOL)animated {
    if(self.image != nil) {
        [self.imageView setImage: self.image];
    }
    //[self.imageView reloadInputViews];
}


- (IBAction)orderButton:(id)sender {
    [self performSegueWithIdentifier:@"premadeToCustom" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"premadeToCustom"]) {
        CustomOrderViewController *dest = [segue destinationViewController];
        
        dest.image = self.image;
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
