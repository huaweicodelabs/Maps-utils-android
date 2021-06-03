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

import (
    "context"
)

var forwardGeocodeConfig *RequestConfig = &RequestConfig{
    Host: "https://siteapi.cloud.huawei.com",
    path: "mapApi/v1/siteService/geocode",
}

// ForwardGeocodeRequest request struct to use ForwardGeocode
// Address is mandatory.
type ForwardGeocodeRequest struct {
    // Set request configurations.
    RequestConfig `json:"-"`

    // Address information
    Address string `json:"address"`

    // Coordinate bounds to which search results need to be biased.
    Bounds *CoordinateBounds `json:"bounds,omitempty"`

    // Language in which results are displayed.
    Language string `json:"language,omitempty"`
}

// ForwardGeocodeResponse response object.
type ForwardGeocodeResponse struct {
    baseResponse

    // Search result returned upon a successfull search. If no record is found, an empty array will be returned.
    Sites []Site `json:"sites"`
}

// ForwardGeocode Obtains the longitude and latitude of a place based on its structured address.
func (c *Client) ForwardGeocode(ctx context.Context, req *ForwardGeocodeRequest) (*ForwardGeocodeResponse, error) {

    if req.Address == "" {
        return nil, newArgError("Address", `Address: "Piazzale Dante, 41, 55049 Viareggio, Tuscany, Italy"`)
    }

    config := req.RequestConfig.mergeWith(*forwardGeocodeConfig)
    response := &ForwardGeocodeResponse{}
    err := c.fetch(ctx, config, req, response)

    if err != nil {
        return nil, err
    }

    return response, nil
}

var reverseGeocodeConfig = &RequestConfig{
    Host: "https://siteapi.cloud.huawei.com",
    path: "mapApi/v1/siteService/reverseGeocode",
}

// ReverseGeocodeRequest request to use ReverseGeocode.
// Location parameter is mandatory.
type ReverseGeocodeRequest struct {
    // Set request configurations.
    RequestConfig `json:"-"`

    // Longitude and latitude.
    Location *Coordinate `json:"location"`

    // Language in which results are displayed.
    Language string `json:"language,omitempty"`

    // Indicates whether to return a POI.
    ReturnPoi bool `json:"returnPoi,omitempty"`
}

// ReverseGeocodeResponse object.
type ReverseGeocodeResponse struct {
    baseResponse

    // Search result returned upon a successfull search. If no record is found, an empty array will be returned.
    // If the value returnPoi is false, the Poi attribute in the Site object will not be returned.
    Sites []Site `json:"sites"`
}

// ReverseGeocode Obtains information about a place based on its longitude and latitude.
func (c *Client) ReverseGeocode(ctx context.Context, req *ReverseGeocodeRequest) (*ReverseGeocodeResponse, error) {

    if req.Location == nil {
        return nil, newArgError("Location", "location := &Coordinate{Lat: 3.33, Lng: 2.22}")
    }

    config := req.RequestConfig.mergeWith(*reverseGeocodeConfig)
    response := &ReverseGeocodeResponse{}
    err := c.fetch(ctx, config, req, response)

    if err != nil {
        return nil, err
    }

    return response, nil
}
