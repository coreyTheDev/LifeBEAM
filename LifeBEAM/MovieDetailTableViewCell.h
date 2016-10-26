//
//  MovieDetailTableViewCell.h
//  LifeBEAM
//
//  Created by Corey Zanotti on 10/25/16.
//  Copyright © 2016 Corey Zanotti. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DETAIL_CELL_IDENTIFIER @"MOVIE_DETAIL_TABLE_VIEW_CELL"

@interface MovieDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;
@property (weak, nonatomic) IBOutlet UILabel *castLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;

@end
