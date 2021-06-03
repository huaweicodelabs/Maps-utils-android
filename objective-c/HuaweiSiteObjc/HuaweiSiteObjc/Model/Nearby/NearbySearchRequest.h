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
#import "Coordinate.h"

NS_ASSUME_NONNULL_BEGIN

/// nearbySearch request object.
@interface NearbySearchRequest : NSObject
/**
 * Current location of a user.
 * mandatory
 */
@property (nonnull) Coordinate * location;
/**
 * Search radius, in meters. The value ranges from 1 to 50000. The default value is 1000.
 */
@property (nullable) NSNumber * radius;
/**
 * Search keyword.
 */
@property (nullable) NSString * query;
/**
 * Number of the current page. The value ranges from 1 to 60. The default value is 1.
 * NOTE：pageIndex * pageSize <= 60
 */
@property (nullable) NSNumber * pageSize;
/**
 * Number of records on each page. The value ranges from 1 to 20. The default value is 20.
 * NOTE：pageIndex * pageSize <= 60
 */
@property (nullable) NSNumber * pageIndex;
/**
 * POI type.
 */
@property (nullable) NSString * poiType;
/**
 * Huawei POI type. This parameter is recommended.
 * NOTE:If both hwPoiType and poiType are set, search results of hwPoiType take precedence.
 */
@property (nullable) NSString * hwPoiType;
/**
 * Language in which search results are displayed. If this parameter is not passed, the local language will be used.
 */
@property (nullable) NSString * language;

- (id) initWithLocation:(nonnull Coordinate *) location
                 radius: (nullable NSNumber *) radius
                  query: (nullable NSString *) query
               pageSize: (nullable NSNumber *) pageSize
              pageIndex: (nullable NSNumber *) pageIndex
                poiType: (nullable NSString *) poiType
              hwPoiType: (nullable NSString *) hwPoiType
               language: (nullable NSString *) language;

- (NSDictionary*) toDictionary;
@end

NS_ASSUME_NONNULL_END
