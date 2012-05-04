//
//  AddCityController.m
//  CityGuide
//
//  Created by Garrett Koller on 4/27/12.
//  Copyright (c) 2012 Washington and Lee University. All rights reserved.
//

#import "AddCityController.h"
#import "CGAppDelegate.h"
#import "CGViewController.h"
#import "City.h"

@interface AddCityController ()

@end

@implementation AddCityController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)saveCity:(id)sender {
    CGAppDelegate *delegate = (CGAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSMutableArray *cities = delegate.cities;
    
    UITextField *nameEntry = (UITextField *)[nameCell viewWithTag:777];
    UITextView *descriptionEntry = (UITextView *)[descriptionCell viewWithTag:777];
    
    if (nameEntry.text.length > 0) {
        City *newCity = [[City alloc] init];
        newCity.cityName = nameEntry.text;
        newCity.cityDescription = descriptionEntry.text;
        newCity.cityPicture = nil;
        newCity.cityPicture = self->cityPicture;
        [cities addObject:newCity];
        
        CGViewController *viewController = delegate.viewController;
        [viewController.tableView reloadData];
    }
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)addPicture:(id)sender {
    UITextField *nameEntry = (UITextField *)[nameCell viewWithTag:777];
    [nameEntry resignFirstResponder];
    
    [self presentModalViewController:pickerController animated:YES];
}

#pragma mark - imagePickerController Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissModalViewControllerAnimated:YES];
    cityPicture = [info objectForKey:@"UIImagePickerControllerOriginalItem"];
    
    UIImageView *pictureView = (UIImageView *)[pictureCell viewWithTag:777];
    pictureView.image = cityPicture;
    [tableView reloadData];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.title = @"New City";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(saveCity:)];
    cityPicture = [UIImage imageNamed:@"QuestionMark.jpg"];
    
    pickerController = [[UIImagePickerController alloc] init];
    pickerController.allowsEditing = NO;
    pickerController.delegate = self;
    pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tv
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if( indexPath.row == 0 ) {
        cell = nameCell;
    } else if ( indexPath.row == 1 ) {
        UIImageView *pictureView = (UIImageView *)[pictureCell viewWithTag:777];
        pictureView.image = cityPicture;
        cell = pictureCell;
    } else {
        cell = descriptionCell;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tv
 numberOfRowsInSection:(NSInteger)section {
    return 3;
}

#pragma mark UITableViewDelegate Methods

- (CGFloat)tableView:(UITableView *)tv heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height;
    if( indexPath.row == 0 ) {
        height = 44;
    } else if ( indexPath.row == 1 ) {
        height = 83;
    } else {
        height = 279;
    }
    return height;
}

@end




