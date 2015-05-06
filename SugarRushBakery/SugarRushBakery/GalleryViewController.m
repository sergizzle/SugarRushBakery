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
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self navigationController] setNavigationBarHidden:NO animated:YES];

    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
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
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {    
        if(section == 0) { // biscuits
            return [self.biscuitImages count];
        } else if(section == 1) { // cakepops
            return [self.cakepopImages count];
        } else if(section == 2) { // cakes
            return [self.cakeImages count];
        } else if(section == 3) { // chocolates
            return [self.chocolateImages count];
        } else if(section == 4) { // cookies
            return [self.cookieImages count];
        } else if(section == 5) { // cupcakes
            return [self.cupcakeImages count];
        } else  { // flowers
            return [self.flowerImages count];
        }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section

{
    
        if(section == 0) { // biscuits
            return @"Biscuits";
        } else if(section == 1) { // cakepops
            return @"Cakepops";
        } else if(section == 2) { // cakes
            return @"Cakes";
        } else if(section == 3) { // chocolates
            return @"Chocolates";
        } else if(section == 4) { // cookies
            return @"Cookies";
        } else if(section == 5) { // cupcakes
            return @"Cupcakes";
        } else if(section == 6){ // flowers
            return @"Flowers";
        } else {
            return @"TEST";
        }
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"galleryCell";
    
    GalleryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[GalleryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
        if(indexPath.section == 0) {
            cell.cellImage.image = self.biscuitImages[indexPath.row];
        } else if(indexPath.section == 1) {
            cell.cellImage.image = self.cakepopImages[indexPath.row];
        } else if(indexPath.section == 2) {
            cell.cellImage.image = self.cakeImages[indexPath.row];
        } else if(indexPath.section == 3) {
            cell.cellImage.image = self.chocolateImages[indexPath.row];
        } else if(indexPath.section == 4) {
            cell.cellImage.image = self.cookieImages[indexPath.row];
        } else if(indexPath.section == 5) {
            cell.cellImage.image = self.cupcakeImages[indexPath.row];
        } else if(indexPath.section == 6) {
            cell.cellImage.image = self.flowerImages[indexPath.row];
        }
    
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
    
//    if(indexPath.section == 0) {
//        self.picture = self.biscuitImages[indexPath.row];
//    } else if(indexPath.section == 1) {
//        self.picture = self.cakepopImages[indexPath.row] ;
//    } else if(indexPath.section == 2) {
//        self.picture = self.cakeImages[indexPath.row];
//    } else if(indexPath.section == 3) {
//         self.picture = self.chocolateImages[indexPath.row];
//    } else if(indexPath.section == 4) {
//         self.picture = self.cookieImages[indexPath.row];
//    } else if(indexPath.section == 5) {
//         self.picture = self.cupcakeImages[indexPath.row];
//    } else if(indexPath.section == 6) {
//        self.picture = self.flowerImages[indexPath.row];
//    }
    UITableViewCell *cell;
    if(indexPath.section == 0) {
        cell = [tableView cellForRowAtIndexPath:indexPath];
    } else if(indexPath.section == 1) {
        cell = [tableView cellForRowAtIndexPath:indexPath];
    } else if(indexPath.section == 2) {
        cell = [tableView cellForRowAtIndexPath:indexPath];
    } else if(indexPath.section == 3) {
        cell = [tableView cellForRowAtIndexPath:indexPath];
    } else if(indexPath.section == 4) {
        cell = [tableView cellForRowAtIndexPath:indexPath];
    } else if(indexPath.section == 5) {
        cell = [tableView cellForRowAtIndexPath:indexPath];
    } else if(indexPath.section == 6) {
        cell = [tableView cellForRowAtIndexPath:indexPath];
    }
    
    
   
    [self performSegueWithIdentifier:@"premadeSegue" sender:cell.imageView.image];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([[segue identifier] isEqualToString:@"premadeSegue"]) {
        UIImage *selectedImage = (UIImage*)sender;
        
        PremadeViewController *dest = [segue destinationViewController];
//        dest.finalOrder = self.myOrder;
//        dest.picture1 = self.picture;
        

        dest.image = selectedImage;

    }
}

@end