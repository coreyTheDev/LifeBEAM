//
//  PopularMovie.h
//  LifeBEAM
//
//  Created by Corey Zanotti on 10/25/16.
//  Copyright © 2016 Corey Zanotti. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface PopularMovie : MTLModel <MTLJSONSerializing>
@property (nonatomic, copy, readonly) NSString *posterPath;
@property (nonatomic, readonly) BOOL adult;
@property (nonatomic, copy, readonly) NSString *overview;
@property (nonatomic, copy, readonly) NSString *releaseDate;
@property (nonatomic, copy, readonly) NSArray *genreIds;
@property (nonatomic, copy, readonly) NSNumber *movieId;
@property (nonatomic, copy, readonly) NSString *originalTitle;
@property (nonatomic, copy, readonly) NSString *originalLanguage;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *backdropPath;
@property (nonatomic, copy, readonly) NSNumber *popularity;
@property (nonatomic, copy, readonly) NSNumber *voteCount;
@property (nonatomic, readonly) BOOL video;
@property (nonatomic, copy, readonly) NSNumber *voteAverage;
@end
