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

/// geocode request object.
@interface GeocodeRequest : NSObject
/**
 * Address information
 */
@property (nonatomic, strong, nonnull) NSString * address;

/**
 * Longitude and latitude to which search results need to be biased.
 */
@property (nonatomic, strong, nullable) CoordinateBounds * bounds;
/**
 * Language in which search results are displayed. If this parameter is not passed, the local language will be used.
 */
@property (nonatomic, assign, nullable) NSString * language;

- (id) initWith:(nonnull NSString *) address
         bounds: (nullable CoordinateBounds *) bounds
       language: (nullable NSString *) language;

- (NSDictionary*) toDictionary;

@end

NS_ASSUME_NONNULL_END
