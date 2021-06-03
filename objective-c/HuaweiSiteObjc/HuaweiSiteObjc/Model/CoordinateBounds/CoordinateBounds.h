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

/// Includes information about the coordination system
@interface CoordinateBounds : NSObject
/**
 * Coordinates of the northeast corner.
 */
@property (nonatomic, strong, nonnull) Coordinate * northeast;
/**
 * Coordinates of the southwest corner.
 */
@property (nonatomic, strong, nonnull) Coordinate * southwest;

- (instancetype) initWith:(Coordinate *)northeast southwest:(Coordinate *)southwest;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
