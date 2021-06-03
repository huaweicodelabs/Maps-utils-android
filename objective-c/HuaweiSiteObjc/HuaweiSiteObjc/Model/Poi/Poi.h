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
#import "OpeningHours.h"
#import "ChildrenNode.h"

NS_ASSUME_NONNULL_BEGIN

/// POI Model.
@interface Poi : NSObject
/**
 * POI type.
 */
@property (nullable) NSDictionary *poiTypes;
/**
 * Huawei POI type.
 */
@property (nullable) NSDictionary *hwPoiTypes;
/**
 * Phone number.
 */
@property (nullable) NSString * phone;
/**
 * International phone number.
 */
@property (nullable) NSString * internationalPhone;
/**
 * Rating.
 */
@property (nullable) NSNumber * rating;
/**
 * Official website.
 */
@property (nullable) NSString * websiteUrl;
/**
 * Opening hours.
 */
@property (nonatomic, strong, nullable) OpeningHours * openingHours;
/**
 * Photo URL.
 */
@property (nullable) NSDictionary *photoUrls;
/**
 * Price level. The value ranges from 0 to 4.
 */
@property (nullable) NSNumber *priceLevel;
/**
 * Business status of a place. The options are as follows:
 * OPEN_NOW：open
 * CLOSE_NOW：closed
 * CLOSED_TEMPORARILY：temporarily closed
 * CLOSED_PERMANENTLY：permanently closed
 */
@property (nullable) NSNumber *businessStatus;
/**
 * AddressDetail model
 */
@property (nullable) NSArray<ChildrenNode *> * childrenNodes;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;


@end

NS_ASSUME_NONNULL_END
