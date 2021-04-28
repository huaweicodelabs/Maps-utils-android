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

package com.huawei.hms.site.client.common;

import org.apache.commons.lang3.StringUtils;

import com.huawei.hms.site.client.ApiContext;
import com.huawei.hms.site.client.util.Preconditions;

/**
 * Stores common data, such as appId and apiKey.
 *
 * @since 2021-01-21
 */
public class ContextDataCache {
    private static String apiKey = "";

    private static String baseUrl = "";

    private ContextDataCache() {
    }

    public static String getApiKey() {
        return apiKey;
    }

    public static void setApiKey(String apiKey) {
        ContextDataCache.apiKey = apiKey;
    }

    public static String getBaseUrl() {
        return baseUrl;
    }

    public static void setBaseUrl(String baseUrl) {
        ContextDataCache.baseUrl = baseUrl;
    }

    public static void setAppData(ApiContext apiContext) {
        Preconditions.checkArgument(StringUtils.isNotEmpty(apiContext.getApiKey()), "apiKey is empty.");
        Preconditions.checkArgument(StringUtils.isNotEmpty(apiContext.getBaseUrl()), "baseUrl is empty.");

        apiKey = apiContext.getApiKey();
        baseUrl = apiContext.getBaseUrl();
    }
}
