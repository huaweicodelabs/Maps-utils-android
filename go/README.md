# Go Client for Huawei Site Services

## Introduction

Site Kit provides a set of HTTP APIs, with which you can easily develop functions such as keyword search, nearby place
search, place detail search, place search suggestion, forward geocoding, reverse geocoding, timezone search and
autocomplete. This Go client provides access to HUAWEI Site HTTP APIs from Go applications.

For details please refer
to [Official Documentation](https://developer.huawei.com/consumer/en/doc/development/HMSCore-Guides/web-api-introduction-0000001050162828)

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

You can install the go library like below:

```bash
go get codehub-g.huawei.com/HTRDC-Petal-Maps/huawei-maps-services-go
```

Following code is a simple example to Huawei Site go client usage by requesting ***nearby_search*** method on the client
class.

Initialize the client with client configuration, this configuration's parameters, except API_KEY, have default values.

> ***Note:** You need to encode the API key. For example, if the original API key is **ABC/DFG+**, the conversion result is **ABC%2FDFG%2B**.*

```go
package main

import (
	"context"
	"fmt"
	"net/url"

	maps "codehub-g.huawei.com/Petal-Maps/huawei-maps-services-go"
)

var (
    APIKey   = "Api key here.."
	Query    = "Piazzale Dante"
    Location = &maps.Coordinate{
		Lng: 10.252502,
		Lat: 43.8739168}
    Radius    = 5000
    HwPoiType = "NATIONAL_RAILWAY_STATION"
    Language  = "en"
    PageIndex = 1
    PageSize  = 1
)

func main() {
	key := url.QueryEscape(APIKey)
	client := maps.NewClient(maps.WithAPIKey(key))

	request := &maps.NearbySearchRequest{
		Query:     Query,
		Location:  Location,
		Radius:    Radius,
		HwPoiType: HwPoiType,
		Language:  Language,
		PageSize:  PageSize,
		PageIndex: PageIndex}

	res, err := client.NearbySearch(context.Background(), request)

	if err != nil {
		panic(err)
	}

	fmt.Println(res)
}
```

## Questions or Issues

If you have questions about how to use HMS samples, try the following options:

- [Stack Overflow](https://stackoverflow.com/questions/tagged/huawei-mobile-services) is the best place for any
  programming questions. Be sure to tag your question with **huawei-mobile-services**.
- [Huawei Developer Forum](https://forums.developer.huawei.com/forumPortal/en/home) is great for general questions, or
  seeking recommendations and opinions.
- [Huawei Developer Docs](https://developer.huawei.com/consumer/en/) is place to official documentation for all clients,
  you can find detailed documentations in there.

## Licensing and Terms

Huawei Site Go Client is licensed under the [Apache 2.0 license](LICENSE).
