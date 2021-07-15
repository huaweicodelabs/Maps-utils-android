# Python Client for Huawei Site Services

## Introduction

Site Kit provides a set of HTTP APIs, with which you can easily develop functions such as keyword search, nearby place search, place detail search, place search suggestion, forward geocoding, reverse geocoding, timezone search and autocomplete. This Python client provides access to HUAWEI Site HTTP APIs from Python applications.

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

You can install client library using pip: 

```bash
pip install huaweimaps
```

Following code is a simple example to Huawei Site python client usage by requesting ***detail_search*** method on the client class.

Initialize the client with client configuration, this configuration's parameters, except API_KEY, have default values.

> ***Note:** You need to encode the API key. For example, if the original API key is **ABC/DFG+**, the conversion result is **ABC%2FDFG%2B**.*


```py
import urllib.parse

from huaweimaps import Client


api_key = 'Api key here..'
encoded_key = urllib.parse.quote(api_key, 'UTF-8')

client = Client(api_key = encoded_key, # encoded api key
  timeout=5, # timeout for connection+read (seconds)
  connect_timeout=2.52, # connection timeout (seconds) needs requests>=2.4.0
  read_timeout=3.1, # read_timeout (seconds) needs requests>=2.4.0
  retry_interval= 1.0, # time is increasing after every retry this is the initial. (seconds)
  max_retry=1 # how many retries the client will.
)

response = client.detail_search(site_id= 'EB731B7298F1E2EEDC42532CFD3B8E32', language= 'en')
print(response)
```


## Questions or Issues

If you have questions about how to use HMS samples, try the following options:

- [Stack Overflow](https://stackoverflow.com/questions/tagged/huawei-mobile-services) is the best place for any programming questions. Be sure to tag your question with **huawei-mobile-services**.
- [Huawei Developer Forum](https://forums.developer.huawei.com/forumPortal/en/home) is great for general questions, or seeking recommendations and opinions.
- [Huawei Developer Docs](https://developer.huawei.com/consumer/en/) is place to official documentation for all clients, you can find detailed documentations in there.

## Licensing and Terms

Huawei Site Python Client is licensed under the [Apache 2.0 license](LICENSE).
