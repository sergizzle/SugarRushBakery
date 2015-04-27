//
//  GalleryViewController.h
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/25/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GalleryTableViewCell.h"

@interface GalleryViewController : UIViewController <UITextViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *galleryTableView;

// 0 = biscuits
// 1 = cakes
// 2 = cakepops
// 3 = chocolate
// 4 = cookies
// 5 = cupcakes
// 6 = flowers

@property NSMutableArray *biscuitImages;
@property NSMutableArray *cakeImages;
@property NSMutableArray *cakepopImages;
@property NSMutableArray *chocolateImages;
@property NSMutableArray *cookieImages;
@property NSMutableArray *cupcakeImages;
@property NSMutableArray *flowerImages;

@property NSMutableArray *biscuitImagePaths;
@property NSMutableArray *cakeImagePaths;
@property NSMutableArray *cakepopImagePaths;
@property NSMutableArray *chocolateImagePaths;
@property NSMutableArray *cookieImagePaths;
@property NSMutableArray *cupcakeImagePaths;
@property NSMutableArray *flowerImagePaths;

@end
