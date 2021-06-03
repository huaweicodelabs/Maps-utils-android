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
#import "Word.h"

NS_ASSUME_NONNULL_BEGIN

/// AutoCompletePrediction model
@interface AutoCompletePrediction : NSObject
/**
 * Description of a predicted autocomplete place.
 */
@property (nonatomic, strong, nullable) NSString * description;

/**
 * Matching position of the entered keyword in the description.
 */
@property (nonatomic, strong, nullable) NSArray<Word *>* matchedKeywords;
/**
 * Matched words and their positions in the description.
 */
@property (nonatomic, strong, nullable) NSArray<Word *>* matchedWords;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
