//
//  CGViewController.m
//  CityGuide
//
//  Created by Garrett Koller on 4/27/12.
//  Copyright (c) 2012 Washington and Lee University. All rights reserved.
//

#import "CGViewController.h"

@interface CGViewController ()

@end

@implementation CGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
