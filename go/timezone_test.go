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
    "fmt"
    "io/ioutil"
    "net/http"
    "net/http/httptest"
    "reflect"
    "testing"
    "time"
)

type callInfo struct {
    callTime time.Time
    reqBody  []byte
}

type apiRes struct {
    calledCount int
    infos       []callInfo
}

type result struct {
    calledCount int
    hits        map[string]*apiRes
}

type testServer struct {
    server   *httptest.Server
    result   *result
    response map[string][]byte
}

func newTestServer() *testServer {
    return &testServer{
        response: make(map[string][]byte),
        result: &result{
            hits: make(map[string]*apiRes),
        },
    }
}

func (ts *testServer) addResponseToRequest(request interface{}, response interface{}) {
    req, _ := json.Marshal(request)
    res, _ := json.Marshal(response)
    ts.response[string(req)] = res
}

func (ts *testServer) start() {

    ts.server = httptest.NewServer(http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {

        path := req.URL.Path
        byteReq, err := ioutil.ReadAll(req.Body)

        if err != nil {
            fmt.Println("an error occurred while reading the request body.")
        }

        cinf := callInfo{callTime: time.Now(), reqBody: byteReq}
        if apr, ok := ts.result.hits[path]; ok {
            apr.calledCount++
            apr.infos = append(apr.infos, cinf)
        } else {
            ts.result.hits[path] = &apiRes{calledCount: 1, infos: []callInfo{cinf}}
        }
        ts.result.calledCount++

        type Code struct {
            StatusCode           int
            StatusOkAfterRequest int
        }
        if resp, ok := ts.response[string(byteReq)]; ok {
            c := &Code{}
            err = json.Unmarshal(resp, c)
            if err == nil && c.StatusCode != 0 && (c.StatusOkAfterRequest == 0 || c.StatusOkAfterRequest >= ts.result.hits[path].calledCount) {
                rw.WriteHeader(c.StatusCode)
            }
            rw.Write(resp)
        } else {
            rw.Write([]byte(`{"returnCode": "0", "returnDesc": "OK"}`))
        }
    }))
}

func (ts *testServer) stop() *result {
    ts.server.Close()
    return ts.result
}

func TestGetTimezone_WithoutProvidingLocation(t *testing.T) {
    _, err := client.GetTimezone(context.Background(), &TimezoneRequest{Timestamp: 1231123321})
    assertNotNull(t, err)
}

func TestGetTimezone_WithoutProvidingTimestamp(t *testing.T) {
    _, err := client.GetTimezone(context.Background(), &TimezoneRequest{Location: &Coordinate{Lat: 3.33, Lng: 2.22}})
    assertNotNull(t, err)
}

func TestGetTimezone_IsRequestCorrect(t *testing.T) {

    mockServer := newTestServer()
    mockServer.start()
    timezoneConfig.Host = mockServer.server.URL

    client.GetTimezone(context.Background(), timezoneSampleRequest1)

    res := mockServer.stop()

    if res.calledCount != 1 {
        t.Errorf("1 request expected but server captured %d requests.", res.calledCount)
    }

    apres, ok := res.hits["/mapApi/v1/timezoneService/getTimezone"]
    if !ok {
        t.Error("timezone request couldn't captured by the server.")
    }

    givenReq := &TimezoneRequest{}
    json.Unmarshal(apres.infos[0].reqBody, givenReq)
    assertDeepEqual(t, timezoneSampleRequest1, givenReq)
}

var (
    timezoneSampleRequest1 = &TimezoneRequest{
        Location:  &Coordinate{Lat: 3.33, Lng: 2.22},
        Timestamp: time.Now().Unix(),
    }
    timezoneSampleRequest2 = &TimezoneRequest{
        Location:  &Coordinate{Lat: 5.72, Lng: 35.10},
        Timestamp: time.Now().Unix(),
    }
    timezoneSampleRequest3 = &TimezoneRequest{
        Location:  &Coordinate{Lat: 50, Lng: 40},
        Timestamp: time.Now().Unix(),
    }
    timezoneSampleRequest4 = &TimezoneRequest{
        Location:  &Coordinate{Lat: -12, Lng: -3.89},
        Timestamp: time.Now().Unix(),
    }

    timezoneSampleResponse1 = &TimezoneResponse{
        baseResponse: baseZERO,
    }
    timezoneSampleResponse2 = &TimezoneResponse{
        baseResponse: baseOK,
        RawOffset:    10800,
        TimeZoneID:   "Africa/Juba",
        TimeZoneName: "Eastern African Time",
    }
    timezoneSampleResponse3 = &TimezoneResponse{
        baseResponse: baseOK,
        RawOffset:    10800,
        TimeZoneID:   "Europe/Moscow",
        TimeZoneName: "Moscow Standard Time",
    }
    timezoneSampleResponse4 = &TimezoneResponse{
        baseResponse: baseZERO,
    }
)

type reqRes struct {
    request  interface{}
    response interface{}
}

func TestGetTimezone_CheckResponses(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    timezoneConfig.Host = mockServer.server.URL

    var reqresList = []reqRes{
        {request: timezoneSampleRequest1, response: timezoneSampleResponse1},
        {request: timezoneSampleRequest2, response: timezoneSampleResponse2},
        {request: timezoneSampleRequest3, response: timezoneSampleResponse3},
        {request: timezoneSampleRequest4, response: timezoneSampleResponse4},
    }

    for _, reqres := range reqresList {
        mockServer.addResponseToRequest(reqres.request, reqres.response)
        givenResponse, err := client.GetTimezone(context.Background(), reqres.request.(*TimezoneRequest))
        assertDeepEqual(t, reqres.response, givenResponse)
        assertNull(t, err)
    }

    mockServer.stop()
}

func TestGetTimezone_ApiError(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    timezoneConfig.Host = mockServer.server.URL

    mockServer.addResponseToRequest(timezoneSampleRequest1, &TimezoneResponse{baseResponse: baseResponse{ReturnCode: "6", ReturnDesc: "INVALID_REQUEST"}})
    mockServer.addResponseToRequest(timezoneSampleRequest2, &TimezoneResponse{baseResponse: baseResponse{ReturnCode: "010005", ReturnDesc: "REQUEST_DENIED"}})

    _, err1 := client.GetTimezone(context.Background(), timezoneSampleRequest1)
    _, err2 := client.GetTimezone(context.Background(), timezoneSampleRequest2)

    assertNotNull(t, err1)
    assertNotNull(t, err2)
    assertTypeOf(t, &apiError{}, err1)
    assertTypeOf(t, &apiError{}, err2)

    mockServer.stop()
}

func TestGetTimezone_CancelledContext(t *testing.T) {
    mockServer := newTestServer()
    mockServer.start()
    timezoneConfig.Host = mockServer.server.URL

    mockServer.addResponseToRequest(timezoneSampleRequest1, timezoneSampleResponse1)

    ctx, cancel := context.WithCancel(context.Background())
    cancel()
    res, err := client.GetTimezone(ctx, timezoneSampleRequest1)
    if res != nil {
        t.Error()
    }
    assertNotNull(t, err)

    mockServer.stop()
}

func TestGetTimezone_ChangeAPIKey(t *testing.T) {
    req := &TimezoneRequest{Location: &Coordinate{Lat: 3.33, Lng: 2.22},
        Timestamp:     123131232,
        RequestConfig: RequestConfig{APIKey: "myapikey"}}
    req.RequestConfig = req.mergeWith(*timezoneConfig)
    httpReq, _ := client.getHTTPRequest("POST", req.RequestConfig, req)
    rawQuery := httpReq.URL.RawQuery

    if rawQuery != "key=myapikey" {
        t.Error()
    }

}

func assertDeepEqual(t *testing.T, expected, actual interface{}) {
    if !reflect.DeepEqual(expected, actual) {
        t.Errorf("expected and actual are not deep equal. expected= %v\nactual= %v", expected, actual)
    }
}

func assertTypeOf(t *testing.T, expected, actual interface{}) {
    if reflect.TypeOf(expected) != reflect.TypeOf(actual) {
        t.Errorf("Given types are different! expected= %v, actual= %v", reflect.TypeOf(expected), reflect.TypeOf(actual))
    }
}
