## map_services_java

![Apache-2.0](https://img.shields.io/badge/license-Apache-blue)

## Table of Contents

* [Introduction](#introduction)
* [Installation](#installation)
* [Configuration ](#configuration)
* [Supported Environments](#supported-environments)
* [Sample Code](# Sample Code)
* [Support](#Support)
* [License](#license)

## Introduction

map_services_java is a set of APIs provided by the location service for third-party developers in client library mode. The APIs can be used to develop services related to location search, geocoding, and time zone obtaining.

- Keyword search: Searches for places, such as tourist attractions, enterprises, and schools, based on a user's input keyword and optional coordinate bounds.
- Nearby place search: Searches for places in a specified region. You can optimize the search result by providing keywords or specifying the type of the places to find.
- Place detail search: Obtains detailed address of a place based on its unique ID.
- Place search suggestion: Provides suggested places when a user enters a search keyword. A maximum of 5 suggested places can be displayed.
- Forward geocoding: Obtains spatial coordinates (such as the longitude and latitude) of a place based on its address. A maximum of 10 records can be returned.
- Reverse geocoding: Obtains the detailed address of a place within 200 meters around the device location based on the place's longitude and latitude. A maximum of 11 records can be returned.
- Autocomplete：Returns a list of suggested places based on the entered keyword.
- Time zone search: Obtains the time zone of a place based on its longitude and latitude.

## Installation
Before using Java sample code, check whether the Java environment has been installed. 

## Configuration
You can add the library to your project via Gradle.

```groovy
repositories {
    mavenCentral()
}

dependencies {
    implementation 'com.huawei.hms:map_services_java:(insert latest version)'
}
```

## Supported Environments

JDK version >= 1.8 is recommended.

## Sample Code

This example uses the keyword search interface to demonstrate the function.

1). Generating the SearchService instance based on the apiKey
```java
ApiContext apiContext = ApiContext.builder()
    .baseUrl("https://siteapi.cloud.huawei.com")
    .apiKey("Your API key") // please replace "Your API key" with apiKey field value in
    .build();
	
SearchService searchService = SearchServiceFactory.create(apiContext);
```

2). Invoke the keyword search interface based on the SearchService instance.
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

## Support

If you have any questions or comments during use, welcome to make suggestions or exchange here: https://github.com/huaweicodelabs/map-services-java/issues

##  License

Apache License 2.0

map_services_java is licensed under the [Apache License, version 2.0](http://www.apache.org/licenses/LICENSE-2.0).
