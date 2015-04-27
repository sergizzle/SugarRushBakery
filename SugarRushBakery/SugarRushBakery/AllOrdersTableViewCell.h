//
//  AllOrdersTableViewCell.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/22/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllOrdersTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *orderPic;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@end
