//
//  GallerySelectionViewController.h
//  SugarRushBakery
//
//  Created by chupanistimo on 5/3/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GalleryViewController.h"

@interface GallerySelectionViewController : UIViewController <UITextViewDelegate, UITableViewDataSource>
@property NSMutableArray *biscuitImages;
@property NSMutableArray *cakeImages;
@property NSMutableArray *cakepopImages;
@property NSMutableArray *chocolateImages;
@property NSMutableArray *cookieImages;
@property NSMutableArray *cupcakeImages;
@property NSMutableArray *flowerImages;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
