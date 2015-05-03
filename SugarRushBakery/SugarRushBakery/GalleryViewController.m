//
//  GalleryViewController.m
//  SugarRushBakery
//
//  Created by Sergio Felix on 4/25/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "GalleryViewController.h"



@interface GalleryViewController ()

@end

@implementation GalleryViewController
@synthesize picture;
@synthesize arrayToDisplay;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.automaticallyAdjustsScrollViewInsets = NO;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // 0 = biscuits
    // 1 = cakepops
    // 2 = cakes
    // 3 = chocolates
    // 4 = cookies
    // 5 = cupcakes
    // 6 = flowers
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayToDisplay count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"galleryCell";
    
    GalleryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[GalleryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.cellImage.image = self.arrayToDisplay[indexPath.row];

    return cell;
}

#pragma mark segue stuff


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //self.myOrder = [self.thisOrderArray objectAtIndex:indexPath.row];
    // 0 = biscuit
    // 1 = cakepop
    // 2 = cake
    // 3 = chocolate
    // 4 = cookie
    // 5 = cupcake
    // 6 = flower
    
    self.picture = self.arrayToDisplay[indexPath.row];

    [self performSegueWithIdentifier:@"premadeSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([[segue identifier] isEqualToString:@"premadeSegue"]) {
        PremadeViewController *dest = [segue destinationViewController];
        dest.image = self.picture;
    }
}

@end