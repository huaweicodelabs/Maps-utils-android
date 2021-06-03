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
#import "BaseResponse.h"

NS_ASSUME_NONNULL_BEGIN

/// TimezoneResponse response object.
@interface TimezoneResponse : BaseResponse
/**
 * DST offset, in seconds. If the specified timestamp is out of the DST, 0 will be returned.
 */
@property (nonatomic, assign, nullable) NSNumber * dstOffset;

/**
 * Time zone offset of a specified place from UTC, in seconds.
 */
@property (nonatomic, assign, nullable) NSNumber * rawOffset;

/**
 * Time zone ID.
 */
@property (nonatomic, strong, nullable) NSString * timeZoneId;

/**
 * Time zone name.
 */
@property (nonatomic, strong, nullable) NSString * timeZoneName;


@end

NS_ASSUME_NONNULL_END
