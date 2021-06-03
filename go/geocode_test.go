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

func TestForwardGeocode_WithoutProvidingAddress(t *testing.T) {
    _, err := client.ForwardGeocode(context.Background(), &ForwardGeocodeRequest{})
    assertNotNull(t, err)
    assertTypeOf(t, &argError{}, err)
}

var (
    sampleSite = Site{
        SiteID: "AF9EE9E64B45F22395741C6FC71E62AF",
        Name:   "5 Piazzale Dante Alighieri",
        Location: Coordinate{
            Lng: 10.2530233,
            Lat: 43.8716052,
        },
        Viewport: CoordinateBounds{
            Southwest: Coordinate{
                Lng: 43.870333366794405,
                Lat: 10.251259057213774,
            },
            Northeast: Coordinate{
                Lng: 43.87287703320559,
                Lat: 10.251259057213774,
            },
        },
        Poi: Poi{
            HwPoiTypes:         []string{"STREET_ADDRESS"},
            Rating:             0.0,
            InternationalPhone: "",
            PoiTypes:           []string{"STREET_ADDRESS"},
        },
        Address: AddressDetail{
            Country:           "Italy",
            StreetNumber:      "5",
            CountryCode:       "IT",
            TertiaryAdminArea: "Viareggio",
            PostalCode:        "5504",
            Locality:          "Viareggio",
            AdminArea:         "Tuscany",
            SubAdminArea:      "Lucca",
            Thoroughfare:      "Piazzale Dante Alighieri",
        },
        FormatAddress: "55049 Viareggio, Tuscany, Italy",
    }

    forwardGeocodeSampleRequest1 = &ForwardGeocodeRequest{
        Address:  "Piazzale Dante, 41, 55049 Viareggio, Tuscany, Italy",
        Bounds:   nil,
        Language: "en",
    }
    forwardGeocodeSampleRequest2 = &ForwardGeocodeRequest{
        Address:  "some address aasijsda",
        Bounds:   nil,
        Language: "",
    }
    forwardGeocodeSampleRequest3 = &ForwardGeocodeRequest{
        Address:  "bad response",
        Bounds:   nil,
        Language: "",
    }

    forwardGeocodeSampleResponse1 = &ForwardGeocodeResponse{
        baseResponse: baseResponse{"0", "OK"},
        Sites:        []Site{sampleSite, sampleSite, sampleSite},
    }
    forwardGeocodeSampleResponse2 = &ForwardGeocodeResponse{
        baseResponse: baseResponse{"010004", "ZERO_RESULTS"},
        Sites:        []Site{},
    }
    forwardGeocodeSampleResponse3 = &ForwardGeocodeResponse{
        baseResponse: baseResponse{"010006", "OVER_QUERY_LIMIT"},
        Sites:        []Site{},
    }
)

func TestForwardGeocode_IsRequestCorrect(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    forwardGeocodeConfig.Host = mockServer.server.URL
    client.ForwardGeocode(context.Background(), forwardGeocodeSampleRequest1)
    res := mockServer.stop()

    if res.calledCount != 1 {
        t.Errorf("1 request expected but server captured %d requests.", res.calledCount)
    }

    apres, ok := res.hits["/mapApi/v1/siteService/geocode"]
    if !ok {
        t.Error("request couldn't captured by the server.")
    }

    givenReq := &ForwardGeocodeRequest{}
    json.Unmarshal(apres.infos[0].reqBody, givenReq)
    assertDeepEqual(t, forwardGeocodeSampleRequest1, givenReq)
}

func TestForwardGeocode_Responses(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    forwardGeocodeConfig.Host = mockServer.server.URL

    reqRespList := []reqRes{
        {request: forwardGeocodeSampleRequest1, response: forwardGeocodeSampleResponse1},
        {request: forwardGeocodeSampleRequest2, response: forwardGeocodeSampleResponse2},
    }

    for _, reqResp := range reqRespList {
        req, _ := json.Marshal(reqResp.request)
        resp, _ := json.Marshal(reqResp.response)
        mockServer.response[string(req)] = resp
        givenResponse, err := client.ForwardGeocode(context.Background(), reqResp.request.(*ForwardGeocodeRequest))
        assertDeepEqual(t, reqResp.response, givenResponse)
        assertNull(t, err)
    }

    mockServer.stop()
}

func TestForwardGeocode_ApiError(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    forwardGeocodeConfig.Host = mockServer.server.URL

    req, _ := json.Marshal(forwardGeocodeSampleRequest3)
    res, _ := json.Marshal(forwardGeocodeSampleResponse3)
    mockServer.response[string(req)] = res

    _, err := client.ForwardGeocode(context.Background(), forwardGeocodeSampleRequest3)

    assertNotNull(t, err)
    assertTypeOf(t, &apiError{}, err)

    mockServer.stop()
}

func TestForwardGeocode_CancelledContext(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    forwardGeocodeConfig.Host = mockServer.server.URL

    ctx, cancel := context.WithCancel(context.Background())
    cancel()

    res, err := client.ForwardGeocode(ctx, forwardGeocodeSampleRequest1)

    assertNotNull(t, err)

    if res != nil {
        t.Error()
    }

    mockServer.stop()
}

func TestReverseGeocode_WithoutProvidingLocation(t *testing.T) {
    _, err := client.ReverseGeocode(context.Background(), &ReverseGeocodeRequest{Language: "en", ReturnPoi: false})
    assertNotNull(t, err)
    assertTypeOf(t, &argError{}, err)
}

var (
    reverseGeocodeSampleRequest1 = &ReverseGeocodeRequest{
        Location:  &Coordinate{Lat: 33.22, Lng: 22.2},
        Language:  "en",
        ReturnPoi: true,
    }
    reverseGeocodeSampleRequest2 = &ReverseGeocodeRequest{
        Location:  &Coordinate{Lat: 22, Lng: 11},
        Language:  "fr",
        ReturnPoi: false,
    }
    reverseGeocodeSampleRequest3 = &ReverseGeocodeRequest{
        Location:  &Coordinate{Lat: 5, Lng: -5},
        Language:  "en",
        ReturnPoi: false,
    }

    reverseGeocodeSampleResponse1 = &ReverseGeocodeResponse{
        baseResponse: baseResponse{"0", "OK"},
        Sites:        []Site{sampleSite, sampleSite, sampleSite},
    }
    reverseGeocodeSampleResponse2 = &ReverseGeocodeResponse{
        baseResponse: baseResponse{"010004", "ZERO_RESULTS"},
        Sites:        []Site{},
    }
    reverseGeocodeSampleResponse3 = &ReverseGeocodeResponse{
        baseResponse: baseResponse{"010006", "OVER_QUERY_LIMIT"},
        Sites:        []Site{},
    }
)

func TestReverseGeocode_IsRequestCorrect(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    reverseGeocodeConfig.Host = mockServer.server.URL
    client.ReverseGeocode(context.Background(), reverseGeocodeSampleRequest1)
    res := mockServer.stop()

    if res.calledCount != 1 {
        t.Errorf("1 request expected but server captured %d requests.", res.calledCount)
    }

    apres, ok := res.hits["/mapApi/v1/siteService/reverseGeocode"]
    if !ok {
        t.Error("request couldn't captured by the server")
    }

    givenReq := &ReverseGeocodeRequest{}
    json.Unmarshal(apres.infos[0].reqBody, givenReq)
    assertDeepEqual(t, reverseGeocodeSampleRequest1, givenReq)
}

func TestReverseGeocode_Responses(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    reverseGeocodeConfig.Host = mockServer.server.URL

    reqresList := []reqRes{
        {request: reverseGeocodeSampleRequest1, response: reverseGeocodeSampleResponse1},
        {request: reverseGeocodeSampleRequest2, response: reverseGeocodeSampleResponse2},
    }

    for _, reqres := range reqresList {
        req, _ := json.Marshal(reqres.request)
        res, _ := json.Marshal(reqres.response)
        mockServer.response[string(req)] = res
        givenResponse, err := client.ReverseGeocode(context.Background(), reqres.request.(*ReverseGeocodeRequest))
        assertDeepEqual(t, reqres.response, givenResponse)
        assertNull(t, err)
    }
    mockServer.stop()
}

func TestReverseGeocode_ApiError(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    reverseGeocodeConfig.Host = mockServer.server.URL

    req, _ := json.Marshal(reverseGeocodeSampleRequest3)
    res, _ := json.Marshal(reverseGeocodeSampleResponse3)
    mockServer.response[string(req)] = res

    _, err := client.ReverseGeocode(context.Background(), reverseGeocodeSampleRequest3)

    assertNotNull(t, err)
    assertTypeOf(t, &apiError{}, err)

    mockServer.stop()
}

func TestReverseGeocode_CancelledContext(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    reverseGeocodeConfig.Host = mockServer.server.URL

    ctx, cancel := context.WithCancel(context.Background())
    cancel()

    res, err := client.ReverseGeocode(ctx, reverseGeocodeSampleRequest1)

    assertNotNull(t, err)

    if res != nil {
        t.Error()
    }

    mockServer.stop()
}
