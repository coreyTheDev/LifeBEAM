//
//  MovieDetailTableViewController.m
//  LifeBEAM
//
//  Created by Corey Zanotti on 10/25/16.
//  Copyright © 2016 Corey Zanotti. All rights reserved.
//

#import "MovieDetailTableViewController.h"
#import "MovieDetailTableViewCell.h"
#import "Cast.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <AFNetworking/AFNetworking.h>

#define MOVIEDB_BASE_URL @"https://api.themoviedb.org"
#define API_KEY @"0f1d005fdfbaa78e3b34d1b1a586ef4d"

@interface MovieDetailTableViewController ()
@property (strong, nonatomic) NSMutableArray *castArray;
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@end

@implementation MovieDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieDetailTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:DETAIL_CELL_IDENTIFIER];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 400.0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.title = self.movie.title;
    
    [self fetchCreditsForMovie];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Property methods
-(AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:MOVIEDB_BASE_URL]];
        
        //initializing response and request serializers
        _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        [_sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [_sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    }
    return _sessionManager;
}
-(NSMutableArray *)castArray {
    if (!_castArray) {
        _castArray = [NSMutableArray new];
    }
    return _castArray;
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
    
    //_castArray will be initialized on first population of the cast members from the networking response
    if (_castArray) {
        NSString *castString = @"";
        for (Cast *castMember in self.castArray) {
            if ([castString isEqualToString:@""])
                castString = castMember.name;
            else
                castString = [NSString stringWithFormat:@"%@, %@", castString, castMember.name];
        }
        detailCell.castLabel.text = castString;
        
        [detailCell.loadingIndicator stopAnimating];
        detailCell.loadingIndicator.hidden = YES;
    } else {
        detailCell.loadingIndicator.hidden = NO;
        [detailCell.loadingIndicator startAnimating];
    }
    return detailCell;
}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark - Networking methods
-(void)fetchCreditsForMovie {
    
    //initializing parameters for network call
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"api_key"] = API_KEY;
    
    //fetch request
    [self.sessionManager GET:[NSString stringWithFormat:@"/3/movie/%@/credits",self.movie.movieId] parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"successful fetch request");
        
        NSDictionary *responseDictionary = (NSDictionary *)responseObject;
        
        NSMutableArray *castArray = [responseDictionary objectForKey:@"cast"];
        for (NSDictionary *castJSONDictionary in castArray)
        {
            NSError *mantleParsingError;
            Cast *castMember = [MTLJSONAdapter modelOfClass:Cast.class fromJSONDictionary:castJSONDictionary error:&mantleParsingError];
            if (!mantleParsingError) {
                [self.castArray addObject:castMember];
            }
        }
//        [self hideLoadingIndicator];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"failed network request");
        //handle errors
    }];
}

@end
