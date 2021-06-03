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

var timezoneConfig = &RequestConfig{
    Host: "https://siteapi.cloud.huawei.com",
    path: "mapApi/v1/timezoneService/getTimezone",
}

// TimezoneRequest request struct to use GetTimezone
// Location and Timestamp parameters are mandatory.
type TimezoneRequest struct {
    // Set request configurations.
    RequestConfig `json:"-"`

    // Longitude and latitude.
    Location *Coordinate `json:"location"`

    // Number of seconds between the current time and 00:00:00 on January 1, 1970 (UTC).
    Timestamp int64 `json:"timestamp"`

    // Language in which search results are displayed.
    Language string `json:"language,omitempty"`
}

// TimezoneResponse response returned from server.
type TimezoneResponse struct {
    baseResponse

    // DST offset, in seconds. If the specified timestamp is out of the DST, 0 will be returned.
    DstOffset int64 `json:"dstOffset"`

    // Time zone offset of a specified place from UTC, in seconds.
    RawOffset int64 `json:"rawOffset"`

    // TimeZoneId, For example, the value can be America / Los_Angeles or Australia / Syndey.
    TimeZoneID string `json:"timeZoneId"`

    // TimeZone name, for example, PDT.
    TimeZoneName string `json:"timeZoneName"`
}

// GetTimezone Obtains the time zone information about a place based on its longitude and latitude.
func (c *Client) GetTimezone(ctx context.Context, req *TimezoneRequest) (*TimezoneResponse, error) {
    if req.Location == nil {
        return nil, newArgError("Location", "location := &Coordinate{Lat: 3.33, Lng: 2.22}")
    }

    if req.Timestamp == 0 {
        return nil, newArgError("Timestamp", "timestamp := time.Now().Unix()")
    }

    config := req.RequestConfig.mergeWith(*timezoneConfig)
    response := &TimezoneResponse{}
    err := c.fetch(ctx, config, req, response)

    if err != nil {
        return nil, err
    }

    return response, nil
}
