# huawei-maps-services-js

## Introduction

Site Kit provides a set of HTTP APIs, with which you can easily develop functions such as keyword search, nearby place search, place detail search, place search suggestion, forward geocoding, reverse geocoding, timezone search and autocomplete. This Node.js client provides access to HUAWEI Site HTTP APIs from Node.js applications.

For details please refer to [Official Documentation](https://developer.huawei.com/consumer/en/doc/development/HMSCore-Guides/web-api-introduction-0000001050162828) 

- ### Site API

    - [Keyword Search](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-keyword-search-0000001050161916-V5)
    - [Nearby Search](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-nearby-search-0000001050163873-V5)
    - [Place Detail Search](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-detail-search-0000001050161918-V5)
    - [Geocoding](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-forward-geo-0000001050163921-V5)
    - [Reverse Geocoding](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-reverse-geo-0000001050161968-V5)
    - [Place Search Suggestion](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-query-suggestion-0000001050161966-V5)
    - [Autocomplete](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/autocomplete-0000001052250492-V5)
    - [Time Zone Search](https://developer.huawei.com/consumer/en/doc/development/HMSCore-References-V5/webapi-time-zone-0000001050161920-V5)

## Getting Started

Following code is a simple example to Huawei Site Kit Node.js client usage by requesting ***textSearch*** method on the client class.

Initialize the client with client configuration, this configuration's parameters, except API_KEY, have default values.

> ***Note:** You need to call the encodeURIComponent("yourApiKey") method to encode the API key. For example, if the original API key is **ABC/DFG+**, the conversion result is **ABC%2FDFG%2B**.*

```ts
import { Client, TextSearchRequest, RetryOpts, ClientConfig, HwLocationType, Language } from "@hwpay/huawei-map-services-js";
const retryOpts: RetryOpts = {
  maxRetry: 4, //default value 1
  retryInterval: 2000, // default value 1000
}
const clientConfig: ClientConfig = {
  apiKey: encodeURIComponent("yourApiKey"),
  timeout: 90000, // default value 100000
  retryOpts: retryOpts,
};
const client = new Client(clientConfig);

//Make an API call with request input:
const request: TextSearchRequest = {
  query: "hotel",
  location: {
    lng: 3.159491,
    lat: 50.705085,
  },
  radius: 500,
  hwPoiType: HwLocationType.HOTEL,
  countryCode: "FR",
  language: Language.en,
  pageIndex: 1,
  pageSize: 1,
  children: true,
};
client.textSearch(request)
    .then(result => console.log(result))
    .catch(error => console.error(error));
```
## Questions or Issues

If you have questions about how to use HMS samples, try the following options:

- [Stack Overflow](https://stackoverflow.com/questions/tagged/huawei-mobile-services) is the best place for any programming questions. Be sure to tag your question with **huawei-mobile-services**.
- [Huawei Developer Forum](https://forums.developer.huawei.com/forumPortal/en/home) is great for general questions, or seeking recommendations and opinions.
- [Huawei Developer Docs](https://developer.huawei.com/consumer/en/) is place to official documentation for all clients, you can find detailed documentations in there.

## Licensing and Terms

Huawei Site Node.js Client is licensed under the [Apache 2.0 license](LICENSE).