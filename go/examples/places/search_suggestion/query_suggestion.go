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
    // APIKey insert api key here
    APIKey = "Api key here.."

    // Query search keyword.
    Query = "Piazzale Dante"

    // Location current location of a user.
    Location = &maps.Coordinate{Lng: 10.252502, Lat: 43.8739168}

    // Language in which search results are displayed.
    Language = "en"

    // Children Indicates whether to return information about the child node.
    Children = true
)

func main() {
    key := url.QueryEscape(APIKey)
    client := maps.NewClient(maps.WithAPIKey(key))

    res, err := client.QuerySuggestion(context.Background(), &maps.QuerySuggestionRequest{
        Query:    Query,
        Location: Location,
        Language: Language,
        Children: Children})

    if err != nil {
        panic(err)
    }

    fmt.Println(res)
}
