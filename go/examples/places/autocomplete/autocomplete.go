// Copyright 2021. Huawei Technologies Co., Ltd. All rights reserved.

// Licensed under the Apache License, Version 2.0 (the "License")
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     https://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package main

import (
    "context"
    "fmt"
    "net/url"

    maps "codehub-g.huawei.com/Petal-Maps/huawei-maps-services-go"
)

var (
    ApiKey   = "Api key here.."
    Query    = "station"
    Location = &maps.Coordinate{Lat: 43.8739168, Lng: 10.252502}
    Radius   = 10000
    Bounds = &maps.CoordinateBounds{
        Southwest: maps.Coordinate{
            Lat: 42.87264496679441,
            Lng: 9.25073768878106,
        },
        Northeast: maps.Coordinate{
            Lat: 44.875188633205596,
            Lng: 11.25426631121894,
        },
    }
    PoiTypes    = []string{"GEOCODE", "ESTABLISHMENT"}
    CountryCode = "IT"
    Language    = "en"
    Children    = true
)

func main() {
    encodedApiKey := url.QueryEscape(ApiKey)
    client := maps.NewClient(maps.WithAPIKey(encodedApiKey))

    res, err := client.Autocomplete(context.Background(), &maps.AutocompleteRequest{
        Query:    Query,
        Location: Location,
        Radius:   Radius,
        Language: Language,
        Children: Children})

    if err != nil {
        panic(err)
    }

    fmt.Println(res)
}
