//
//  AddCityController.h
//  CityGuide
//
//  Created by Garrett Koller on 4/27/12.
//  Copyright (c) 2012 Washington and Lee University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCityController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    IBOutlet UITableView     *tableView;
    IBOutlet UITableViewCell *nameCell;
    IBOutlet UITableViewCell *pictureCell;
    IBOutlet UITableViewCell *descriptionCell;
    
    UIImage *cityPicture;
    UIImagePickerController *pickerController;
}

- (IBAction)addPicture:(id)sender;

@end
