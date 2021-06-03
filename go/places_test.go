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
    "encoding/json"
    "testing"
)

var (
    baseOK    = baseResponse{"0", "OK"}
    baseZERO  = baseResponse{"010004", "ZERO_RESULTS"}
    baseLIMIT = baseResponse{"010006", "OVER_QUERY_LIMIT"}
)

var (
    sampleSite1 = Site{
        SiteID:        "EB731B7298F1E2EEDC42532CFD3B8E32",
        Name:          "Josep Tarradellas Airport Barcelona-El Prat",
        FormatAddress: "Accés A L' Aeroport, 08820 El Prat De Llobregat, Catalonia, Spain",
        Address: AddressDetail{
            CountryCode:       "ES",
            Country:           "Spain",
            AdminArea:         "Catalonia",
            SubAdminArea:      "Barcelona",
            TertiaryAdminArea: "el Prat de Llobregat",
            Locality:          "El Prat De Llobregat",
            SubLocality:       "",
            StreetNumber:      "",
            Thoroughfare:      "Accés A L' Aeroport",
            PostalCode:        "08820",
        },
        Location: Coordinate{
            Lat: 41.300621,
            Lng: 2.0797638,
        },
        Viewport: CoordinateBounds{
            Northeast: Coordinate{Lat: 41.3147921, Lng: 2.1096553},
            Southwest: Coordinate{Lat: 41.2801418, Lng: 2.0505633},
        },
        Distance: 0,
        Poi: Poi{
            PoiTypes:           []string{"AIRPORT"},
            HwPoiTypes:         []string{"PUBLIC_AUTHORITY"},
            Phone:              "+34 902 404704",
            InternationalPhone: "+34 902 404704",
            Rating:             0,
            WebsiteURL:         "www.aena.es",
            OpeningHours:       &OpeningHours{},
            PhotoURLs:          []string{},
            PriceLevel:         0,
            BusinessStatus:     "",
            ChildrenNodes:      []ChildrenNode{},
        },
        UtcOffset: 0,
        Prediction: AutocompletePrediction{
            Description:     "",
            MatchedKeywords: []Word{},
            MatchedWords:    []Word{},
        },
    }
    detailSampleRequest1 = &DetailSearchRequest{
        SiteID:   "EB731B7298F1E2EEDC42532CFD3B8E32",
        Language: "en",
        Children: false,
    }
    detailSampleRequest2 = &DetailSearchRequest{
        SiteID:   "siteid2",
        Language: "fr",
        Children: false,
    }
    detailSampleRequest3 = &DetailSearchRequest{
        SiteID:   "siteid3",
        Language: "en",
        Children: false,
    }

    detailSampleResponse1 = &DetailSearchResponse{
        baseResponse: baseOK,
        Site:         sampleSite1,
    }
    detailSampleResponse2 = &DetailSearchResponse{
        baseResponse: baseZERO,
        Site:         Site{},
    }
    detailSampleResponse3 = &DetailSearchResponse{
        baseResponse: baseLIMIT,
        Site:         Site{},
    }
)

func TestDetailSearch_WithoutSiteID(t *testing.T) {
    _, err := client.DetailSearch(context.Background(), &DetailSearchRequest{})
    assertNotNull(t, err)
}

func TestDetailSearch_IsRequestCorrect(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    detailSearchConfig.Host = mockServer.server.URL

    client.DetailSearch(context.Background(), detailSampleRequest1)

    res := mockServer.stop()

    if res.calledCount != 1 {
        t.Errorf("1 request expected but server captured %d requests.", res.calledCount)
    }

    apres, ok := res.hits["/mapApi/v1/siteService/searchById"]
    if !ok {
        t.Error("detail search request couldn't captured by the server.")
    }

    givenReq := &DetailSearchRequest{}
    json.Unmarshal(apres.infos[0].reqBody, givenReq)
    assertDeepEqual(t, detailSampleRequest1, givenReq)
}

func TestDetailSearch_CheckResponses(t *testing.T) {
    reqresList := []reqRes{
        {request: detailSampleRequest1, response: detailSampleResponse1},
        {request: detailSampleRequest2, response: detailSampleResponse2},
    }
    mockServer := newTestServer()
    mockServer.start()
    detailSearchConfig.Host = mockServer.server.URL

    for _, reqres := range reqresList {
        mockServer.addResponseToRequest(reqres.request, reqres.response)
        givenResponse, err := client.DetailSearch(context.Background(), reqres.request.(*DetailSearchRequest))
        assertDeepEqual(t, reqres.response, givenResponse)
        assertNull(t, err)
    }

    mockServer.stop()
}

func TestDetailSearch_ApiError(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    detailSearchConfig.Host = mockServer.server.URL

    mockServer.addResponseToRequest(detailSampleRequest3, detailSampleResponse3)

    _, err := client.DetailSearch(context.Background(), detailSampleRequest3)

    assertNotNull(t, err)
    assertTypeOf(t, &apiError{}, err)

    mockServer.stop()
}

func TestDetailSearch_CancelledContext(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    detailSearchConfig.Host = mockServer.server.URL

    ctx, cancel := context.WithCancel(context.Background())
    cancel()

    res, err := client.DetailSearch(ctx, detailSampleRequest1)

    assertNotNull(t, err)

    if res != nil {
        t.Error()
    }

    mockServer.stop()
}

var (
    nearbySampleReq1 = &NearbySearchRequest{
        Location: &Coordinate{Lat: 3.1213, Lng: -12.12312312},
        Radius:   1000,
    }
    nearbySampleReq2 = &NearbySearchRequest{
        Location:  &Coordinate{Lat: -11.231321, Lng: -25.43814},
        Radius:    300,
        Query:     "restaurant",
        Language:  "fr",
        PageSize:  10,
        PageIndex: 2,
    }
    nearbySampleReq3 = &NearbySearchRequest{
        Location: &Coordinate{Lat: -1, Lng: -1},
    }

    nearbySampleRes1 = &NearbySearchResponse{
        baseResponse: baseOK,
        TotalCount:   0,
        Sites:        []Site{sampleSite1, sampleSite1, sampleSite},
    }
    nearbySampleRes2 = &NearbySearchResponse{
        baseResponse: baseZERO,
        TotalCount:   0,
        Sites:        []Site{},
    }
    nearbySampleRes3 = &NearbySearchResponse{
        baseResponse: baseLIMIT,
        Sites:        []Site{},
    }
)

func TestNearbySearch_WithoutProvidingLocation(t *testing.T) {
    _, err := client.NearbySearch(context.Background(), &NearbySearchRequest{})
    assertNotNull(t, err)
    assertTypeOf(t, &argError{}, err)
}

func TestNearbySearch_IsRequestCorrect(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    nearbySearchConfig.Host = mockServer.server.URL

    client.NearbySearch(context.Background(), nearbySampleReq1)

    res := mockServer.stop()

    if res.calledCount != 1 {
        t.Errorf("1 request expected but server captured %d requests.", res.calledCount)
    }
    apres, ok := res.hits["/mapApi/v1/siteService/nearbySearch"]
    if !ok {
        t.Error("nearby search request couldn't captured by the server.")
    }

    givenReq := &NearbySearchRequest{}
    json.Unmarshal(apres.infos[0].reqBody, givenReq)
    assertDeepEqual(t, nearbySampleReq1, givenReq)
}

func TestNearbySearch_CheckResponses(t *testing.T) {
    reqresList := []reqRes{
        {request: nearbySampleReq1, response: nearbySampleRes1},
        {request: nearbySampleReq2, response: nearbySampleRes2},
    }
    mockServer := newTestServer()
    mockServer.start()
    nearbySearchConfig.Host = mockServer.server.URL

    for _, reqres := range reqresList {
        mockServer.addResponseToRequest(reqres.request, reqres.response)
        givenResponse, err := client.NearbySearch(context.Background(), reqres.request.(*NearbySearchRequest))
        assertDeepEqual(t, reqres.response, givenResponse)
        assertNull(t, err)
    }
    mockServer.stop()
}

func TestNearbySearch_ApiError(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    nearbySearchConfig.Host = mockServer.server.URL

    mockServer.addResponseToRequest(nearbySampleReq3, nearbySampleRes3)
    _, err := client.NearbySearch(context.Background(), nearbySampleReq3)

    assertNotNull(t, err)
    assertTypeOf(t, &apiError{}, err)

    mockServer.stop()
}

func TestNearbySearch_CancelledContext(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    nearbySearchConfig.Host = mockServer.server.URL

    ctx, cancel := context.WithCancel(context.Background())
    cancel()

    res, err := client.NearbySearch(ctx, nearbySampleReq1)

    assertNotNull(t, err)

    if res != nil {
        t.Error()
    }

    mockServer.stop()
}

var (
    textSearchSampleReq1 = &TextSearchRequest{
        Query: "Piazzale Dante, 41, 55049 Viareggio, Tuscany, Italy",
    }
    textSearchSampleReq2 = &TextSearchRequest{
        Query:    "samplequery",
        Radius:   10000,
        Language: "en",
        Children: false,
    }
    textSearchSampleReq3 = &TextSearchRequest{
        Query: "samplequery",
    }

    textSearchSampleRes1 = &TextSearchResponse{
        baseResponse: baseOK,
        TotalCount:   3,
        Sites:        []Site{sampleSite1, sampleSite, sampleSite},
    }
    textSearchSampleRes2 = &TextSearchResponse{
        baseResponse: baseZERO,
        TotalCount:   0,
        Sites:        []Site{},
    }
    textSearchSampleRes3 = &TextSearchResponse{
        baseResponse: baseLIMIT,
        Sites:        []Site{},
    }
)

func TestTextSearch_WithoutProvidingQuery(t *testing.T) {
    _, err := client.TextSearch(context.Background(), &TextSearchRequest{})
    assertNotNull(t, err)
    assertTypeOf(t, &argError{}, err)
}

func TestTextSearch_IsRequestCorrect(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    textSearchConfig.Host = mockServer.server.URL

    client.TextSearch(context.Background(), textSearchSampleReq1)

    result := mockServer.stop()

    if result.calledCount != 1 {
        t.Errorf("1 request expected but server captured %d requests.", result.calledCount)
    }

    apres, ok := result.hits["/mapApi/v1/siteService/searchByText"]
    if !ok {
        t.Error("text search request couldn't captured by the server.")
    }

    givenReq := &TextSearchRequest{}
    json.Unmarshal(apres.infos[0].reqBody, givenReq)
    assertDeepEqual(t, textSearchSampleReq1, givenReq)
}

func TestTextSearch_Responses(t *testing.T) {
    reqresList := []reqRes{
        {request: textSearchSampleReq1, response: textSearchSampleRes1},
        {request: textSearchSampleReq2, response: textSearchSampleRes2},
    }
    mockServer := newTestServer()
    mockServer.start()
    textSearchConfig.Host = mockServer.server.URL

    for _, reqres := range reqresList {
        mockServer.addResponseToRequest(reqres.request, reqres.response)
        givenResponse, err := client.TextSearch(context.Background(), reqres.request.(*TextSearchRequest))
        assertDeepEqual(t, reqres.response, givenResponse)
        assertNull(t, err)
    }

    mockServer.stop()
}

func TestTextSearch_ApiError(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    textSearchConfig.Host = mockServer.server.URL

    mockServer.addResponseToRequest(textSearchSampleReq3, textSearchSampleRes3)
    _, err := client.TextSearch(context.Background(), textSearchSampleReq3)

    assertNotNull(t, err)
    assertTypeOf(t, &apiError{}, err)
    mockServer.stop()
}

func TestTextSearch_CancelledContext(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    textSearchConfig.Host = mockServer.server.URL

    ctx, cancel := context.WithCancel(context.Background())
    cancel()

    res, err := client.TextSearch(ctx, textSearchSampleReq1)

    assertNotNull(t, err)

    if res != nil {
        t.Error()
    }

    mockServer.stop()
}

var (
    querySuggestionSampleReq1 = &QuerySuggestionRequest{
        Query: "Piazzale Dante",
    }
    querySuggestionSampleReq2 = &QuerySuggestionRequest{
        Query:    "samplequery",
        Language: "en",
        Children: false,
    }
    querySuggestionSampleReq3 = &QuerySuggestionRequest{
        Query: "samplequery",
    }

    querySuggestionSampleRes1 = &QuerySuggestionResponse{
        baseResponse: baseOK,
        Sites:        []Site{sampleSite1, sampleSite, sampleSite},
    }
    querySuggestionSampleRes2 = &QuerySuggestionResponse{
        baseResponse: baseZERO,
        Sites:        []Site{},
    }
    querySuggestionSampleRes3 = &QuerySuggestionResponse{
        baseResponse: baseLIMIT,
        Sites:        []Site{},
    }
)

func TestQuerySuggestion_WithoutProvidingQuery(t *testing.T) {
    _, err := client.QuerySuggestion(context.Background(), &QuerySuggestionRequest{})
    assertNotNull(t, err)
    assertTypeOf(t, &argError{}, err)
}

func TestQuerySuggestion_IsRequestCorrect(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    querySuggestionConfig.Host = mockServer.server.URL

    client.QuerySuggestion(context.Background(), querySuggestionSampleReq1)

    result := mockServer.stop()

    if result.calledCount != 1 {
        t.Errorf("1 request expected but server captured %d requests.", result.calledCount)
    }

    apres, ok := result.hits["/mapApi/v1/siteService/querySuggestion"]
    if !ok {
        t.Error("query suggestion request couldn't captured by the server.")
    }

    givenReq := &QuerySuggestionRequest{}
    json.Unmarshal(apres.infos[0].reqBody, givenReq)
    assertDeepEqual(t, querySuggestionSampleReq1, givenReq)
}

func TestQuerySuggestion_Responses(t *testing.T) {
    reqresList := []reqRes{
        {request: querySuggestionSampleReq1, response: querySuggestionSampleRes1},
        {request: querySuggestionSampleReq2, response: querySuggestionSampleRes2},
    }
    mockServer := newTestServer()
    mockServer.start()
    querySuggestionConfig.Host = mockServer.server.URL

    for _, reqres := range reqresList {
        mockServer.addResponseToRequest(reqres.request, reqres.response)
        givenResponse, err := client.QuerySuggestion(context.Background(), reqres.request.(*QuerySuggestionRequest))
        assertDeepEqual(t, reqres.response, givenResponse)
        assertNull(t, err)
    }

    mockServer.stop()
}

func TestQuerySuggestion_ApiError(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    querySuggestionConfig.Host = mockServer.server.URL

    mockServer.addResponseToRequest(querySuggestionSampleReq3, querySuggestionSampleRes3)
    _, err := client.QuerySuggestion(context.Background(), querySuggestionSampleReq3)

    assertNotNull(t, err)
    assertTypeOf(t, &apiError{}, err)
    mockServer.stop()
}

func TestQuerySuggestion_CancelledContext(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    querySuggestionConfig.Host = mockServer.server.URL

    ctx, cancel := context.WithCancel(context.Background())
    cancel()

    res, err := client.QuerySuggestion(ctx, querySuggestionSampleReq1)

    assertNotNull(t, err)

    if res != nil {
        t.Error()
    }

    mockServer.stop()
}

var (
    autocompleteSampleReq1 = &AutocompleteRequest{
        Query:    "station",
        Location: &Coordinate{Lat: 10.25222, Lng: 43.883},
        Radius:   10000,
        Language: "en",
        Children: false,
    }
    autocompleteSampleReq2 = &AutocompleteRequest{
        Query:    "samplequery",
        Language: "en",
        Children: false,
    }
    autocompleteSampleReq3 = &AutocompleteRequest{
        Query: "somequery",
    }

    autocompleteSampleRes1 = &AutocompleteResponse{
        baseResponse: baseOK,
        Predictions:  []AutocompletePrediction{},
        Sites:        []Site{sampleSite1, sampleSite},
    }
    autocompleteSampleRes2 = &AutocompleteResponse{
        baseResponse: baseZERO,
        Predictions:  []AutocompletePrediction{},
        Sites:        []Site{},
    }
    autocompleteSampleRes3 = &AutocompleteResponse{
        baseResponse: baseLIMIT,
        Predictions:  []AutocompletePrediction{},
        Sites:        []Site{},
    }
)

func TestAutocomplete_WithoutProvidingQuery(t *testing.T) {
    _, err := client.Autocomplete(context.Background(), &AutocompleteRequest{})
    assertNotNull(t, err)
    assertTypeOf(t, &argError{}, err)
}

func TestAutocomplete_IsRequestCorrect(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    autocompleteConfig.Host = mockServer.server.URL

    client.Autocomplete(context.Background(), autocompleteSampleReq1)

    result := mockServer.stop()

    if result.calledCount != 1 {
        t.Errorf("1 request expected but server captured %d requests.", result.calledCount)
    }

    apres, ok := result.hits["/mapApi/v1/siteService/queryAutoComplete"]
    if !ok {
        t.Error("query autocomplete request couldn't captured by the server.")
    }

    givenReq := &AutocompleteRequest{}
    json.Unmarshal(apres.infos[0].reqBody, givenReq)
    assertDeepEqual(t, autocompleteSampleReq1, givenReq)
}

func TestAutocomplete_Responses(t *testing.T) {
    reqresList := []reqRes{
        {request: autocompleteSampleReq1, response: autocompleteSampleRes1},
        {request: autocompleteSampleReq2, response: autocompleteSampleRes2},
    }
    mockServer := newTestServer()
    mockServer.start()
    autocompleteConfig.Host = mockServer.server.URL

    for _, reqres := range reqresList {
        mockServer.addResponseToRequest(reqres.request, reqres.response)
        givenResponse, err := client.Autocomplete(context.Background(), reqres.request.(*AutocompleteRequest))
        assertDeepEqual(t, reqres.response, givenResponse)
        assertNull(t, err)
    }

    mockServer.stop()
}

func TestAutocomplete_ApiError(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    autocompleteConfig.Host = mockServer.server.URL

    mockServer.addResponseToRequest(autocompleteSampleReq3, autocompleteSampleRes3)
    _, err := client.Autocomplete(context.Background(), autocompleteSampleReq3)

    assertNotNull(t, err)
    assertTypeOf(t, &apiError{}, err)
    mockServer.stop()
}

func TestAutocomplete_CancelledContext(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    autocompleteConfig.Host = mockServer.server.URL

    ctx, cancel := context.WithCancel(context.Background())
    cancel()

    res, err := client.Autocomplete(ctx, autocompleteSampleReq1)

    assertNotNull(t, err)

    if res != nil {
        t.Error()
    }

    mockServer.stop()
}
