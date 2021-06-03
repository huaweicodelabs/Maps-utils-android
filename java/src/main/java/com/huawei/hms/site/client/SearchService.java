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

package com.huawei.hms.site.client;

import com.huawei.hms.site.client.model.DetailSearchRequest;
import com.huawei.hms.site.client.model.DetailSearchResponse;
import com.huawei.hms.site.client.model.GeocodeRequest;
import com.huawei.hms.site.client.model.GeocodeResponse;
import com.huawei.hms.site.client.model.NearbySearchRequest;
import com.huawei.hms.site.client.model.NearbySearchResponse;
import com.huawei.hms.site.client.model.QueryAutocompleteRequest;
import com.huawei.hms.site.client.model.QueryAutocompleteResponse;
import com.huawei.hms.site.client.model.QuerySuggestionRequest;
import com.huawei.hms.site.client.model.QuerySuggestionResponse;
import com.huawei.hms.site.client.model.ReverseGeocodeRequest;
import com.huawei.hms.site.client.model.ReverseGeocodeResponse;
import com.huawei.hms.site.client.model.TextSearchRequest;
import com.huawei.hms.site.client.model.TextSearchResponse;
import com.huawei.hms.site.client.model.TimezoneRequest;
import com.huawei.hms.site.client.model.TimezoneResponse;

/**
 * The CP obtains the implementation class of the interface through the SearchServiceFactory interface and invokes the
 * search interface.
 *
 * @since 2021-01-21
 */
public interface SearchService {
    /**
     * textSearch
     *
     * @param request request
     * @param listener listener
     */
    void textSearch(TextSearchRequest request, SearchResultListener<TextSearchResponse> listener);

    /**
     * nearbySearch
     *
     * @param request request
     * @param listener listener
     */
    void nearbySearch(NearbySearchRequest request, SearchResultListener<NearbySearchResponse> listener);

    /**
     * detailSearch
     *
     * @param request request
     * @param listener listener
     */
    void detailSearch(DetailSearchRequest request, SearchResultListener<DetailSearchResponse> listener);

    /**
     * querySuggestion
     *
     * @param request request
     * @param listener listener
     */
    void querySuggestion(QuerySuggestionRequest request, SearchResultListener<QuerySuggestionResponse> listener);

    /**
     * queryAutocomplete
     *
     * @param request request
     * @param listener listener
     */
    void queryAutocomplete(QueryAutocompleteRequest request, SearchResultListener<QueryAutocompleteResponse> listener);

    /**
     * geocode
     *
     * @param request request
     * @param listener listener
     */
    void geocode(GeocodeRequest request, SearchResultListener<GeocodeResponse> listener);

    /**
     * reverseGeocode
     *
     * @param request request
     * @param listener listener
     */
    void reverseGeocode(ReverseGeocodeRequest request, SearchResultListener<ReverseGeocodeResponse> listener);

    /**
     * getTimezone
     *
     * @param request request
     * @param listener listener
     */
    void getTimezone(TimezoneRequest request, SearchResultListener<TimezoneResponse> listener);
}
