//
//  MyOrdersTableViewCell.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/18/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "MyOrdersTableViewCell.h"

@implementation MyOrdersTableViewCell


@synthesize orderTitleLabel = _orderTitleLabel;
@synthesize isVerifiedLabel = _isVerifiedLabel;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)detailsButton:(id)sender {
}
@end
