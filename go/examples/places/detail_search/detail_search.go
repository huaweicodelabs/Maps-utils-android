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

const (
    ApiKey   = "Api key here.."
    SiteID   = "07A9FF43A715A1FEE041A167A8EAD043"
    Language = "en"
    Children = true
)

func main() {
    encodedApiKey := url.QueryEscape(ApiKey)
    client := maps.NewClient(maps.WithAPIKey(encodedApiKey))

    res, err := client.DetailSearch(context.Background(),
        &maps.DetailSearchRequest{
            SiteID:   SiteID,
            Language: Language,
            Children: Children})

    if err != nil {
        panic(err)
    }

    fmt.Println(res)

}
