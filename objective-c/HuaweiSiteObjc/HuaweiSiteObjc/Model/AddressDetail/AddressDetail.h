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
/// AddressDetail model
@interface AddressDetail : NSObject
/**
 * Country/Region code, which complies with the ISO 3166-1 alpha-2 standard.
 */
@property (nonatomic, strong, nullable) NSString * countryCode;

/**
 * Country name.
 */
@property (nonatomic, strong, nullable) NSString * country;

/**
 * Level-1 administrative region in a country, which is generally a province or state.
 */
@property (nonatomic, strong, nullable) NSString * adminArea;

/**
 * Level-2 administrative region in a country, which is generally a city.
 */
@property (nonatomic, assign, nullable) NSString * subAdminArea;

/**
 * Level-3 administrative region of a country.
 */
@property (nonatomic, assign, nullable) NSString * tertiaryAdminArea;

/**
 * District/county to which a place belongs.
 */
@property (nonatomic, assign, nullable) NSString * subLocality;

/**
 * Level-3 administrative region in a country, which is generally a county or district.
 */
@property (nonatomic, assign, nullable) NSString * locality;

/**
 * Street.
 */
@property (nonatomic, assign, nullable) NSString * thoroughfare;

/**
 * Street number.
 */
@property (nonatomic, assign, nullable) NSString * streetNumber;

/**
 * Postal code.
 */
@property (nonatomic, assign, nullable) NSString * postalCode;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
