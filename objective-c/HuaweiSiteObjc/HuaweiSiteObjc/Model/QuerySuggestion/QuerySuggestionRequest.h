/*
 Copyright 2021. Huawei Technologies Co., Ltd. All rights reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "CoordinateBounds.h"

NS_ASSUME_NONNULL_BEGIN

/// querySuggestion request object.
@interface QuerySuggestionRequest : NSObject
/**
 * Search keyword. This parameter is mandatory.
 */
@property (nonatomic, strong, nonnull) NSString * query;

/**
 * Longitude and latitude to which search results need to be biased.
 * NOTE:If both location and bounds are passed, the value of bounds takes precedence.
 */
@property (nonatomic, strong, nullable) Coordinate * location;

/**
 * Search radius, in meters. The value ranges from 1 to 50000. The default value is 50000.
 */
@property (nonatomic, assign, nullable) NSNumber * radius;
/**
 * Coordinate bounds to which search results need to be biased.
 * NOTE:If both bounds and location are passed, the value of bounds takes precedence.
 */
@property (nullable) CoordinateBounds * bounds;
/**
 * List of POI types.
 */
@property (nullable) NSArray<NSString *> *poiTypes;
/**
 * Country/Region code, which complies with the ISO 3166-1 alpha-2 standard. This parameter is used to specify the
 * country/region where places are searched.
 */
@property (nonatomic, assign, nullable) NSString * countryCode;
/**
 * Language in which search results are displayed. If this parameter is not passed, the local language will be used.
 */
@property (nonatomic, assign, nullable) NSString * language;
/**
 * Indicates whether to return information about child nodes. The options are true (indicating to return all
 * information about child nodes) and false (indicating that no child information is returned). The default value is
 * false.
 */
@property (nonatomic, assign, nullable) BOOL * children;

- (id) initWith:(nonnull NSString *) query
       location: (nullable Coordinate *) location
         radius: (nullable NSNumber *) radius
         bounds: (nullable CoordinateBounds *) bounds
       poiTypes: (nullable NSArray<NSString *> *) poiTypes
    countryCode: (nullable NSString *) _countryCode
       language: (nullable NSString *) language
       children: (nullable BOOL *) children;

- (NSDictionary*) toDictionary;
@end

NS_ASSUME_NONNULL_END
