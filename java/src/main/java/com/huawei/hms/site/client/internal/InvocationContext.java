/*
 * Copyright 2021. Huawei Technologies Co., Ltd. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.huawei.hms.site.client.internal;

import java.net.URL;
import java.util.LinkedHashMap;
import java.util.Map;

import com.huawei.hms.site.client.constans.ApiInfoConstants;
import com.huawei.hms.site.client.dto.ApiInfoDTO;

import okhttp3.OkHttpClient;
import okhttp3.Request;

/**
 * Encapsulating HTTP Request Processing Method
 *
 * @since 2021-01-21
 */
public class InvocationContext<R> {
    private ApiInfoDTO apiInfo;

    private R request;

    private Map<String, String> queryParamMap = new LinkedHashMap<>();

    private Map<String, String> headerMap = new LinkedHashMap<>();

    private URL url;

    private OkHttpClient httpClient;

    private Request httpRequest;

    public InvocationContext(ApiInfoDTO apiInfo, R request) {
        this.apiInfo = apiInfo;
        this.request = request;
    }

    public ApiInfoDTO getApiInfo() {
        return apiInfo;
    }

    public void setApiInfo(ApiInfoDTO apiInfo) {
        this.apiInfo = apiInfo;
    }

    public R getRequest() {
        return request;
    }

    public void setRequest(R request) {
        this.request = request;
    }

    public void addRequestQueryParam(String key, String value) {
        queryParamMap.put(key, value);
    }

    public void addRequestHeader(String key, String value) {
        headerMap.put(key, value);
    }

    public Map<String, String> getRequestQueryParamMap() {
        return queryParamMap;
    }

    public Map<String, String> getRequestHeaderMap() {
        return headerMap;
    }

    public URL getUrl() {
        return url;
    }

    public void setUrl(URL url) {
        this.url = url;
    }

    public OkHttpClient getHttpClient() {
        return httpClient;
    }

    public void setHttpClient(OkHttpClient httpClient) {
        this.httpClient = httpClient;
    }

    public Request getHttpRequest() {
        return httpRequest;
    }

    public void setHttpRequest(Request httpRequest) {
        this.httpRequest = httpRequest;
    }

    /**
     * 拼装完整的URL
     *
     * @return url
     */
    public String assembleCompleteURL() {
        StringBuilder urlBuilder = new StringBuilder(url.toString());
        int index = 0;
        for (Map.Entry<String, String> entry : queryParamMap.entrySet()) {
            String value = entry.getValue();
            if (value != null) {
                String prefix = (index == 0) ? "?" : "&";
                urlBuilder.append(prefix)
                    .append(entry.getKey())
                    .append("=")
                    .append(ApiInfoConstants.urlEncodeString(value));

                index++;
            }
        }

        return urlBuilder.toString();
    }
}
