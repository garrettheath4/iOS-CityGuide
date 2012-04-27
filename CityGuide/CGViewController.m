//
//  CGViewController.m
//  CityGuide
//
//  Created by Garrett Koller on 4/27/12.
//  Copyright (c) 2012 Washington and Lee University. All rights reserved.
//

#import "CGViewController.h"
#import "CGAppDelegate.h"
#import "City.h"
#import "CityController.h"
#import "AddCityController.h"

@implementation CGViewController
@synthesize tableView;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"City Guide";
    CGAppDelegate *deligate = (CGAppDelegate *)[[UIApplication sharedApplication] delegate];
    cities = deligate.cities;
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)setEditing:(BOOL)editing animated:(BOOL) animated {
    if( editing != self.editing ) {
        [super setEditing:editing animated:animated];
        [tableView setEditing:editing animated:animated];
        NSMutableArray *indices = [[NSMutableArray alloc] init];
        for(int i=0; i < cities.count; i++ ) {
            [indices addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        }
        NSArray *lastIndex = [NSArray
                              arrayWithObject:[NSIndexPath
                                               indexPathForRow:cities.count inSection:0]];
        if (editing == YES ) {
            for(int i=0; i < cities.count; i++ ) {
                UITableViewCell *cell =
                [tableView
                 cellForRowAtIndexPath:[indices objectAtIndex:i]];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            [tableView insertRowsAtIndexPaths:lastIndex
                             withRowAnimation:UITableViewRowAnimationLeft];
        } else {
            for(int i=0; i < cities.count; i++ ) {
                UITableViewCell *cell =
                [tableView
                 cellForRowAtIndexPath:[indices objectAtIndex:i]];
                [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
            }
            [tableView deleteRowsAtIndexPaths:lastIndex withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
}

//- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
//    if (editing != self.editing) {
//        [super setEditing:editing animated:animated];
//        [tableView setEditing:editing animated:animated];
//        
//        NSArray *indexes = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:cities.count inSection:0]];
//        if (editing == YES) {
//            [tableView insertRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationLeft];
//        } else {
//            [tableView deleteRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationLeft];
//        }
//    }
//}

#pragma mark UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
    if( nil == cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.row < cities.count) {
        City *thisCity = [cities objectAtIndex:indexPath.row];
        cell.textLabel.text = thisCity.cityName;
    } else {
        cell.textLabel.text = @"Add New City...";
        cell.textLabel.textColor = [UIColor lightGrayColor];
        cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = cities.count;
    if (self.editing) {
        count = count+1;
    }
    return count;
}

- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editing forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editing == UITableViewCellEditingStyleDelete) {
        [cities removeObjectAtIndex:indexPath.row];
        [tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CGAppDelegate *delegate = (CGAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (indexPath.row < cities.count && !self.editing) {
        CityController *city = [[CityController alloc] initWithIndexPath:indexPath];
        [delegate.navController pushViewController:city animated:YES];
    }
    if (indexPath.row == cities.count && self.editing) {
        AddCityController *addCity = [[AddCityController alloc] init];
        [delegate.navController pushViewController:addCity animated:YES];
    }
    [tv deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tv editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < cities.count) {
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleInsert;
    }
}

@end








