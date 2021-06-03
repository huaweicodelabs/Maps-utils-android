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

#import <XCTest/XCTest.h>
#import "ApiContext.h"
#import "SiteClient.h"

@interface ApiContextTests : XCTestCase

@end

@implementation ApiContextTests

- (void) testSetApiKey_WhenApiKeyProvided_KeysMustMatch{
    NSString *apiKey = [NSString stringWithCString:"EXAMPLE_API_KEY" encoding:NSUTF8StringEncoding];
    ApiContext *apiContext = [ApiContext alloc];
    apiContext.apiKey = apiKey;
    [SiteClient provideApiContext:apiContext];
    XCTAssertEqual(apiKey, [ApiContext.shared apiKey]);
    
}

- (void) testSetApiKey_WhenApiKeyIsEmptyString_KeysMustMatch{
    NSString *apiKey = [NSString stringWithCString:"" encoding:NSUTF8StringEncoding];
    ApiContext *apiContext = [ApiContext alloc];
    apiContext.apiKey = apiKey;
    [SiteClient provideApiContext:apiContext];
    XCTAssertEqual(apiKey, [ApiContext.shared apiKey]);
    
}

- (void) testSetApiKey_WhenConsecutiveKeysProvided_KeysMustMatch{
    NSString *apiKey = [NSString stringWithCString:"EXAMPLE_API_KEY" encoding:NSUTF8StringEncoding];
    ApiContext *apiContext = [ApiContext alloc];
    apiContext.apiKey = apiKey;
    [SiteClient provideApiContext:apiContext];
    XCTAssertEqual(apiKey, [ApiContext.shared apiKey]);
    
    NSString *apiKey2 = [NSString stringWithCString:"SOME_OTHER_API_KEY" encoding:NSUTF8StringEncoding];
    ApiContext *apiContext2 = [ApiContext alloc];
    apiContext2.apiKey = apiKey2;
    [SiteClient provideApiContext:apiContext2];
    XCTAssertEqual(apiKey2, [ApiContext.shared apiKey]);
}

- (void) testSetApiScheme_WhenApiSchemeProvided_SchemesMustMatch{
    NSString *apiScheme = @"xyzd";
    ApiContext *apiContext = [ApiContext alloc];
    apiContext.apiScheme = apiScheme;
    [SiteClient provideApiContext:apiContext];
    XCTAssertEqual(apiScheme, [ApiContext.shared apiScheme]);
}

- (void) testSetBaseURL_WhenURLProvided_UrlsMustMatch{
    NSString *baseUrl = @"EXAMPLE_BASE_URL";
    ApiContext *apiContext = [ApiContext alloc];
    apiContext.baseUrl = baseUrl;
    [SiteClient provideApiContext:apiContext];
    XCTAssertEqual(baseUrl, [ApiContext.shared baseUrl]);
}

- (void) testSetBaseURL_WhenConsecutiveURLSProvided_UrlsMustMatch{
    NSString *baseUrl = @"EXAMPLE_BASE_URL";
    ApiContext *apiContext = [ApiContext alloc];
    apiContext.baseUrl = baseUrl;
    [SiteClient provideApiContext:apiContext];
    XCTAssertEqual(baseUrl, [ApiContext.shared baseUrl]);
    
    NSString *baseUrl2 = @"SOME_OTHER_BASE_URL";
    ApiContext *apiContext2 = [ApiContext alloc];
    apiContext2.baseUrl = baseUrl2;
    [SiteClient provideApiContext:apiContext2];
    XCTAssertEqual(baseUrl2, [ApiContext.shared baseUrl]);
}

- (void) testAllUrls_AllParamsMustMatch{
    ApiContext *apiContext = [ApiContext alloc];
    NSString *apiScheme = @"apiScheme";
    NSString *baseUrl = @"baseUrl";
    NSString *apiKey = @"apiKey";
    NSNumber *maxRetry = [NSNumber numberWithInt:5];
    NSNumber *retryInterval = [NSNumber numberWithDouble:2.0];
    NSNumber *timeoutInterval = [NSNumber numberWithInt:120];
    apiContext.apiScheme = apiScheme;
    apiContext.baseUrl = baseUrl;
    apiContext.apiKey = apiKey;
    apiContext.maxRetry = maxRetry;
    apiContext.retryInterval = retryInterval;
    apiContext.timeoutInterval = timeoutInterval;
    
    [SiteClient provideApiContext:apiContext];
    XCTAssertEqual(apiScheme, [ApiContext.shared apiScheme]);
    XCTAssertEqual(baseUrl, [ApiContext.shared baseUrl]);
    XCTAssertEqual(apiKey, [ApiContext.shared apiKey]);
    XCTAssertEqual(maxRetry, [ApiContext.shared maxRetry]);
    XCTAssertEqual(retryInterval, [ApiContext.shared retryInterval]);
}

@end
