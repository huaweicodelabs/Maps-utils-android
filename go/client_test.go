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
    "math"
    "net/http"
    "testing"
    "time"
)

var client = NewClient(WithAPIKey("api-key"))

func TestClient_ClientConfigurations(t *testing.T) {
    cli1 := NewClient(WithAPIKey("apikey"))

    if cli1.apiKey != "apikey" {
        t.Error()
    }

    httpc := &http.Client{}
    cli2 := NewClient(WithHTTPClient(httpc))

    if cli2.httpClient != httpc {
        t.Error()
    }

    cli3 := NewClient(WithHost("my://host"))

    if cli3.host != "my://host" {
        t.Error()
    }

    cli4 := NewClient(WithHost("my://host"), WithAPIKey("apikey"), WithHTTPClient(httpc))

    if cli4.host != "my://host" || cli4.apiKey != "apikey" || cli4.httpClient != httpc {
        t.Error()
    }
}

func TestClient_InitializeAndRequestWithoutAPIKey(t *testing.T) {
    cli := NewClient()
    res, err := cli.DetailSearch(context.Background(), detailSampleRequest1)

    if res != nil {
        t.Error()
    }

    if err == nil {
        t.Error()
    }
}

type WrapperResponse struct {
    *TimezoneResponse
    StatusCode           int
    StatusOkAfterRequest int
}

var retryableWrapperResponse = &WrapperResponse{StatusCode: 503, TimezoneResponse: &TimezoneResponse{baseResponse: baseOK}}

func TestClientRetry_RetryClientRequests(t *testing.T) {
    c := NewClient(WithAPIKey("apikey"), WithRetryConfig(3, time.Millisecond*time.Duration(300)))

    mockServer := newTestServer()
    mockServer.start()

    request := &TimezoneRequest{Timestamp: 10000, Location: &Coordinate{Lat: 22.1, Lng: 33.1}, Language: "en", RequestConfig: RequestConfig{Host: mockServer.server.URL}}
    mockServer.addResponseToRequest(request, retryableWrapperResponse)

    c.GetTimezone(context.Background(), request)
    if mockServer.result.calledCount != 4 {
        t.Errorf("mock server should be called 4 times but called %d times", mockServer.result.calledCount)
    }
    if res, ok := mockServer.result.hits["/"+timezoneConfig.path]; !ok || res.calledCount != 4 {
        t.Errorf("timezone path should be called 4 times but called %d times", res.calledCount)
    }
    mockServer.stop()
}

func TestClientRetryInterval_RetryIntervalShouldBeIncreased(t *testing.T) {
    c := NewClient(WithAPIKey("apikey"),
        WithRetryConfig(3, time.Millisecond*time.Duration(300)))

    mockServer := newTestServer()
    mockServer.start()

    request := &TimezoneRequest{Timestamp: 10000, Location: &Coordinate{Lat: 22.1, Lng: 33.1}, Language: "en", RequestConfig: RequestConfig{Host: mockServer.server.URL}}
    mockServer.addResponseToRequest(request, retryableWrapperResponse)

    c.GetTimezone(context.Background(), request)
    res, ok := mockServer.result.hits["/"+timezoneConfig.path]
    if !ok {
        t.Errorf("no request captured for path= %v", timezoneConfig.path)
    }
    for i := 1; i < len(res.infos); i++ {
        oldDuration := res.infos[i-1].callTime
        newDuration := res.infos[i].callTime
        actualDifference := newDuration.Sub(oldDuration).Milliseconds()
        expectedDifference := int64(float64(c.retryInterval.Milliseconds()) * math.Pow(1.5, float64(i)))
        if actualDifference < expectedDifference {
            t.Errorf("actual difference should be equal or bigger than expected difference. actual= %v, expected= %v", actualDifference, expectedDifference)
        }
    }

    mockServer.stop()
}

func TestClientRetry_StopWhenStatusCodeOK(t *testing.T) {
    c := NewClient(WithAPIKey("apikey"), WithRetryConfig(4, time.Millisecond*time.Duration(300)))
    retryableWrapperResponse.StatusOkAfterRequest = 1

    mockServer := newTestServer()
    mockServer.start()
    request := &TimezoneRequest{Timestamp: 10000, Location: &Coordinate{Lat: 22.1, Lng: 33.1}, Language: "en", RequestConfig: RequestConfig{Host: mockServer.server.URL}}
    mockServer.addResponseToRequest(request, retryableWrapperResponse)

    c.GetTimezone(context.Background(), request)
    res, ok := mockServer.result.hits["/"+timezoneConfig.path]
    if !ok {
        t.Errorf("no request captured for path= %v", timezoneConfig.path)
    }
    if res.calledCount != 2 {
        t.Errorf("expected 2 calls but given= %d", res.calledCount)
    }
    mockServer.stop()
}

func assertNull(t *testing.T, given interface{}) {
    if given != nil {
        t.Errorf("expected nil, given= %v", given)
    }
}

func assertNotNull(t *testing.T, given interface{}) {
    if given == nil {
        t.Errorf("expected not nil, given= %v", given)
    }
}
