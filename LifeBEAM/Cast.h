//
//  Cast.h
//  LifeBEAM
//
//  Created by Corey Zanotti on 10/25/16.
//  Copyright © 2016 Corey Zanotti. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Cast : MTLModel <MTLJSONSerializing>
@property (nonatomic, copy, readonly) NSNumber *castId;
@property (nonatomic, copy, readonly) NSString *character;
@property (nonatomic, copy, readonly) NSString *creditId;
@property (nonatomic, copy, readonly) NSNumber *personId;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSNumber *order;
@property (nonatomic, copy, readonly) NSString *profilePath;
@end
