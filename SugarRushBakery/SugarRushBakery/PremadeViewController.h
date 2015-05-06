//
//  PremadeViewController.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/27/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomOrderViewController.h"

@interface PremadeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,retain)UIImage *image;
- (IBAction)orderButton:(id)sender;

@end
