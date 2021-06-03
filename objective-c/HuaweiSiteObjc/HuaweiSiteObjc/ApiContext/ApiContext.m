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

#import "ApiContext.h"

@implementation ApiContext

@synthesize apiScheme;
@synthesize baseUrl;
@synthesize apiKey;
@synthesize maxRetry;
@synthesize retryInterval;
@synthesize timeoutInterval;

+ (id)shared {
    static ApiContext *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (id)init {
  if (self = [super init]) {
      apiScheme = @"https";
      baseUrl = @"siteapi.cloud.huawei.com";
      maxRetry = [NSNumber numberWithInt:3]; // 3 times
      retryInterval = [NSNumber numberWithDouble:1.0];// 1 second
      timeoutInterval = [NSNumber numberWithInt:60];//60 seconds
  }
  return self;
}

@end
