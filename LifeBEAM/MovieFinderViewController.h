//
//  MovieFinderTableTableViewController.h
//  LifeBEAM
//
//  Created by Corey Zanotti on 10/25/16.
//  Copyright © 2016 Corey Zanotti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieFinderViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *errorView;
- (IBAction)reloadMovies:(id)sender;

@end
