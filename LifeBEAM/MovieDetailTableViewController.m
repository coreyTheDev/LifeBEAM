//
//  MovieDetailTableViewController.m
//  LifeBEAM
//
//  Created by Corey Zanotti on 10/25/16.
//  Copyright © 2016 Corey Zanotti. All rights reserved.
//

#import "MovieDetailTableViewController.h"
#import "MovieDetailTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MovieDetailTableViewController ()

@end

@implementation MovieDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieDetailTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:DETAIL_CELL_IDENTIFIER];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 400.0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.title = self.movie.title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieDetailTableViewCell *detailCell = [tableView dequeueReusableCellWithIdentifier:DETAIL_CELL_IDENTIFIER forIndexPath:indexPath];
    detailCell.overviewLabel.text = self.movie.overview;
    [detailCell.posterImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://image.tmdb.org/t/p/w342/%@",self.movie.posterPath]]];
    
    return detailCell;
}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}
@end
