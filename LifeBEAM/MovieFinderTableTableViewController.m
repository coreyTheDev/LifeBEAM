//
//  MovieFinderTableTableViewController.m
//  LifeBEAM
//
//  Created by Corey Zanotti on 10/25/16.
//  Copyright © 2016 Corey Zanotti. All rights reserved.
//

#import "MovieFinderTableTableViewController.h"
#import "MovieTableViewCell.h"
#import <AFNetworking/AFNetworking.h>


#define MOVIEDB_BASE_URL @"https://api.themoviedb.org"
#define API_KEY @"0f1d005fdfbaa78e3b34d1b1a586ef4d"



@interface MovieFinderTableTableViewController ()
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@property (nonatomic, strong) NSMutableArray *popularMovieArray;
@property (nonatomic) NSInteger currentPage;
-(void)fetchPopularMoviesForNextPage;
@end

@implementation MovieFinderTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CELL_IDENTIFIER];
    
    
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display voice search button
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.currentPage = 1;
    [self fetchPopularMoviesForNextPage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Property Initializers 
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Networking methods
-(void)fetchPopularMoviesForNextPage {
    
    //initializing parameters for network call
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"page"] = [NSNumber numberWithInteger:self.currentPage];
    parameters[@"language"] = @"en-US";
    parameters[@"api_key"] = API_KEY;
    
    //fetch request
    [self.sessionManager GET:@"/3/movie/popular" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"successful fetch request");
//        
//        NSDictionary *postDictionary = (NSDictionary *)responseObject;
//        //array to store new posts in
//        NSMutableArray *resultsAsAGFPostObjectsArray = [NSMutableArray new];
//        //array to store raw response data in
//        NSMutableArray *resultsAsRawData = [postDictionary objectForKey:@"forum_posts"];
//        for (NSDictionary *postDictionary in resultsAsRawData)
//        {
//            [resultsAsAGFPostObjectsArray addObject:[[AGFPost alloc] initWithDictionary:postDictionary]];
//        }
//        
//        AGFPaginationObject *pagination = [[AGFPaginationObject alloc] init];
//        [pagination populateWithDictionary:[postDictionary objectForKey:@"meta"]];
//        
//        if([self.delegate respondsToSelector:@selector(fetchFinishedSuccessfullyWithNewPosts:andPagination:)])
//        {
//            [self.delegate fetchFinishedSuccessfullyWithNewPosts:resultsAsAGFPostObjectsArray andPagination:pagination];
//        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"failed network request");
//        if ([self.delegate respondsToSelector:@selector(fetchFailedWithError:)])
//        {
//            [self.delegate fetchFailedWithError:error];
//        }
    }];
}
@end
