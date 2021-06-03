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

package maps

import "context"

var detailSearchConfig = &RequestConfig{
    Host: "https://siteapi.cloud.huawei.com",
    path: "mapApi/v1/siteService/searchById",
}

// DetailSearchRequest Request struct to use DetailSearch.
// SiteID parameter is mandatory.
type DetailSearchRequest struct {
    // Set request configurations.
    RequestConfig `json:"-"`

    // ID of a place.
    SiteID string `json:"siteId"`

    // Language in which search results are displayed.
    Language string `json:"language,omitempty"`

    // Indicates whether to return information about child nodes.
    Children bool `json:"children,omitempty"`
}

// DetailSearchResponse response struct returned from the server.
type DetailSearchResponse struct {
    baseResponse

    // Details about a place
    Site Site `json:"site"`
}

// DetailSearch Obtains details about a place based on its unique ID which serves as the primary key.
func (c *Client) DetailSearch(ctx context.Context, req *DetailSearchRequest) (*DetailSearchResponse, error) {

    if req.SiteID == "" {
        return nil, &argError{field: "SiteID", example: `SiteID: "EB731B7298F1E2EEDC42532CFD3B8E32"`}
    }

    config := req.RequestConfig.mergeWith(*detailSearchConfig)
    response := &DetailSearchResponse{}
    err := c.fetch(ctx, config, req, response)

    if err != nil {
        return nil, err
    }

    return response, nil
}

var nearbySearchConfig = &RequestConfig{
    Host: "https://siteapi.cloud.huawei.com",
    path: "mapApi/v1/siteService/nearbySearch",
}

// NearbySearchResponse response struct returned from the server.
type NearbySearchResponse struct {
    baseResponse

    // Total number of records returned upon a successfull search. If no record is found, 0 will be returned,
    TotalCount int `json:"totalCount"`

    // Search result returned upon a successfull search. If no record is found, an empty array will be returned.
    Sites []Site `json:"sites"`
}

// NearbySearchRequest request struct to use NearbySearch.
// Location is mandatory.
type NearbySearchRequest struct {
    // Set request configurations.
    RequestConfig `json:"-"`

    // Current location of a user.
    Location *Coordinate `json:"location"`

    // Search radius in meters. The value ranges from 1 to 50000.
    Radius int `json:"radius,omitempty"`

    // Search keyword.
    Query string `json:"query,omitempty"`

    // POI type of a place to search.
    PoiType string `json:"poiType,omitempty"`

    // HUAWEI POI type of a place to search.
    HwPoiType string `json:"hwPoiType,omitempty"`

    // Language in which search result are displayed.
    Language string `json:"language,omitempty"`

    // Number of records on each page. The value ranges from 1 to 20. Default value is 20.
    PageSize int `json:"pageSize,omitempty"`

    // Number of the current page. The value ranges from 1 to 60. The default value is 1.
    PageIndex int `json:"pageIndex,omitempty"`
}

// NearbySearch Searches for places in a specified nearby area.
// You can optimize the search result by providing keywords or specifying the type of the places to search.
func (c *Client) NearbySearch(ctx context.Context, req *NearbySearchRequest) (*NearbySearchResponse, error) {

    if req.Location == nil {
        return nil, newArgError("Location", "Location: &Coordinate{Lat:3.33, Lng:-2.3232}")
    }

    config := req.RequestConfig.mergeWith(*nearbySearchConfig)
    response := &NearbySearchResponse{}
    err := c.fetch(ctx, config, req, response)

    if err != nil {
        return nil, err
    }

    return response, nil
}

var textSearchConfig = &RequestConfig{
    Host: "https://siteapi.cloud.huawei.com",
    path: "mapApi/v1/siteService/searchByText",
}

// TextSearchRequest request struct to use TextSearch.
// Query parameter is mandatory.
type TextSearchRequest struct {
    // Set request configurations.
    RequestConfig `json:"-"`

    // Search keyword
    Query string `json:"query"`

    // Longitude and latitude to which search results need to be biased.
    Location *Coordinate `json:"location,omitempty"`

    // Search radius, in meters.
    Radius int `json:"radius,omitempty"`

    // POI type of a place to search.
    PoiType string `json:"poiType,omitempty"`

    // HWPoi type of a place to search.
    HwPoiType string `json:"hwPoiType,omitempty"`

    // Country/Region code, which complies with ISO 3166-1 alpha-2.
    CountryCode string `json:"countryCode,omitempty"`

    // Language in which search results are displayed.
    Language string `json:"language,omitempty"`

    // Number of records on each page.
    PageSize int `json:"pageSize,omitempty"`

    // Number of the current page.
    PageIndex int `json:"pageIndex,omitempty"`

    // Indicates whether to return information about the child node.
    Children bool `json:"children,omitempty"`
}

// TextSearchResponse response struct returned from the server.
type TextSearchResponse struct {
    baseResponse

    // Total number of records returned upon a successful search. If no record is found, 0 will be returned.
    TotalCount int `json:"totalCount"`

    // Search result returned upon a successful search. If no record is found, an empty array will be returned.
    Sites []Site `json:"sites"`
}

// TextSearch Searches for a place, such as a scenic spot, enterprise, or school, based on a user's input keyword and coordinate.
// Coordinate is optional.
func (c *Client) TextSearch(ctx context.Context, req *TextSearchRequest) (*TextSearchResponse, error) {

    if req.Query == "" {
        return nil, newArgError("Query", "Query: \"Piazzale Dante, 41, 55049 Viareggio, Tuscany, Italy\"")
    }

    config := req.RequestConfig.mergeWith(*textSearchConfig)
    response := &TextSearchResponse{}
    err := c.fetch(ctx, config, req, response)

    if err != nil {
        return nil, err
    }

    return response, nil
}

var querySuggestionConfig = &RequestConfig{
    Host: "https://siteapi.cloud.huawei.com",
    path: "mapApi/v1/siteService/querySuggestion",
}

// QuerySuggestionRequest request struct to use QuerySuggestion.
// Query parameter is mandatory.
type QuerySuggestionRequest struct {
    // Set request configurations.
    RequestConfig `json:"-"`

    // Search keyword
    Query string `json:"query"`

    // Longitude and latitude to which search results need to be biased.
    Location *Coordinate `json:"location,omitempty"`

    // Search radius, in meters.
    Radius int `json:"radius,omitempty"`

    // Coordinate bounds to which search results need to be biased.
    Bounds *CoordinateBounds `json:"bounds,omitempty"`

    // POI type of a place to search.
    PoiTypes []string `json:"poiTypes,omitempty"`

    // Country/Region code, which complies with ISO 3166-1 alpha-2.
    CountryCode string `json:"countryCode,omitempty"`

    // Language in which search results are displayed.
    Language string `json:"language,omitempty"`

    // Indicates whether to return information about the child node.
    Children bool `json:"children,omitempty"`
}

// QuerySuggestionResponse response struct returned from the server.
type QuerySuggestionResponse struct {
    baseResponse

    // Search result returned upon a successful search. If no record is found, an empty array will be returned.
    Sites []Site `json:"sites"`
}

// QuerySuggestion Provides suggested places when a user enters a search keyword.
// A maximum of 5 records can be returned.
func (c *Client) QuerySuggestion(ctx context.Context, req *QuerySuggestionRequest) (*QuerySuggestionResponse, error) {

    if req.Query == "" {
        return nil, newArgError("Query", "Query: \"Piazzale Dante\"")
    }

    config := req.RequestConfig.mergeWith(*querySuggestionConfig)
    response := &QuerySuggestionResponse{}
    err := c.fetch(ctx, config, req, response)

    if err != nil {
        return nil, err
    }

    return response, nil
}

var autocompleteConfig = &RequestConfig{
    Host: "https://siteapi.cloud.huawei.com",
    path: "mapApi/v1/siteService/queryAutoComplete",
}

// AutocompleteRequest request struct to use Autocomplete.
// Query parameter is mandatory.
type AutocompleteRequest struct {
    // Set request configurations.
    RequestConfig `json:"-"`

    // Search keyword
    Query string `json:"query"`

    // Longitude and latitude to which search results need to be biased.
    Location *Coordinate `json:"location,omitempty"`

    // Search radius, in meters.
    Radius int `json:"radius,omitempty"`

    // Language in which search results are displayed.
    Language string `json:"language,omitempty"`

    // Indicates whether to return information about the child node.
    Children bool `json:"children,omitempty"`
}

// AutocompleteResponse response struct returned from the server.
type AutocompleteResponse struct {
    baseResponse

    // Predicted place returned upon a successfull search.
    Predictions []AutocompletePrediction `json:"predictions"`

    // Autcomplete result returned upon a successfull search.
    Sites []Site `json:"sites"`
}

// Autocomplete Returns a list of suggested places based on the entered keyword.
func (c *Client) Autocomplete(ctx context.Context, req *AutocompleteRequest) (*AutocompleteResponse, error) {

    if req.Query == "" {
        return nil, newArgError("Query", "Query: \"station\"")
    }

    config := req.RequestConfig.mergeWith(*autocompleteConfig)
    response := &AutocompleteResponse{}
    err := c.fetch(ctx, config, req, response)

    if err != nil {
        return nil, err
    }

    return response, nil
}
