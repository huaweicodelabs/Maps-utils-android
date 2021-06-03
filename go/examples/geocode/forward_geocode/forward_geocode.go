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
    Address  = "Piazzale Dante, 41, 55049 Viareggio, Tuscany, Italy"
    Language = "en"
)

func main() {
    encodedApiKey := url.QueryEscape(ApiKey)
    client := maps.NewClient(maps.WithAPIKey(encodedApiKey))

    res, err := client.ForwardGeocode(context.Background(), &maps.ForwardGeocodeRequest{
        Address:  Address,
        Language: Language})

    if err != nil {
        panic(err)
    }

    fmt.Println(res)
}
