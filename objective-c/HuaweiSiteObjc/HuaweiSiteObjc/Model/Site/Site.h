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
#import "AutoCompletePrediction.h"
#import "AddressDetail.h"
#import "Coordinate.h"
#import "CoordinateBounds.h"
#import "Poi.h"
NS_ASSUME_NONNULL_BEGIN

/// Place Model.
@interface Site : NSObject
/**
 * Unique ID of a place.
 */
@property (nullable) NSString * siteId;
/**
 * Name of a place.
 */
@property (nullable) NSString * name;
/**
 * Formatted detailed address of a place.
 */
@property (nullable) NSString * formatAddress;
/**
 * Place details.
 */
@property (nullable) AddressDetail * address;
/**
 * Longitude and latitude of a place.
 */
@property (nullable) Coordinate * location;
/**
 * Viewport of a place.
 */
@property (nullable) CoordinateBounds * viewport;
/**
 * Linear distance between a predicted place and the location specified by the input parameter location, in meters.
 */
@property (nullable) NSNumber * distance;
/**
 * POI of a place.
 */
@property (nullable)  Poi * poi;
/**
 * Autocomplete place description.
 */
@property (nullable)  AutoCompletePrediction * prediction;
/**
 * Difference between the time zone of a place and the UTC time zone, in minutes.
 */
@property (nullable) NSNumber * utcOffset;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
