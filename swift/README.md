# Swift Client for Huawei Site Services

## Introduction

Site Kit provides a set of HTTP APIs, with which you can easily develop functions such as keyword search, nearby place search, place detail search, place search suggestion, forward geocoding, reverse geocoding, timezone search and autocomplete. HuaweiSite Swift client provides access to HUAWEI Site HTTP APIs from iOS applications.

For details please refer to [Official Documentation](https://developer.huawei.com/consumer/en/doc/development/HMSCore-Guides/web-api-introduction-0000001050162828) 

- ### Places API

    - [Keyword Search](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-keyword-search-0000001050161916-V5)
    - [Nearby Search](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-nearby-search-0000001050163873-V5)
    - [Place Detail Search](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-detail-search-0000001050161918-V5)
    - [Place Search Suggestion](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-query-suggestion-0000001050161966-V5)
    - [Autocomplete](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/autocomplete-0000001052250492-V5)

- ### Geocode API

    - [Geocoding](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-forward-geo-0000001050163921-V5)
    - [Reverse Geocoding](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-reverse-geo-0000001050161968-V5)

- ### Timezone API

    - [Time Zone Search](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-time-zone-0000001050161920-V5)


## Getting Started

1. Download the [SDK source file](/HuaweiSite.xcframework.zip)

2. Unpack the source file

3. Drag HuaweiSite.xcframework to the Frameworks, Libraries and Embedded Content section of your project target.

Following code is a simple example to Huawei Site swift client usage by requesting ***detail_search*** method on the client class.

Initialize the **SiteClient** with client configuration, this configuration's parameters, **except API_KEY**, have default values.

> ***Note:** You need to encode the API key. For example, if the original API key is **ABC/DFG+**, the conversion result is **ABC%2FDFG%2B**.*


```swift
import HuaweiSite

private let siteClient: SiteClient = SiteClient.shared

/// Before you start using the HuaweiSite SDK, you need to set apiContext instance.
/// Before you start using the HuaweiSite SDK, you need to set apiContext instance.
/// By default,
/// - ApiScheme = "https"
/// - BaseUrl = "siteapi.cloud.huawei.com"
/// - ApiKey = "" ### Mandatory ###
/// - maxRetry = Default Max Retry for each api call-> 3
/// - retryInterval = Default Retry Interval -> Starts with one second then multiplies with 1.5 with each call
/// - timeoutInterval = If during a connection attempt the request remains idle for longer than the timeout interval, the request is considered to have timed out. The default timeout interval is 60 seconds.
let key = "<<YOUR_API_KEY>>"
if let encodedKey = key.addingPercentEncoding(withAllowedCharacters: .alphanumerics){
    let apiContext: ApiContext = ApiContext()
        .set(apiKey: encodedKey)
        .set(maxRetry: 5)
        .set(retryInterval: 2.0)
        .set(timeoutInterval: 2.0)
        .build()
}

let request = DetailSearchRequest(siteId: "EB731B7298F1E2EEDC42532CFD3B8E32", language: "en", children: true)
siteClient.detailSearch(with: request){[weak self] (result, error) in
    guard self != nil else {return}
    if let error = error {
        print(error)
        return
    }
    if let result = result{
        print(result)
    }
}


//You may also use custom api context for one call only.
let customApiContext:ApiContext = ApiContext()
    .set(maxRetry: 5)
    .set(retryInterval: 2)
    .set(timeoutInterval: 2).build()
let request: TextSearchRequest = TextSearchRequest(query: "hotel", location: Coordinate(lat: 50.705085, lng:3.159491), radius: 500, hwPoiType: HwLocationType.HOTEL, countryCode: "FR", language: "en", pageSize: 1, pageIndex: 1, children: true)
siteClient.textSearch(with: request, apiContext: customApiContext){[weak self] (result, error) in
    guard self != nil else {return}
    if let error = error {
        self?.showAlert(title: "Error", message: error.localizedDescription)
        return
    }
    if let result = result {
        print(result)
        self?.showAlert(title: "TextSearchResponse", message: "Success!")
    }
}
```

For further examples, please refer to [HuaweiSiteSwiftDemo App](/HuaweiSiteSwiftDemo) and [HuaweiSite Unit Tests](/HuaweiSite/HuaweiSiteTests).

## Questions or Issues

If you have questions about how to use HMS samples, try the following options:

- [Stack Overflow](https://stackoverflow.com/questions/tagged/huawei-mobile-services) is the best place for any programming questions. Be sure to tag your question with **huawei-mobile-services**.
- [Huawei Developer Forum](https://forums.developer.huawei.com/forumPortal/en/home) is great for general questions, or seeking recommendations and opinions.
- [Huawei Developer Docs](https://developer.huawei.com/consumer/en/) is place to official documentation for all clients, you can find detailed documentations in there.

## Licensing and Terms

Huawei Site Swift Client is licensed under the [Apache 2.0 license](LICENSE).
