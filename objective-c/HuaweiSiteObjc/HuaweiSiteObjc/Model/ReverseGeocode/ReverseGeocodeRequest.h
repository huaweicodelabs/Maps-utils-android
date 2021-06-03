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

/// reverseGeocode request object.
@interface ReverseGeocodeRequest : NSObject
/**
 * Current location of a user.
 */
@property (nonatomic, strong, nonnull) Coordinate * location;
/**
 * Language in which search results are displayed. If this parameter is not passed, the local language will be used.
 */
@property (nonatomic, assign, nullable) NSString * language;
/**
 * Indicates whether to return the POI. The default value is true.
 */
@property (nonatomic, assign, nullable) BOOL * returnPoi;

- (id) initWith:(nonnull Coordinate *) location
       language: (nullable NSString *) language
      returnPoi: (nullable BOOL *) returnPoi;

- (NSDictionary*) toDictionary;
@end

NS_ASSUME_NONNULL_END
