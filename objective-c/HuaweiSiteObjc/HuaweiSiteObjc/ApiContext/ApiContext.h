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

@interface ApiContext : NSObject {
    NSString *apiScheme;
    NSString *baseUrl;
    NSString *apiKey;
    NSNumber *maxRetry;
    NSNumber *retryInterval;
    NSNumber *timeoutInterval;
}

@property (nonatomic, retain) NSString *apiScheme;
@property (nonatomic, retain) NSString *baseUrl;
@property (nonatomic, retain) NSString *apiKey;
@property (nonatomic, retain) NSNumber *maxRetry;
@property (nonatomic, retain) NSNumber *retryInterval;
@property (nonatomic, retain) NSNumber *timeoutInterval;

+ (id)shared;

@end

NS_ASSUME_NONNULL_END
