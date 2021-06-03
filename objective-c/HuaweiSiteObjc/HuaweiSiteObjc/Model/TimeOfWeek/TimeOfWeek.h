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

/// Weekly Time Model
@interface TimeOfWeek : NSObject
/**
 * 0-Sunday
 * 1-Monday
 * 2-Tuesday
 * 3-Wednesday
 * 4-Thursday
 * 5-Friday
 * 6-Saturday
 */
@property (nonatomic, assign, nullable) NSNumber *week;
/**
 * 24-hour time point on a day, in hhmm format. The value ranges from 0000 to 2359.
 */
@property (nonatomic, strong, nullable) NSString * time;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
