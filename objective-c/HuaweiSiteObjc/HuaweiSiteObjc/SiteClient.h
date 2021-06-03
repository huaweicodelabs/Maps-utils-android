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
#import "ApiContext.h"
#import "TextSearchRequest.h"
#import "NearbySearchRequest.h"
#import "DetailSearchRequest.h"
#import "QuerySuggestionRequest.h"
#import "QueryAutocompleteRequest.h"
#import "GeocodeRequest.h"
#import "ReverseGeocodeRequest.h"
#import "TimezoneRequest.h"
#import "TextSearchResponse.h"
#import "NearbySearchResponse.h"
#import "DetailSearchResponse.h"
#import "QuerySuggestionResponse.h"
#import "QueryAutocompleteResponse.h"
#import "GeocodeResponse.h"
#import "ReverseGeocodeResponse.h"
#import "TimezoneResponse.h"
#import "Site.h"
#import "LocationType.h"
#import "HwLocationType.h"

NS_ASSUME_NONNULL_BEGIN

/// Cloud-based access interface parameters
typedef enum {
    /**
     * searchByText
     */
    textSearch,
    /**
     * nearbySearch
     */
    nearbySearch,
    /**
     * detailSearch
     */
    detailSearch,
    /**
     * querySuggestion
     */
    querySuggestion,
    /**
     * queryAutoComplete
     */
    queryAutocomplete,
    /**
     * geocode
     */
    geocode,
    /**
     * reverseGeocode
     */
    reverseGeocode,
    /**
     * getTimezone
     */
    getTimezone
} ApiCall;

/// Site Service API
/// Before you start using the HuaweiSite SDK, you need to set apiContext instance.
/// By default,
/// - ApiScheme = "https"
/// - BaseUrl = "siteapi.cloud.huawei.com"
/// - ApiPath = "\("mapApi")/\("v1")/\("siteService")/"
/// - ApiKey = "" ### Mandatory ###
/// - maxRetry = Default Max Retry for each api call-> 3
/// - retryInterval = Default Retry Interval -> Starts with one second then multiplies with 0.5 with each call
/// - timeoutInterval = If during a connection attempt the request remains idle for longer than the timeout interval, the request is considered to have timed out. The default timeout interval is 60 seconds.
///
/// ### Usage Example: ###
///
///  ````
/// NSString *apiKey = [NSString stringWithCString:"<<YOUR_API_KEY>>" encoding:NSUTF8StringEncoding];
/// NSString *encodedApiKey = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(nil,(CFStringRef)apiKey,nil,(CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8 ));
/// ApiContext *apiContext = [ApiContext alloc];
/// apiContext.apiKey = encodedApiKey;
/// [SiteClient provideApiContext:apiContext];
///  ````
@interface SiteClient : NSObject<NSURLSessionDataDelegate>

typedef void(^completionHandler)(id _Nullable result, NSError* _Nullable error);

@property (nonatomic) ApiCall endpoint;

+ (id)shared;

/// Before you start using the HuaweiSite SDK, you need to set apiContext instance.
/// By default,
/// - ApiScheme = "https"
/// - BaseUrl = "siteapi.cloud.huawei.com"
/// - ApiPath = "\("mapApi")/\("v1")/\("siteService")/"
/// - ApiKey = "" ### Mandatory ###
/// - maxRetry = Default Max Retry for each api call-> 3
/// - retryInterval = Default Retry Interval -> Starts with one second then multiplies with 0.5 with each call
/// - timeoutInterval = If during a connection attempt the request remains idle for longer than the timeout interval, the request is considered to have timed out. The default timeout interval is 60 seconds.
/// @param apiContext ApiContext instance.
+ (void)provideApiContext:(ApiContext*)apiContext;

/// textSearch
/// @param request TextSearchRequest instance.
/// @param completionHandler Completion Handler.
-(void) textSearch: (TextSearchRequest*) request completionHandler:(completionHandler)completionHandler;

/// textSearch
///
///   @param request TextSearchRequest instance.
///   @param apiContext  ApiContext instance incase CP wants to edit for one call only.
///   @param completionHandler  Completion Handler.
-(void) textSearchWithApiContext: (TextSearchRequest*) request apiContext: (nullable ApiContext*) apiContext completionHandler:(completionHandler)completionHandler;

/// nearbySearch
///
///   @param request NearbySearchRequest instance.
///   @param completionHandler  Completion Handler.
-(void) nearbySearch: (NearbySearchRequest*) request completionHandler:(completionHandler)completionHandler;

/// nearbySearch
///
///   @param request NearbySearchRequest instance.
///   @param apiContext  ApiContext instance incase CP wants to edit for one call only.
///   @param completionHandler  Completion Handler.
-(void) nearbySearchWithApiContext: (NearbySearchRequest*) request apiContext: (nullable ApiContext*) apiContext completionHandler:(completionHandler)completionHandler;

/// detailSearch
///
///   @param request DetailSearchRequest instance.
///   @param completionHandler  Completion Handler.
-(void) detailSearch: (DetailSearchRequest*) request completionHandler:(completionHandler)completionHandler;

/// detailSearch
///
///   @param request DetailSearchRequest instance.
///   @param apiContext  ApiContext instance incase CP wants to edit for one call only.
///   @param completionHandler  Completion Handler.
-(void) detailSearchWithApiContext: (DetailSearchRequest*) request apiContext: (nullable ApiContext*) apiContext completionHandler:(completionHandler)completionHandler;

/// querySuggestion
///
///   @param request QuerySuggestionRequest instance.
///   @param completionHandler  Completion Handler.
-(void) querySuggestion: (QuerySuggestionRequest*) request completionHandler:(completionHandler)completionHandler;

/// querySuggestion
///
///   @param request QuerySuggestionRequest instance.
///   @param apiContext  ApiContext instance incase CP wants to edit for one call only.
///   @param completionHandler  Completion Handler.
-(void) querySuggestionWithApiContext: (QuerySuggestionRequest*) request apiContext: (nullable ApiContext*) apiContext completionHandler:(completionHandler)completionHandler;

/// queryAutocomplete
///
///   @param request QueryAutocompleteRequest instance.
///   @param completionHandler  Completion Handler.
-(void) queryAutocomplete: (QueryAutocompleteRequest*) request completionHandler:(completionHandler)completionHandler;

/// queryAutocomplete
///
///   @param request QueryAutocompleteRequest instance.
///   @param apiContext  ApiContext instance incase CP wants to edit for one call only.
///   @param completionHandler  Completion Handler.
-(void) queryAutocompleteWithApiContext: (QueryAutocompleteRequest*) request apiContext: (nullable ApiContext*) apiContext completionHandler:(completionHandler)completionHandler;

/// geocode
///
///   @param request GeocodeRequest instance.
///   @param completionHandler  Completion Handler.
-(void) geocode: (GeocodeRequest*) request completionHandler:(completionHandler)completionHandler;

/// geocode
///
///   @param request GeocodeRequest instance.
///   @param apiContext  ApiContext instance incase CP wants to edit for one call only.
///   @param completionHandler  Completion Handler.
-(void) geocodeWithApiContext: (GeocodeRequest*) request apiContext: (nullable ApiContext*) apiContext completionHandler:(completionHandler)completionHandler;

/// reverseGeocode
///
///   @param request ReverseGeocodeRequest instance.
///   @param completionHandler  Completion Handler.
-(void) reverseGeocode: (ReverseGeocodeRequest*) request completionHandler:(completionHandler)completionHandler;

/// reverseGeocode
///
///   @param request ReverseGeocodeRequest instance.
///   @param apiContext  ApiContext instance incase CP wants to edit for one call only.
///   @param completionHandler  Completion Handler.
-(void) reverseGeocodeWithApiContext: (ReverseGeocodeRequest*) request apiContext: (nullable ApiContext*) apiContext completionHandler:(completionHandler)completionHandler;

/// timezone
///
///   @param request TimezoneRequest instance.
///   @param completionHandler  Completion Handler.
-(void) timezone: (TimezoneRequest*) request completionHandler:(completionHandler)completionHandler;

/// timezone
///
///   @param request TimezoneRequest instance.
///   @param apiContext  ApiContext instance incase CP wants to edit for one call only.
///   @param completionHandler  Completion Handler.
-(void) timezoneWithApiContext: (TimezoneRequest*) request apiContext: (nullable ApiContext*) apiContext completionHandler:(completionHandler)completionHandler;


@end

NS_ASSUME_NONNULL_END
