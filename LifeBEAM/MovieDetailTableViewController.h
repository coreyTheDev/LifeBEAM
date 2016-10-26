//
//  MovieDetailTableViewController.h
//  LifeBEAM
//
//  Created by Corey Zanotti on 10/25/16.
//  Copyright © 2016 Corey Zanotti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopularMovie.h"

@interface MovieDetailTableViewController : UITableViewController
@property (strong, nonatomic) PopularMovie *movie;
@end
