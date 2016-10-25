//
//  PopularMovie.m
//  LifeBEAM
//
//  Created by Corey Zanotti on 10/25/16.
//  Copyright © 2016 Corey Zanotti. All rights reserved.
//

#import "PopularMovie.h"

@implementation PopularMovie

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"posterPath": @"poster_path",
             @"adult": @"adult",
             @"overview": @"overview",
             @"releaseDate": @"release_date",
             @"movieId": @"id",
             @"originalTitle": @"original_title",
             @"originalLanguage": @"original_language",
             @"title": @"title",
             @"backdropPath": @"backdrop_path",
             @"popularity": @"popularity",
             @"voteCount": @"vote_count",
             @"video": @"video",
             @"voteAverage": @"vote_average"
             };
}

@end
