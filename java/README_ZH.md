## map_services_java

![Apache-2.0](https://img.shields.io/badge/license-Apache-blue)

中文 | [English](https://github.com/huaweicodelabs/Maps-utils-android/blob/master/java/README.md)

## 目录

* [简介](#简介)
* [使用要求](#使用要求)
* [安装说明](#安装说明)
* [示例代码](#示例代码)
* [支撑](#支撑)
* [授权许可](#授权许可)

## 简介

map_services_java是位置服务以Client Library形式为第三方开发者提供的一套接口，可用于开发位置搜索、地理编码、获取时区相关的服务。
位置服务Java Client库支持以下接口功能：

- [关键字搜索](https://developer.huawei.com/consumer/cn/doc/development/HMSCore-References/webapi-keyword-search-0000001050161916)
- [周边搜索](https://developer.huawei.com/consumer/cn/doc/development/HMSCore-References/webapi-nearby-search-0000001050163873)
- [地点详情](https://developer.huawei.com/consumer/cn/doc/development/HMSCore-References/webapi-detail-search-0000001050161918)
- [地点搜索建议](https://developer.huawei.com/consumer/cn/doc/development/HMSCore-References/webapi-query-suggestion-0000001050161966)
- [自动补全](https://developer.huawei.com/consumer/cn/doc/development/HMSCore-References/autocomplete-0000001052250492)
- [正地理编码](https://developer.huawei.com/consumer/cn/doc/development/HMSCore-References/webapi-forward-geo-0000001050163921)
- [逆地理编码](https://developer.huawei.com/consumer/cn/doc/development/HMSCore-References/webapi-reverse-geo-0000001050161968)
- [获取时区](https://developer.huawei.com/consumer/cn/doc/development/HMSCore-References/webapi-time-zone-0000001050161920)

## 使用要求

- JDK版本号1.8及以上。
- 在AppGallery Connect上[获取API key](https://developer.huawei.com/consumer/cn/doc/development/HMSCore-Guides/client-library-0000001104033088#section527610250284)。


## 安装说明
您可以通过下载源码将Java Client库添加到您的项目中。

## 示例代码

本示例将结合关键字搜索接口提供演示。

1). 结合apiKey生成SearchService实例
```java
ApiContext apiContext = ApiContext.builder()
    .baseUrl("https://siteapi.cloud.huawei.com")
    .apiKey("Your API key")
    .build();
	
SearchService searchService = SearchServiceFactory.create(apiContext);
```

2). 根据SearchService实例调用关键字搜索接口
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

## 支撑

如果你在使用过程中有任何问题或建议，欢迎访问如下链接给出你的建议或与我们交流：https://github.com/huaweicodelabs/Maps-utils-android/issues

## 授权许可

Apache License 2.0

位置服务Java Client代码经过[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html)授权许可。
