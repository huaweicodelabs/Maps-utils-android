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

#import "SiteClient.h"

typedef NS_ENUM(NSInteger, ErrorCaseType) {
    ArgError,
    ApiError,
    JSONError
};

@interface SiteClient()
@property ApiContext* sharedApiContext;
@property NSURLSessionConfiguration *configuration;
@property NSURLSession *session;
@property NSMutableURLRequest *request;
@property NSNumber *maxRetry;
@property NSNumber *retryInterval;
@property NSNumber *timeoutInterval;
@property dispatch_queue_t delegateQueue;
@end

@implementation SiteClient

+ (id)shared {
    static SiteClient *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (id) init{
    self = [super init];
    
    if (self != nil){
        _sharedApiContext = [ApiContext shared];
        self.maxRetry = _sharedApiContext.maxRetry;
        self.retryInterval = _sharedApiContext.retryInterval;
        self.timeoutInterval = _sharedApiContext.timeoutInterval;
        self.configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        if([self.timeoutInterval intValue] != 60){
            self.configuration.timeoutIntervalForRequest = [self.timeoutInterval intValue];
        }
        self.session = [NSURLSession sessionWithConfiguration:_configuration delegate:self delegateQueue:nil];
        self.delegateQueue = dispatch_queue_create("huawei-site-services-objc", NULL);
        
    }
    
    return self;
}

/// Before you start using the HuaweiSite SDK, you need to set apiContext instance.
/// By default,
/// - ApiScheme = "https"
/// - BaseUrl = "siteapi.cloud.huawei.com"
/// - ApiPath = "\("mapApi")/\("v1")/\("siteService")/"
/// - ApiKey = "" ### Mandatory ###
/// - maxRetry = Default Max Retry for each api call-> 3
/// - retryInterval = Default Retry Interval -> Starts with one second then multiplies with 0.5 with each call
/// - timeoutInterval = If during a connection attempt the request remains idle for longer than the timeout interval, the request is considered to have timed out. The default timeout interval is 60 seconds.
/// - Parameter apiContext: ApiContext instance.
+ (void)provideApiContext:(ApiContext*)apiContext{
    ApiContext *shared = [ApiContext shared];
    
    if(apiContext.apiScheme != nil){
        [shared setApiScheme:apiContext.apiScheme];
    }
    if(apiContext.baseUrl != nil){
        [shared setBaseUrl:apiContext.baseUrl];
    }
    if(apiContext.apiKey != nil){
        [shared setApiKey:apiContext.apiKey];
    }
    if(apiContext.maxRetry != nil){
        [shared setMaxRetry:apiContext.maxRetry];
    }
    if(apiContext.retryInterval != nil){
        [shared setRetryInterval:apiContext.retryInterval];
    }
    if(apiContext.timeoutInterval != nil){
        [shared setTimeoutInterval:apiContext.timeoutInterval];
    }
    
}

-(void) textSearch: (TextSearchRequest*) request completionHandler:(completionHandler)completionHandler{
    if(request.query == nil){
        completionHandler(nil, [self getError:@"query" errorType:ArgError]);
        return;
    }
    [self textSearchServices: [request toDictionary] withApiContext:nil completionHandler:^(TextSearchResponse* result, NSError* error){
        completionHandler(result, error);
    }];
}

-(void) textSearchWithApiContext: (TextSearchRequest*) request apiContext: (nullable ApiContext*) apiContext completionHandler:(completionHandler)completionHandler{
    if(request.query == nil){
        completionHandler(nil, [self getError:@"query" errorType:ArgError]);
        return;
    }
    [self textSearchServices: [request toDictionary] withApiContext:apiContext completionHandler:^(TextSearchResponse* result, NSError* error){
        completionHandler(result, error);
    }];
}

-(void) nearbySearch: (NearbySearchRequest*) request completionHandler:(completionHandler)completionHandler{
    if(request.location == nil){
        completionHandler(nil, [self getError:@"location" errorType:ArgError]);
        return;
    }
    [self nearbySearchServices: [request toDictionary] withApiContext:nil completionHandler:^(NearbySearchResponse* result, NSError* error){
        completionHandler(result, error);
    }];
}

-(void) nearbySearchWithApiContext: (NearbySearchRequest*) request apiContext: (nullable ApiContext*) apiContext completionHandler:(completionHandler)completionHandler{
    if(request.location == nil){
        completionHandler(nil, [self getError:@"location" errorType:ArgError]);
        return;
    }
    [self nearbySearchServices: [request toDictionary] withApiContext:apiContext completionHandler:^(NearbySearchResponse* result, NSError* error){
        completionHandler(result, error);
    }];
}

-(void) detailSearch: (DetailSearchRequest*) request completionHandler:(completionHandler)completionHandler{
    if(request.siteId == nil){
        completionHandler(nil, [self getError:@"siteId" errorType:ArgError]);
        return;
    }
    [self detailSearchServices: [request toDictionary] withApiContext:nil completionHandler:^(DetailSearchResponse* result, NSError* error){
        completionHandler(result, error);
    }];
}

-(void) detailSearchWithApiContext: (DetailSearchRequest*) request apiContext: (nullable ApiContext*) apiContext completionHandler:(completionHandler)completionHandler{
    if(request.siteId == nil){
        completionHandler(nil, [self getError:@"siteId" errorType:ArgError]);
        return;
    }
    [self detailSearchServices: [request toDictionary] withApiContext:apiContext completionHandler:^(DetailSearchResponse* result, NSError* error){
        completionHandler(result, error);
    }];
}

-(void) querySuggestion: (QuerySuggestionRequest*) request completionHandler:(completionHandler)completionHandler{
    if(request.query == nil){
        completionHandler(nil, [self getError:@"query" errorType:ArgError]);
        return;
    }
    [self querySuggestionServices: [request toDictionary] withApiContext:nil completionHandler:^(id result, NSError* error){
        completionHandler(result, error);
    }];
}

-(void) querySuggestionWithApiContext: (QuerySuggestionRequest*) request apiContext: (nullable ApiContext*) apiContext completionHandler:(completionHandler)completionHandler{
    if(request.query == nil){
        completionHandler(nil, [self getError:@"query" errorType:ArgError]);
        return;
    }
    [self querySuggestionServices: [request toDictionary] withApiContext:apiContext completionHandler:^(id result, NSError* error){
        completionHandler(result, error);
    }];
}

-(void) queryAutocomplete: (QueryAutocompleteRequest*) request completionHandler:(completionHandler)completionHandler{
    if(request.query == nil){
        completionHandler(nil, [self getError:@"query" errorType:ArgError]);
        return;
    }
    [self queryAutocompleteServices: [request toDictionary] withApiContext:nil completionHandler:^(id result, NSError* error){
        completionHandler(result, error);
    }];
}

-(void) queryAutocompleteWithApiContext: (QueryAutocompleteRequest*) request apiContext: (nullable ApiContext*) apiContext completionHandler:(completionHandler)completionHandler{
    if(request.query == nil){
        completionHandler(nil, [self getError:@"query" errorType:ArgError]);
        return;
    }
    [self queryAutocompleteServices: [request toDictionary] withApiContext:apiContext completionHandler:^(id result, NSError* error){
        completionHandler(result, error);
    }];
}

-(void) geocode: (GeocodeRequest*) request completionHandler:(completionHandler)completionHandler{
    if(request.address == nil){
        completionHandler(nil, [self getError:@"address" errorType:ArgError]);
        return;
    }
    [self geocodeServices: [request toDictionary] withApiContext:nil completionHandler:^(id result, NSError* error){
        completionHandler(result, error);
    }];
}

-(void) geocodeWithApiContext: (GeocodeRequest*) request apiContext: (nullable ApiContext*) apiContext completionHandler:(completionHandler)completionHandler{
    if(request.address == nil){
        completionHandler(nil, [self getError:@"address" errorType:ArgError]);
        return;
    }
    [self geocodeServices: [request toDictionary] withApiContext:apiContext completionHandler:^(id result, NSError* error){
        completionHandler(result, error);
    }];
}

-(void) reverseGeocode: (ReverseGeocodeRequest*) request completionHandler:(completionHandler)completionHandler{
    if(request.location == nil){
        completionHandler(nil, [self getError:@"location" errorType:ArgError]);
        return;
    }
    
    [self reverseGeocodeServices: [request toDictionary] withApiContext:nil completionHandler:^(id result, NSError* error){
        completionHandler(result, error);
    }];
}

-(void) reverseGeocodeWithApiContext: (ReverseGeocodeRequest*) request apiContext: (nullable ApiContext*) apiContext completionHandler:(completionHandler)completionHandler{
    if(request.location == nil){
        completionHandler(nil, [self getError:@"location" errorType:ArgError]);
        return;
    }
    
    [self reverseGeocodeServices: [request toDictionary] withApiContext:apiContext completionHandler:^(id result, NSError* error){
        completionHandler(result, error);
    }];
}

-(void) timezone: (TimezoneRequest*) request completionHandler:(completionHandler)completionHandler{
    if(request.location == nil){
        completionHandler(nil, [self getError:@"location" errorType:ArgError]);
        return;
    }
    if(request.timestamp == nil){
        completionHandler(nil, [self getError:@"timestamp" errorType:ArgError]);
        return;
    }
    [self timezoneServices: [request toDictionary] withApiContext:nil completionHandler:^(id result, NSError* error){
        completionHandler(result, error);
    }];
}

-(void) timezoneWithApiContext: (TimezoneRequest*) request apiContext: (nullable ApiContext*) apiContext completionHandler:(completionHandler)completionHandler{
    if(request.location == nil){
        completionHandler(nil, [self getError:@"location" errorType:ArgError]);
        return;
    }
    if(request.timestamp == nil){
        completionHandler(nil, [self getError:@"timestamp" errorType:ArgError]);
        return;
    }
    [self timezoneServices: [request toDictionary] withApiContext:apiContext completionHandler:^(id result, NSError* error){
        completionHandler(result, error);
    }];
}

-(void) createServices: (NSDictionary * ) params withApiContext:(nullable ApiContext *)apiContext maxRetry: (int) retryCount retryInterval: (double) retryDelay serviceType:(ApiCall)serviceType completionHandler:(completionHandler)completionHandler{
    if (retryCount <= 0) {
           return;
       }
    retryCount--;
    retryDelay = retryDelay * 1.5;
    
    [self setTimeout:apiContext];
    [self setRequestWith:&serviceType params:params apiContext:apiContext];
    
    __weak typeof (self) weakSelf = self;
    NSURLSessionDataTask *postDataTask = [_session dataTaskWithRequest:_request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"Called Response: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
        if (error) {
            NSLog(@"httpResponse StatusCode: %@", error);
            completionHandler(nil, error);
            return;
        }
        
        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
            if (statusCode == 200){
                completionHandler(data, nil);
            }else if (statusCode >= 500) {
                dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, retryDelay * NSEC_PER_SEC);

                dispatch_after(delay, [weakSelf delegateQueue], ^(void){
                    [weakSelf createServices:params withApiContext:apiContext maxRetry:retryCount retryInterval: retryDelay serviceType:serviceType completionHandler:completionHandler];
                });
                return;
            }else{
                //Error
                completionHandler(nil,[NSError errorWithDomain:@"HuaweiSite"
                                                           code: ApiError
                                                      userInfo:@{NSLocalizedDescriptionKey : NSLocalizedString([[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding], nil)}]);
            }
        }
        
        completionHandler(data, error);
    }];
    
    [postDataTask resume];
}

//MARK: Private Functions

-(int) getMaxRetryWithApiContext: (ApiContext *) apiContext{
    NSNumber *maxRet = self.maxRetry;
    if(apiContext != nil && apiContext.maxRetry != nil){
        maxRet = apiContext.maxRetry;
    }
    return [maxRet intValue];
}

-(double) getRetryInterval: (ApiContext *) apiContext{
    NSNumber *retryInt = self.retryInterval;
    if(apiContext != nil && apiContext.retryInterval != nil){
        retryInt = apiContext.retryInterval;
    }
    return [retryInt doubleValue];
}

-(void) setTimeout: (ApiContext *) apiContext{
    if(apiContext != nil && apiContext.timeoutInterval != nil){
        self.configuration.timeoutIntervalForRequest = [apiContext.timeoutInterval intValue];
    }else if(_sharedApiContext.timeoutInterval != nil && [_sharedApiContext.timeoutInterval intValue] != 60){
        self.configuration.timeoutIntervalForRequest = [apiContext.timeoutInterval intValue];
    }
}

-(NSError*) getError: (NSString *) param errorType: (ErrorCaseType) errorType{
    NSString * message = [NSString stringWithFormat:@"%@ parameter cannot be nil.", param];
    return [NSError errorWithDomain:@"HuaweiSite"
                                         code: ArgError
                                     userInfo:@{NSLocalizedDescriptionKey : NSLocalizedString(message, nil)}];
}

-(void) setRequestWith: (ApiCall *) serviceType params:(NSDictionary * ) params apiContext: (nullable ApiContext*) apiContext{
    NSError *error;
    self.request= [NSMutableURLRequest requestWithURL:[self getUrlWithApiCall:*serviceType apiContext:apiContext]];
    
    [_request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [_request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [_request setHTTPMethod:@"POST"];
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
    [_request setHTTPBody:postData];
}

-(void) textSearchServices: (NSDictionary * ) params withApiContext:(nullable ApiContext *)apiContext completionHandler:(completionHandler)completionHandler{
    [self createServices:params withApiContext:apiContext maxRetry:[self getMaxRetryWithApiContext:apiContext] retryInterval: [self getRetryInterval:apiContext] serviceType:textSearch completionHandler:^(id data, NSError* error) {
        if (data){
            TextSearchResponse *textSearchResponse = [[TextSearchResponse alloc] initWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]];
            completionHandler(textSearchResponse, nil);
        }
        
        if (error){
            completionHandler(nil, error);
        }
    }];
    
}

-(void) nearbySearchServices: (NSDictionary * ) params withApiContext:(nullable ApiContext *)apiContext completionHandler:(completionHandler)completionHandler{
    [self createServices:params withApiContext:apiContext maxRetry:[self getMaxRetryWithApiContext:apiContext] retryInterval: [self getRetryInterval:apiContext] serviceType:nearbySearch completionHandler:^(id data, NSError* error) {
        if (data){
            NearbySearchResponse *response = [[NearbySearchResponse alloc] initWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]];
            completionHandler(response, error);
        }
        
        if (error){
            completionHandler(nil, error);
        }
    }];
}

-(void) detailSearchServices: (NSDictionary * ) params withApiContext:(nullable ApiContext *)apiContext completionHandler:(completionHandler)completionHandler{
    [self createServices:params withApiContext:apiContext maxRetry:[self getMaxRetryWithApiContext:apiContext] retryInterval: [self getRetryInterval:apiContext] serviceType:detailSearch completionHandler:^(id data, NSError* error) {
        if (data){
            DetailSearchResponse *response = [[DetailSearchResponse alloc] initWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]];
            completionHandler(response, error);
        }
        
        if (error){
            completionHandler(nil, error);
        }
    }];
}

-(void) querySuggestionServices: (NSDictionary * ) params withApiContext:(nullable ApiContext *)apiContext completionHandler:(completionHandler)completionHandler{
    [self createServices:params withApiContext:apiContext maxRetry:[self getMaxRetryWithApiContext:apiContext] retryInterval: [self getRetryInterval:apiContext] serviceType:querySuggestion completionHandler:^(id data, NSError* error) {
        if (data){
            QuerySuggestionResponse *response = [[QuerySuggestionResponse alloc] initWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]];
            completionHandler(response, error);
        }
        
        if (error){
            completionHandler(nil, error);
        }
    }];
}

-(void) queryAutocompleteServices: (NSDictionary * ) params withApiContext:(nullable ApiContext *)apiContext completionHandler:(completionHandler)completionHandler{
    [self createServices:params withApiContext:apiContext maxRetry:[self getMaxRetryWithApiContext:apiContext] retryInterval: [self getRetryInterval:apiContext] serviceType:querySuggestion completionHandler:^(id data, NSError* error) {
        if (data){
            QueryAutocompleteResponse *response = [[QueryAutocompleteResponse alloc] initWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]];
            completionHandler(response, error);
        }
        
        if (error){
            completionHandler(nil, error);
        }
    }];
}

-(void) geocodeServices: (NSDictionary * ) params withApiContext:(nullable ApiContext *)apiContext completionHandler:(completionHandler)completionHandler{
    [self createServices:params withApiContext:apiContext maxRetry:[self getMaxRetryWithApiContext:apiContext] retryInterval: [self getRetryInterval:apiContext] serviceType:geocode completionHandler:^(id data, NSError* error) {
        if (data){
            GeocodeResponse *response = [[GeocodeResponse alloc] initWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]];
            completionHandler(response, error);
        }
        
        if (error){
            completionHandler(nil, error);
        }
    }];
}

-(void) reverseGeocodeServices: (NSDictionary * ) params withApiContext:(nullable ApiContext *)apiContext completionHandler:(completionHandler)completionHandler{
    [self createServices:params withApiContext:apiContext maxRetry:[self getMaxRetryWithApiContext:apiContext] retryInterval: [self getRetryInterval:apiContext] serviceType:reverseGeocode completionHandler:^(id data, NSError* error) {
        if (data){
            ReverseGeocodeResponse *response = [[ReverseGeocodeResponse alloc] initWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]];
            completionHandler(response, error);
        }
        
        if (error){
            completionHandler(nil, error);
        }
    }];
}

-(void) timezoneServices: (NSDictionary * ) params withApiContext:(nullable ApiContext *)apiContext completionHandler:(completionHandler)completionHandler{
    [self createServices:params withApiContext:apiContext maxRetry:[self getMaxRetryWithApiContext:apiContext] retryInterval: [self getRetryInterval:apiContext] serviceType:getTimezone completionHandler:^(id data, NSError* error) {
        if (data){
            TimezoneResponse *response = [[TimezoneResponse alloc] initWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]];
            completionHandler(response, error);
        }
        
        if (error){
            completionHandler(nil, error);
        }
    }];
}

- (NSURL*)getUrlWithApiCall:(ApiCall)type apiContext: (nullable ApiContext*) apiContext{
    NSString *scheme = _sharedApiContext.apiScheme;
    NSString *baseUrl = _sharedApiContext.baseUrl;
    NSString *apiKey = _sharedApiContext.apiKey;
    if(apiContext != nil){
        if(apiContext.apiScheme != nil){
            scheme = apiContext.apiScheme;
        }
        if(apiContext.baseUrl != nil){
            baseUrl = apiContext.baseUrl;
        }
        if(apiContext.apiKey != nil){
            apiKey = apiContext.apiKey;
        }
    }
    NSURL *newUrl = [NSURL URLWithString:[NSString stringWithFormat: @"%@://%@/%@/", scheme, baseUrl, @"mapApi/v1/siteService"]];
    NSString *baseUrlLink = [NSString stringWithFormat:@"%@://%@/%@/",scheme, baseUrl, @"mapApi/v1/siteService"];
    NSString *timezoneBaseUrlLink = [NSString stringWithFormat:@"%@://%@/%@/", scheme, baseUrl, @"mapApi/v1/timezoneService"];
    
    switch(type) {
        case textSearch:
            return [NSURL URLWithString:[NSString stringWithFormat: @"%@%@?key=%@", baseUrlLink, @"searchByText", apiKey]];
        case nearbySearch:
            return [NSURL URLWithString:[NSString stringWithFormat: @"%@%@?key=%@", baseUrlLink, @"nearbySearch", apiKey]];
        case detailSearch:
            return [NSURL URLWithString:[NSString stringWithFormat: @"%@%@?key=%@", baseUrlLink, @"searchById", apiKey]];
        case querySuggestion:
            return [NSURL URLWithString:[NSString stringWithFormat: @"%@%@?key=%@", baseUrlLink, @"querySuggestion", apiKey]];
        case queryAutocomplete:
            return [NSURL URLWithString:[NSString stringWithFormat: @"%@%@?key=%@", baseUrlLink, @"queryAutoComplete", apiKey]];
        case geocode:
            return [NSURL URLWithString:[NSString stringWithFormat: @"%@%@?key=%@", baseUrlLink, @"geocode", apiKey]];
        case reverseGeocode:
            return [NSURL URLWithString:[NSString stringWithFormat: @"%@%@?key=%@", baseUrlLink, @"reverseGeocode", apiKey]];
        case getTimezone:
            return [NSURL URLWithString:[NSString stringWithFormat: @"%@%@?key=%@", timezoneBaseUrlLink, @"getTimezone", apiKey]];
        default:
            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
    }
    
    return newUrl;
}

@end
