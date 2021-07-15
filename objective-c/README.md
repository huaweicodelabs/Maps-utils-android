# ObjC Client for Huawei Site Services

## Introduction

Site Kit provides a set of HTTP APIs, with which you can easily develop functions such as keyword search, nearby place search, place detail search, place search suggestion, forward geocoding, reverse geocoding, timezone search and autocomplete. HuaweiSite ObjC client provides access to HUAWEI Site HTTP APIs from iOS applications.

For details please refer to [Official Documentation](https://developer.huawei.com/consumer/en/doc/development/HMSCore-Guides/web-api-introduction-0000001050162828) 

- ### Places API

    - [Keyword Search](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References/webapi-keyword-search-0000001050161916)
    - [Nearby Search](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References/webapi-nearby-search-0000001050163873)
    - [Place Detail Search](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References/webapi-detail-search-0000001050161918)
    - [Place Search Suggestion](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References/webapi-query-suggestion-0000001050161966)
    - [Autocomplete](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References/autocomplete-0000001052250492)

- ### Geocode API

    - [Geocoding](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References/webapi-forward-geo-0000001050163921)
    - [Reverse Geocoding](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References/webapi-reverse-geo-0000001050161968)

- ### Timezone API

    - [Time Zone Search](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References/webapi-time-zone-0000001050161920)


## Getting Started

1. Download the [SDK source file](/HuaweiSiteObjc.xcframework.zip)

2. Unpack the source file

3. Drag HuaweiSiteObjc.xcframework to the Frameworks, Libraries and Embedded Content section of your project target.

Following code is a simple example to Huawei Site objective-c client usage by requesting ***detail_search*** method on the client class.

Initialize the **SiteClient** with client configuration, this configuration's parameters, **except API_KEY**, have default values.

> ***Note:** You need to encode the API key. For example, if the original API key is **ABC/DFG+**, the conversion result is **ABC%2FDFG%2B**.*


```objc
#import <HuaweiSiteObjc/SiteClient.h>

// Before you start using the HuaweiSite SDK, you need to set apiContext instance.
NSString *apiKey = [NSString stringWithCString:"<<YOUR_API_KEY>>" encoding:NSUTF8StringEncoding];
NSString *encodedApiKey = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(nil,(CFStringRef)apiKey,nil,(CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8 ));
/// By default,
/// - ApiScheme = "https"
/// - BaseUrl = "siteapi.cloud.huawei.com"
/// - ApiKey = ### Mandatory ###
/// - maxRetry = Default Max Retry for each api call-> 3
/// - retryInterval = Default Retry Interval -> Starts with one second then multiplies with 1.5 with each call
/// - timeoutInterval = If during a connection attempt the request remains idle for longer than the timeout interval, the request is considered to have timed out. The default timeout interval is 60 seconds.
NSNumber *maxRetry = [NSNumber numberWithInt:5];
NSNumber *retryInterval = [NSNumber numberWithDouble:2.0];
NSNumber *timeoutInterval = [NSNumber numberWithInt:120];
ApiContext *apiContext = [ApiContext alloc];
apiContext.apiKey = encodedApiKey;
apiContext.maxRetry = maxRetry;
apiContext.retryInterval = retryInterval;
apiContext.timeoutInterval = timeoutInterval;
[SiteClient provideApiContext:apiContext];

self.siteClient = [SiteClient shared];

BOOL children = YES;
DetailSearchRequest *request = [[DetailSearchRequest alloc] initWithSiteId:@"EB731B7298F1E2EEDC42532CFD3B8E32" language:@"en" children:&children];
[self.siteClient detailSearch:request completionHandler:^(DetailSearchResponse* response, NSError* error) {
    if (response){
        NSLog(@"detailSearch success! %@", response);
    }
    
    if (error){
        NSLog(@"detailSearch error! %@", error);
    }
}];


//You may also use custom api context for one call only.
ApiContext *customApiContext = [ApiContext alloc];
NSNumber *maxRetry = [NSNumber numberWithInt:5];
NSNumber *retryInterval = [NSNumber numberWithDouble:2.0];
NSNumber *timeoutInterval = [NSNumber numberWithInt:120];
customApiContext.maxRetry = maxRetry;
customApiContext.retryInterval = retryInterval;
customApiContext.timeoutInterval = timeoutInterval;
//Below call will be made upon custom api context details.
DetailSearchRequest *requestWithCustomApiContext = [[DetailSearchRequest alloc] initWithSiteId:@"EB731B7298F1E2EEDC42532CFD3B8E32" language:@"en" children:&children];
[self.siteClient detailSearchWithApiContext:request apiContext:customApiContext completionHandler:^(DetailSearchResponse* response, NSError* error) {
    if (response){
        NSLog(@"detailSearch success! %@", response);
        [self showAlert: @"DetailSearchResponse" message:@"Success!"];
    }
    
    if (error){
        NSLog(@"detailSearch error! %@", error);
        [self showAlert: @"Error" message:error.localizedDescription];
    }
}];
```

For further examples, please refer to [HuaweiSiteObjCDemo App](/HuaweiSiteObjc).

## Questions or Issues

If you have questions about how to use HMS samples, try the following options:

- [Stack Overflow](https://stackoverflow.com/questions/tagged/huawei-mobile-services) is the best place for any programming questions. Be sure to tag your question with **huawei-mobile-services**.
- [Huawei Developer Forum](https://forums.developer.huawei.com/forumPortal/en/home) is great for general questions, or seeking recommendations and opinions.
- [Huawei Developer Docs](https://developer.huawei.com/consumer/en/) is place to official documentation for all clients, you can find detailed documentations in there.

## Licensing and Terms

Huawei Site ObjC Client is licensed under the [Apache 2.0 license](LICENSE).
