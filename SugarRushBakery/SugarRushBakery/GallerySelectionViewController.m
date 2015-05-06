//
//  GallerySelectionViewController.m
//  SugarRushBakery
//
//  Created by chupanistimo on 5/3/15.
//  Copyright (c) 2015 Super Nova. All rights reserved.
//

#import "GallerySelectionViewController.h"

@interface GallerySelectionViewController ()

@end

@implementation GallerySelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}

-(void)viewWillAppear:(BOOL)animated {
    self.automaticallyAdjustsScrollViewInsets = NO;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 80;
//}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"selectionCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    // 0 = biscuits
    // 1 = cakepops
    // 2 = cakes
    // 3 = chocolates
    // 4 = cookies
    // 5 = cupcakes
    // 6 = flowers
    
    if(indexPath.row == 0) {
        cell.textLabel.text = @"Biscuits";
    } else if(indexPath.row == 1) {
        cell.textLabel.text = @"Cakepops";
    } else if(indexPath.row== 2) {
        cell.textLabel.text = @"Cakes";
    } else if(indexPath.row == 3) {
        cell.textLabel.text = @"Chocolates";
    } else if(indexPath.row == 4) {
        cell.textLabel.text = @"Cookies";
    } else if(indexPath.row == 5) {
        cell.textLabel.text = @"Cupcakes";
    } else if(indexPath.row == 6) {
        cell.textLabel.text = @"Flowers";
    }
    
    return cell;
}

#pragma mark segue stuff


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //self.myOrder = [self.thisOrderArray objectAtIndex:indexPath.row];
    // 0 = biscuit
    // 1 = cakepop
    // 2 = cake
    // 3 = chocolate
    // 4 = cookie
    // 5 = cupcake
    // 6 = flower
    
    if(indexPath.row == 0) {
        [self performSegueWithIdentifier:@"gallerySelected" sender:self.biscuitImages];
    } else if(indexPath.row == 1) {
        [self performSegueWithIdentifier:@"gallerySelected" sender:self.cakepopImages];
    } else if(indexPath.row == 2) {
        [self performSegueWithIdentifier:@"gallerySelected" sender:self.cakeImages];
    } else if(indexPath.row == 3) {
        [self performSegueWithIdentifier:@"gallerySelected" sender:self.chocolateImages];
    } else if(indexPath.row == 4) {
        [self performSegueWithIdentifier:@"gallerySelected" sender:self.cookieImages];
    } else if(indexPath.row == 5) {
        [self performSegueWithIdentifier:@"gallerySelected" sender:self.cupcakeImages];
    } else if(indexPath.row == 6) {
        [self performSegueWithIdentifier:@"gallerySelected" sender:self.flowerImages];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"gallerySelected"]) {
        GalleryViewController *dest = [segue destinationViewController];
        dest.arrayToDisplay = (NSMutableArray*)sender;
    }
}


@end
