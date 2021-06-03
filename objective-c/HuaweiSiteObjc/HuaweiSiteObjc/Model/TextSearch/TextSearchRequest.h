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
#import "LocationType.h"
#import "HwLocationType.h"

NS_ASSUME_NONNULL_BEGIN

/// textSearch request object.
@interface TextSearchRequest : NSObject
/**
 * Search keyword.
 */
@property (nonatomic, strong, nonnull) NSString * query;

/**
 * Longitude and latitude to which search results need to be biased.
 */
@property (nonatomic, strong, nullable) Coordinate * location;

/**
 * Search radius, in meters. The value ranges from 1 to 50000. The default value is 50000.
 */
@property (nonatomic, assign, nullable) NSNumber * radius;
/**
 * POI type.
 */
@property (nonatomic, assign, nullable) NSString * poiType;
/**
 * Huawei POI type. This parameter is recommended.
 * NOTE:If both hwPoiType and poiType are set, search results of hwPoiType take precedence.
 */
@property (nonatomic, assign, nullable) NSString * hwPoiType;
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
 * Number of records on each page. The value ranges from 1 to 20. The default value is 20.
 * NOTE:pageIndex * pageSize <= 60
 */
@property (nonatomic, assign, nullable) NSNumber * pageSize;
/**
 * Number of the current page. The value ranges from 1 to 60. The default value is 1.
 * NOTE:pageIndex * pageSize <= 60
 */
@property (nonatomic, assign, nullable) NSNumber * pageIndex;
/**
 * Indicates whether to return information about child nodes. The options are true (indicating to return all
 * information about child nodes) and false (indicating that no child information is returned). The default value is
 * false.
 */
@property (nonatomic, assign, nullable) BOOL * children;

- (id) initWith:(nonnull NSString *) _query
       location: (nullable Coordinate *) _location
         radius: (nullable NSNumber *) _radius
        poiType: (nullable NSString *) _poiType
      hwPoiType: (nullable NSString *) _hwPoiType
    countryCode: (nullable NSString *) _countryCode
       language: (nullable NSString *) _language
       pageSize: (nullable NSNumber *) _pageSize
      pageIndex: (nullable NSNumber *) _pageIndex
       children: (nullable BOOL *) _children;

- (NSDictionary*) toDictionary;

@end

NS_ASSUME_NONNULL_END
