//
//  Cast.m
//  LifeBEAM
//
//  Created by Corey Zanotti on 10/25/16.
//  Copyright © 2016 Corey Zanotti. All rights reserved.
//

#import "Cast.h"

@implementation Cast
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"castId": @"cast_id",
             @"character": @"character",
             @"creditId": @"credit_id",
             @"personId": @"id",
             @"name": @"name",
             @"order": @"order",
             @"profilePath": @"profile_path"
             };
}
@end
