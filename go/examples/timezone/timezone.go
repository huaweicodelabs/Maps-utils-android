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
    apiKey          = "Api key here.."
    timestamp int64 = 1577435043
    language        = "en"
    location        = &maps.Coordinate{Lat: 12.242585, Lng: 30.23235}
)

func main() {
    encodedApiKey := url.QueryEscape(apiKey)
    client := maps.NewClient(maps.WithAPIKey(encodedApiKey))

    res, err := client.GetTimezone(context.Background(), &maps.TimezoneRequest{Location: location, Timestamp: timestamp, Language: language})

    if err != nil {
        panic(err)
    }

    fmt.Println(res)
}
