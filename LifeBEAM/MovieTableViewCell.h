//
//  MovieTableViewCell.h
//  LifeBEAM
//
//  Created by Corey Zanotti on 10/25/16.
//  Copyright © 2016 Corey Zanotti. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CELL_IDENTIFIER @"MOVIE_TABLE_VIEW_CELL"

@interface MovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieGenreLabel;

@end
