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

NS_ASSUME_NONNULL_BEGIN

/// Longitude and Latitude Model
@interface Coordinate : NSObject
/**
 * Latitude
 */
@property (nonnull) NSNumber * lat;
/**
 * Longitude
 */
@property (nonnull) NSNumber * lng;

- (instancetype) initWithLat:(NSNumber*)lat lng:(NSNumber*)lng;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;


@end

NS_ASSUME_NONNULL_END
