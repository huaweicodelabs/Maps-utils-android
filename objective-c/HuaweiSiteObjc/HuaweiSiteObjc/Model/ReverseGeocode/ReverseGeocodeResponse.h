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
#import "Site.h"

NS_ASSUME_NONNULL_BEGIN

/// reverseGeocode response object.
@interface ReverseGeocodeResponse : BaseResponse
/**
 * Search result returned upon a successful search. If no record is found, an empty array will be returned.
 */
@property (nonatomic, strong, nullable) NSArray<Site *> *sites;

@end

NS_ASSUME_NONNULL_END