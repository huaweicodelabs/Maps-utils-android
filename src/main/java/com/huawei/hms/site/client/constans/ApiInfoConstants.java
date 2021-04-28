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

package com.huawei.hms.site.client.constans;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.huawei.hms.site.client.dto.ApiInfoDTO;

/**
 * Cloud-based access interface parameters
 *
 * @since 2021-01-21
 */
public class ApiInfoConstants {
    private static final Logger LOG = LoggerFactory.getLogger(ApiInfoConstants.class.getName());

    /**
     * searchByText
     */
    public static final ApiInfoDTO SEARCH_BY_TEXT = ApiInfoDTO.Builder.create()
        .setName("SiteService.searchByText")
        .setUrl("/mapApi/v1/siteService/searchByText")
        .setHttpConnectTimeOut(10000)
        .setHttpReadTimeOut(10000)
        .setHttpMethod("POST")
        .build();

    /**
     * nearbySearch
     */
    public static final ApiInfoDTO NEARBY_SEARCH = ApiInfoDTO.Builder.create()
        .setName("SiteService.nearbySearch")
        .setUrl("/mapApi/v1/siteService/nearbySearch")
        .setHttpConnectTimeOut(10000)
        .setHttpReadTimeOut(10000)
        .setHttpMethod("POST")
        .build();

    /**
     * searchById
     */
    public static final ApiInfoDTO SEARCH_BY_ID = ApiInfoDTO.Builder.create()
        .setName("SiteService.searchById")
        .setUrl("/mapApi/v1/siteService/searchById")
        .setHttpConnectTimeOut(10000)
        .setHttpReadTimeOut(10000)
        .setHttpMethod("POST")
        .build();

    /**
     * querySuggestion
     */
    public static final ApiInfoDTO QUERY_SUGGESTION = ApiInfoDTO.Builder.create()
        .setName("SiteService.querySuggestion")
        .setUrl("/mapApi/v1/siteService/querySuggestion")
        .setHttpConnectTimeOut(10000)
        .setHttpReadTimeOut(10000)
        .setHttpMethod("POST")
        .build();

    /**
     * queryAutoComplete
     */
    public static final ApiInfoDTO QUERY_AUTO_COMPLETE = ApiInfoDTO.Builder.create()
        .setName("SiteService.queryAutoComplete")
        .setUrl("/mapApi/v1/siteService/queryAutoComplete")
        .setHttpConnectTimeOut(10000)
        .setHttpReadTimeOut(10000)
        .setHttpMethod("POST")
        .build();

    /**
     * geocode
     */
    public static final ApiInfoDTO GEOCODE = ApiInfoDTO.Builder.create()
        .setName("SiteService.geocode")
        .setUrl("/mapApi/v1/siteService/geocode")
        .setHttpConnectTimeOut(10000)
        .setHttpReadTimeOut(10000)
        .setHttpMethod("POST")
        .build();

    /**
     * reverseGeocode
     */
    public static final ApiInfoDTO REVERSE_GEOCODE = ApiInfoDTO.Builder.create()
        .setName("SiteService.reverseGeocode")
        .setUrl("/mapApi/v1/siteService/reverseGeocode")
        .setHttpConnectTimeOut(10000)
        .setHttpReadTimeOut(10000)
        .setHttpMethod("POST")
        .build();

    /**
     * getTimezone
     */
    public static final ApiInfoDTO GET_TIME_ZONE = ApiInfoDTO.Builder.create()
        .setName("SiteService.getTimezone")
        .setUrl("/mapApi/v1/timezoneService/getTimezone")
        .setHttpConnectTimeOut(10000)
        .setHttpReadTimeOut(10000)
        .setHttpMethod("POST")
        .build();

    /**
     * Obtaining the URL
     *
     * @return string
     */
    public static String getUrlPath(ApiInfoDTO apiInfoDTO) {
        return apiInfoDTO.getUrl();
    }

    /**
     * Process the input parameter urlEncode and return the encoded result.
     *
     * @param param Parameter
     * @return encode value
     */
    public static String urlEncodeString(String param) {
        String result = "";
        try {
            result = URLEncoder.encode(param, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            LOG.error("urlEncode error.");
        }
        return result;
    }
}
