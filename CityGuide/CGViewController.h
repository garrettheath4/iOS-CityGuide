//
//  CGViewController.h
//  CityGuide
//
//  Created by Garrett Koller on 4/27/12.
//  Copyright (c) 2012 Washington and Lee University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *cities;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
