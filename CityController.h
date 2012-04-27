//
//  CityController.h
//  CityGuide
//
//  Created by Garrett Koller on 4/27/12.
//  Copyright (c) 2012 Washington and Lee University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityController : UIViewController {
    NSIndexPath *index;
    
    IBOutlet UIImageView *pictureView;
    IBOutlet UITextView  *descriptionView;
}

- (id)initWithIndexPath:(NSIndexPath *)indexPath;

@end
