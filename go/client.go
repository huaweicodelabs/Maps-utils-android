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
    "bytes"
    "context"
    "encoding/json"
    "errors"
    "fmt"
    "io/ioutil"
    "math"
    "net/http"
    "time"
)

const (
    Version     = "1.0.0"
    defaultHost = "https://siteapi.cloud.huawei.com"
    contentType = "application/json; charset=UTF-8"
    userAgent   = "huawei-maps-services-go-client/" + Version
)

// Client Use huawei maps geocode, timezone and places api's with the client.
type Client struct {
    apiKey        string
    host          string
    maxRetry      int
    retryInterval time.Duration
    httpClient    *http.Client
}

// RequestConfig Request configurations sent on each request.
type RequestConfig struct {
    APIKey string
    Host   string
    path   string
}

func (rc RequestConfig) mergeWith(defaultConfig RequestConfig) RequestConfig {
    if rc.path == "" {
        rc.path = defaultConfig.path
    }

    if rc.Host == "" {
        rc.Host = defaultConfig.Host
    }
    return rc
}

// ClientConfiguration ...
type ClientConfiguration func(*Client)

// WithAPIKey Create client configurations with api key.
func WithAPIKey(key string) ClientConfiguration {
    return func(client *Client) {
        client.apiKey = key
    }
}

// WithHTTPClient Set HttpClient to client.
func WithHTTPClient(httpClient *http.Client) ClientConfiguration {
    return func(client *Client) {
        client.httpClient = httpClient
    }
}

// WithHost Set custom host to client.
func WithHost(host string) ClientConfiguration {
    return func(client *Client) {
        client.host = host
    }
}

// WithRetryConfig Set retry configurations.
func WithRetryConfig(maxRetryCount int, interval time.Duration) ClientConfiguration {
    return func(client *Client) {
        client.maxRetry = maxRetryCount
        client.retryInterval = interval
    }
}

// NewClient Create a new client with client configurations.
func NewClient(configs ...ClientConfiguration) *Client {

    client := &Client{host: defaultHost,
        httpClient: &http.Client{Transport: http.DefaultTransport}}

    for _, config := range configs {
        config(client)
    }

    return client
}

func (c *Client) post(ctx context.Context, req RequestConfig, reqBody interface{}) (*http.Response, error) {

    httpReq, err := c.getHTTPRequest("POST", req, reqBody)
    if err != nil {
        return nil, err
    }
    httpReq.Header.Add("Content-Type", contentType)
    httpReq.Header.Add("X-User-Agent", userAgent)

    return c.httpClient.Do(httpReq.WithContext(ctx))
}

func (c *Client) parse(response *http.Response, obj interface{}) error {
    defer response.Body.Close()

    byt, _ := ioutil.ReadAll(response.Body)

    baseResponse := &baseResponse{}
    err := json.Unmarshal(byt, baseResponse)
    if err != nil {
        return newAPIError("-1", "unknown response")
    }

    if baseResponse.ReturnDesc != "OK" && baseResponse.ReturnDesc != "ZERO_RESULTS" {
        return newAPIError(baseResponse.ReturnCode, baseResponse.ReturnDesc)
    }

    return json.Unmarshal(byt, obj)
}

func (c *Client) fetch(ctx context.Context, reqConf RequestConfig, reqBody interface{}, obj interface{}) error {
    httpResponse, err := c.post(ctx, reqConf, reqBody)

    if err != nil {
        return err
    }

    currentRetry := 0
    isRetryable := httpResponse.StatusCode >= 500
    for ; isRetryable && currentRetry < c.maxRetry; currentRetry++ {
        sleepDurationMs := float64(c.retryInterval.Milliseconds()) * math.Pow(1.5, float64(currentRetry+1))
        time.Sleep(time.Millisecond * time.Duration(sleepDurationMs))
        httpResponse, err = c.post(ctx, reqConf, reqBody)
        if err != nil {
            return err
        }
        isRetryable = httpResponse.StatusCode >= 500
    }

    return c.parse(httpResponse, obj)
}

func (c *Client) getHTTPRequest(method string, req RequestConfig, reqBody interface{}) (*http.Request, error) {

    if c.apiKey == "" && req.APIKey == "" {
        return nil, errors.New("api key should be provided in request or in client constructor")
    }

    apiKey := c.apiKey
    host := c.host

    if req.APIKey != "" {
        apiKey = req.APIKey
    }

    if req.Host != "" {
        host = req.Host
    }

    url := buildURL(host, req.path, apiKey)
    byteJSON, _ := json.Marshal(reqBody)
    buffer := bytes.NewBuffer(byteJSON)
    return http.NewRequest(method, url, buffer)
}

func buildURL(host, path, key string) string {
    return fmt.Sprintf("%s/%s?key=%s", host, path, key)
}
