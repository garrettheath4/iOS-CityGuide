//
//  CityController.m
//  CityGuide
//
//  Created by Garrett Koller on 4/27/12.
//  Copyright (c) 2012 Washington and Lee University. All rights reserved.
//

#import "CityController.h"
#import "CGAppDelegate.h"
#import "City.h"

@interface CityController ()

@end

@implementation CityController

- (id)initWithIndexPath:(NSIndexPath *)indexPath {
    if ( (self = [super init]) ) {
        index = indexPath;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGAppDelegate *delegate = (CGAppDelegate *) [[UIApplication sharedApplication] delegate];
    City *thisCity = [delegate.cities objectAtIndex:index.row];
    
    self.title = thisCity.cityName;
    descriptionView.text = thisCity.cityDescription;
    descriptionView.editable = NO;
    pictureView.image = thisCity.cityPicture;
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

@end
