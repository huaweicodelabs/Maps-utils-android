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

// Address ...
type Address struct {
    // Country/Region code.
    CountryCode string `json:"countryCode"`

    // Country name.
    Country string `json:"country"`

    // Province/State.
    State string `json:"state"`

    // City/County.
    County string `json:"county"`

    // Town/District.
    Town string `json:"town"`

    // Settlement place.
    Settlement string `json:"settlement"`
}

// AddressDetail ...
type AddressDetail struct {
    // Country/Region code, which complies with ISO 3166-1 alpha-2.
    CountryCode string `json:"countryCode"`

    // Country name.
    Country string `json:"country"`

    // Level-1 administrative region in  a country, which is generally a province or state.
    AdminArea string `json:"adminArea"`

    // Level-2 administrative region in a country, which is generally a city.
    SubAdminArea string `json:"subAdminArea"`

    // Level-3 administrative region of a country.
    TertiaryAdminArea string `json:"tertiaryAdminArea"`

    // City.
    Locality string `json:"locality"`

    // District or county.
    SubLocality string `json:"subLocality"`

    // Street number.
    StreetNumber string `json:"streetNumber"`

    // Street name.
    Thoroughfare string `json:"thoroughfare"`

    // Postal code.
    PostalCode string `json:"postalCode"`
}

// AutocompletePrediction ...
type AutocompletePrediction struct {
    // Predicted place description.
    Description string `json:"description"`

    // Matching position of the entered keyword in the description.
    MatchedKeywords []Word `json:"matchedKeywords"`

    // Words and their positions in the description.
    MatchedWords []Word `json:"matchedWords"`
}

// ChildrenNode ...
type ChildrenNode struct {
    // ID of a place.
    SiteID string `json:"siteId"`

    // Name of a place.
    Name string `json:"name"`

    // Formatted detailed address of a place.
    FormatAddress string `json:"formatAddress"`

    // Longitude and Latitude of a place.
    Location Coordinate `json:"coordinate"`

    // Huawei classification system.
    HwPoiTypes []string `json:"hwPoiTypes"`

    // Indicates whether an airport terminal is a national or international terminal.
    // 1. National, 2. International, 3. National and International
    DomeAndInt string `json:"domeAndInt"`

    // Indicates whether an airport terminal is a departure or arrival terminal. The options are follows
    // 1.Departure, 2. Arrival, 3. Departure and Arrival
    DepAndArr string `json:"depAndArr"`
}

// OpeningHours ...
type OpeningHours struct {
    // Description of weekly opening hours of a place.
    Texts []string `json:"texts"`

    // Opening hours of a place.
    Periods []Period `json:"periods"`
}

// Period ...
type Period struct {
    // Open time
    Open TimeOfWeek `json:"open"`

    // Close Time
    Close TimeOfWeek `json:"close"`
}

// Poi ...
type Poi struct {
    // List of Huawei POI types. The value range is the same as that of LocationType.
    PoiTypes []string `json:"poiTypes"`

    // Huawei POI classification system. For details about the value range, please refer to HwLocationType.
    HwPoiTypes []string `json:"hwPoiTypes"`

    // Phone number.
    Phone string `json:"phone"`

    // International phone number.
    InternationalPhone string `json:"internationalPhone"`

    // Rating.
    Rating float32 `json:"rating"`

    // Website URL.
    WebsiteURL string `json:"websiteUrl"`

    // Opening hours.
    OpeningHours *OpeningHours `json:"openingHours"`

    // Photo URL.
    PhotoURLs []string `json:"photoUrls"`

    // Price level the value ranges from 0 to 4.
    // This parameter is returned only by the place detail search API.
    PriceLevel int `json:"priceLevel"`

    // Business status of a place. The options are follows.
    // OPEN_NOW: open, CLOSE_NOW: closed, CLOSED_TEMPORARILY: temporarily closed. CLOSED_PERMANANTLY: closed permanantly.
    BusinessStatus string `json:"businessStatus"`

    // Child nodes of a POI.
    ChildrenNodes []ChildrenNode `json:"childrenNodes"`
}

// Site ...
type Site struct {
    // Unique ID of a place.
    SiteID string `json:"siteId"`

    // Name of a place.
    Name string `json:"name"`

    // Formatted detailed address of a place.
    FormatAddress string `json:"formatAddress"`

    // Place details.
    Address AddressDetail `json:"address"`

    // Longitude and latitude of a place.
    Location Coordinate `json:"location"`

    // Viewport of a place.
    // This paramater is not supported for the search suggestion API.
    Viewport CoordinateBounds `json:"viewport"`

    // Linear distance between a predicted place and the location specified by input parameter location, in meters.
    Distance float64 `json:"distance"`

    // POI information about a place if the place is a POI
    Poi Poi `json:"poi"`

    // Difference between the time zone of a place and the UTC time zone, in minutes.
    UtcOffset int `json:"utfOffset"`

    // Description of the autocomplete place. This parameter is returned only by the search suggestion and autocomplete APIs.
    Prediction AutocompletePrediction `json:"prediction"`
}

// TimeOfWeek ...
type TimeOfWeek struct {
    // 0. Sunday, 1. Monday, 2.Tuesday, 3.Wednesday, 4.Thursday, 5.Friday, 6.Saturday
    Week int `json:"week"`

    // 24-hour time in hhmm format.
    Time string `json:"time"`
}

// Word ...
type Word struct {
    // Offset of a word in the description.
    Offset int `json:"offset"`

    // Word.
    Value string `json:"value"`
}

// Coordinate ...
type Coordinate struct {
    // Latitude. The value ranges from -90 to 90.
    Lat float64 `json:"lat"`

    // Longitude. The value ranges from -180 to 180.
    Lng float64 `json:"lng"`
}

// CoordinateBounds ...
type CoordinateBounds struct {
    // Coordinates of the northeast corner.
    Northeast Coordinate `json:"northeast"`

    // Coordinates of the southwest corner.
    Southwest Coordinate `json:"southwest"`
}

type baseResponse struct {
    // Return code.
    ReturnCode string `json:"returnCode"`

    // Return description.
    ReturnDesc string `json:"returnDesc"`
}
