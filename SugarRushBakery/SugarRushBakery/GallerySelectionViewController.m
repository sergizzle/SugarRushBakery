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
    
    UIImage *headerImage = [GallerySelectionViewController imageWithImage:self.cakeImages[0] scaledToSize:CGSizeMake(190, 190)];
    
    //self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.imageView.image = headerImage;

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

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


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
    
    
    UIImage *check = [GallerySelectionViewController imageWithImage:[UIImage imageNamed:@"arrow-10-512 copy.png"] scaledToSize:CGSizeMake(30, 30)];
    
    UIImageView *checkmark = [[UIImageView alloc] initWithImage:check];
    cell.accessoryView = checkmark;
    
    
    
    //create UIImages
    UIImage *biscuitImage = [UIImage imageNamed:@"biscuit.png"];
    UIImage *cakepopImage = [UIImage imageNamed:@"cakepop.png"];
    UIImage *cakeImage = [UIImage imageNamed:@"cake.png"];
    UIImage *chocolateImage = [UIImage imageNamed:@"chocolate.png"];
    UIImage *cookieImage = [UIImage imageNamed:@"cookie.png"];
    UIImage *cupcakeImage = [UIImage imageNamed:@"cupcake.png"];
    UIImage *flowerImage = [UIImage imageNamed:@"flower.png"];
    
    //set the images to each corresponding row
    switch (indexPath.row) {
        case 0:
            cell.imageView.image = biscuitImage;
            cell.backgroundColor = [UIColor colorWithRed: (113.0/255) green: (202.0/255) blue: (243.0/255) alpha: 1.0];
            cell.textLabel.backgroundColor = [UIColor clearColor];
            break;
        case 1:
            cell.imageView.image = cakepopImage;
            cell.backgroundColor = [UIColor colorWithRed: (243.0/255) green: (189.0/255) blue: (206.0/255) alpha: 1.0];
            cell.textLabel.backgroundColor = [UIColor clearColor];
            break;
        case 2:
            cell.imageView.image = cakeImage;
            cell.backgroundColor = [UIColor colorWithRed: (158.0/255) green: (243.0/255) blue: (115.0/255) alpha: 1.0];
            cell.textLabel.backgroundColor = [UIColor clearColor];
            break;
        case 3:
            cell.imageView.image = chocolateImage;
            cell.backgroundColor = [UIColor colorWithRed: (243.0/255) green: (219.0/255) blue: (161.0/255) alpha: 1.0];
            cell.textLabel.backgroundColor = [UIColor clearColor];
            break;
        case 4:
            cell.imageView.image = cookieImage;
            cell.backgroundColor = [UIColor colorWithRed: (243.0/255) green: (121.0/255) blue: (108.0/255) alpha: 1.0];
            cell.textLabel.backgroundColor = [UIColor clearColor];
            break;
        case 5:
            cell.imageView.image = cupcakeImage;
            cell.backgroundColor = [UIColor colorWithRed: (159.0/255) green: (243.0/255) blue: (218.0/255) alpha: 1.0];
            cell.textLabel.backgroundColor = [UIColor clearColor];
            break;
        case 6:
            cell.imageView.image = flowerImage;
            cell.backgroundColor = [UIColor colorWithRed: (215.0/255) green: (173.0/255) blue: (243.0/255) alpha: 1.0];
            cell.textLabel.backgroundColor = [UIColor clearColor];
            break;
        default:
            break;
    }
    
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
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
