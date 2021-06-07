## map_services_java

![Apache-2.0](https://img.shields.io/badge/license-Apache-blue)

English | [中文](https://github.com/huaweicodelabs/Maps-utils-android/blob/master/java/README_ZH.md)

## Contents

* [Introduction](#introduction)
* [Usage Requirements](#usage-requirements)
* [Installation Description](#installation-description)
* [Sample Code](#sample-code)
* [Support](#support)
* [License](#license)

Introduction
-------

map_services_java is a set of APIs that Site Kit provides in client library mode for you to develop services related to place search, geocoding, and time zone search.
The Java Client library of Site Kit supports functionality in the following APIs:

- [Keyword search](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-keyword-search-0000001050161916-V5)
- [Nearby place search](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-nearby-search-0000001050163873-V5)
- [Place detail search](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-detail-search-0000001050161918-V5)
- [Place search suggestion](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-query-suggestion-0000001050161966-V5)
- [Autocomplete](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/autocomplete-0000001052250492-V5)
- [Forward geocoding](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-forward-geo-0000001050163921-V5)
- [Reverse geocoding](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-reverse-geo-0000001050161968-V5)
- [Time zone search](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-time-zone-0000001050161920-V5)

Usage Requirements
-------

- The JDK version is 1.8 or later.
- [The API key](https://developer.huawei.com/consumer/en/doc/development/HMSCore-Guides-V5/client-library-0000001104033088-V5#EN-US_TOPIC_0000001104033088__section527610250284) has been obtained in AppGallery Connect.


Installation Description
-------
You can download the source code to add the Java Client library to your project. 

Sample Code
-------

The sample code provides a demo for the keyword search API.

1). Generate a SearchService instance using the API key.
```java
ApiContext apiContext = ApiContext.builder()
    .baseUrl("https://siteapi.cloud.huawei.com")
    .apiKey("Your API key")
    .build();
	
SearchService searchService = SearchServiceFactory.create(apiContext);
```

2). Call the keyword search API based on the SearchService instance.
```java
TextSearchRequest request = new TextSearchRequest();
request.setQuery("SQUARE");

searchService.textSearch(request, new SearchResultListener<TextSearchResponse>() {
    @Override
    public void onSearchResult(TextSearchResponse results) {
        System.out.println("textSearch is success.");
    }
    
    @Override
    public void onSearchError(SearchStatus status) {
        System.err.println("textSearch is failed.");
    }
});
```

Support
-------

If you have any questions or suggestions, please visit the following link to give your suggestions or contact us: https://github.com/huaweicodelabs/Maps-utils-android/issues

License
-------

Apache License 2.0

The Java Client sample code is licensed under [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html).
