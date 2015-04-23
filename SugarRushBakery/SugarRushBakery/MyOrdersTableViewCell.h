//
//  MyOrdersTableViewCell.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/18/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrdersTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *orderTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *isVerifiedLabel;

@property (strong, nonatomic) IBOutlet UIImageView *orderPicture;

@end
