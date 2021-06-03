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

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.huawei.hms.site.client.SearchResultListener;
import com.huawei.hms.site.client.constans.ErrorCodeConstants;
import com.huawei.hms.site.client.internal.client.DetailSearchRequestClient;
import com.huawei.hms.site.client.internal.client.GeoCodeRequestClient;
import com.huawei.hms.site.client.internal.client.NearBySearchRequestClient;
import com.huawei.hms.site.client.internal.client.QueryAutoCompleteRequestClient;
import com.huawei.hms.site.client.internal.client.QuerySuggestionRequestClient;
import com.huawei.hms.site.client.internal.client.ReverseGeoCodeRequestClient;
import com.huawei.hms.site.client.internal.client.TextSearchRequestClient;
import com.huawei.hms.site.client.internal.client.TimezoneRequestClient;
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
import com.huawei.hms.site.client.model.SearchStatus;
import com.huawei.hms.site.client.model.TextSearchRequest;
import com.huawei.hms.site.client.model.TextSearchResponse;
import com.huawei.hms.site.client.model.TimezoneRequest;
import com.huawei.hms.site.client.model.TimezoneResponse;
import com.huawei.hms.site.client.util.Preconditions;

/**
 * Request management
 *
 * @since 2021-01-21
 */
public class SiteRequestManager {
    private static final Logger LOG = LoggerFactory.getLogger(SiteRequestManager.class.getName());

    private static class Holder {
        private static final SiteRequestManager INSTANCE = new SiteRequestManager();
    }

    public static SiteRequestManager getInstance() {
        return SiteRequestManager.Holder.INSTANCE;
    }

    /**
     * textSearch
     *
     * @param request textSearchRequest
     * @param listener listener
     */
    public void textSearch(TextSearchRequest request, SearchResultListener<TextSearchResponse> listener) {
        LOG.debug("text search request start...");
        // Check parameters.
        Preconditions.checkState(request != null, "TextSearchRequest is null.");
        Preconditions.checkArgument(request.getQuery() != null, "query is null.");

        // Initiating request
        TextSearchResponse response = TextSearchRequestClient.textQuery(request);
        if (!ErrorCodeConstants.SUCCESS.equalsCode(response.getReturnCode())) {
            listener.onSearchError(new SearchStatus(response.getReturnCode(), response.getReturnDesc()));
            return;
        }
        listener.onSearchResult(response);
    }

    /**
     * detailSearch
     *
     * @param request nearbySearchRequest
     * @param listener listener
     */
    public void nearbySearch(NearbySearchRequest request, SearchResultListener<NearbySearchResponse> listener) {
        LOG.debug("near search request start...");
        // Check parameters.
        Preconditions.checkState(request != null, "NearbySearchRequest is null.");
        Preconditions.checkArgument(request.getLocation() != null, "location is null.");

        // Initiating request
        NearbySearchResponse response = NearBySearchRequestClient.nearbyQuery(request);
        if (!ErrorCodeConstants.SUCCESS.equalsCode(response.getReturnCode())) {
            listener.onSearchError(new SearchStatus(response.getReturnCode(), response.getReturnDesc()));
            return;
        }
        listener.onSearchResult(response);
    }

    /**
     * detailSearch
     *
     * @param request detailSearchRequest
     * @param listener listener
     */
    public void detailSearch(DetailSearchRequest request, SearchResultListener<DetailSearchResponse> listener) {
        LOG.debug("detail search request start...");
        // Check parameters.
        Preconditions.checkState(request != null, "DetailSearchRequest is null.");
        Preconditions.checkArgument(StringUtils.isNotEmpty(request.getSiteId()), "siteId is null.");

        // Initiating request
        DetailSearchResponse response = DetailSearchRequestClient.detailQuery(request);
        if (!ErrorCodeConstants.SUCCESS.equalsCode(response.getReturnCode())) {
            listener.onSearchError(new SearchStatus(response.getReturnCode(), response.getReturnDesc()));
            return;
        }
        listener.onSearchResult(response);
    }

    /**
     * querySuggestion
     *
     * @param request querySuggestionRequest
     * @param listener listener
     */
    public void querySuggestion(QuerySuggestionRequest request,
        SearchResultListener<QuerySuggestionResponse> listener) {
        LOG.debug("query suggestion request start...");
        // Check parameters.
        Preconditions.checkState(request != null, "QuerySuggestionRequest is null.");
        Preconditions.checkArgument(request.getQuery() != null, "query is null.");

        // Initiating request
        QuerySuggestionResponse response = QuerySuggestionRequestClient.suggestionQuery(request);
        if (!ErrorCodeConstants.SUCCESS.equalsCode(response.getReturnCode())) {
            listener.onSearchError(new SearchStatus(response.getReturnCode(), response.getReturnDesc()));
            return;
        }
        listener.onSearchResult(response);
    }

    /**
     * queryAutocomplete
     *
     * @param request queryAutocompleteRequest
     * @param listener listener
     */
    public void queryAutocomplete(QueryAutocompleteRequest request,
        SearchResultListener<QueryAutocompleteResponse> listener) {
        LOG.debug("query auto complete request start...");
        // Check parameters.
        Preconditions.checkState(request != null, "QueryAutocompleteRequest is null.");
        Preconditions.checkArgument(request.getQuery() != null, "query is null.");

        // Initiating request
        QueryAutocompleteResponse response = QueryAutoCompleteRequestClient.autocompleteQuery(request);
        if (!ErrorCodeConstants.SUCCESS.equalsCode(response.getReturnCode())) {
            listener.onSearchError(new SearchStatus(response.getReturnCode(), response.getReturnDesc()));
            return;
        }
        listener.onSearchResult(response);
    }

    /**
     * geocode
     *
     * @param request geoCodeRequest
     * @param listener listener
     */
    public void geocode(GeocodeRequest request, SearchResultListener<GeocodeResponse> listener) {
        LOG.debug("geocode request start...");
        // Check parameters.
        Preconditions.checkState(request != null, "GeoCodeRequest is null.");
        Preconditions.checkArgument(StringUtils.isNotEmpty(request.getAddress()), "address is null.");

        // Initiating request
        GeocodeResponse response = GeoCodeRequestClient.geocodeQuery(request);
        if (!ErrorCodeConstants.SUCCESS.equalsCode(response.getReturnCode())) {
            listener.onSearchError(new SearchStatus(response.getReturnCode(), response.getReturnDesc()));
            return;
        }
        listener.onSearchResult(response);
    }

    /**
     * reverseGeocode
     *
     * @param request reverseGeoCodeRequest
     * @param listener listener
     */
    public void reverseGeocode(ReverseGeocodeRequest request, SearchResultListener<ReverseGeocodeResponse> listener) {
        LOG.debug("reverseGeocode request start...");
        // Check parameters.
        Preconditions.checkState(request != null, "ReverseGeoCodeRequest is null.");
        Preconditions.checkState(request.getLocation() != null, "location is null.");

        // Initiating request
        ReverseGeocodeResponse response = ReverseGeoCodeRequestClient.reverseGeocodeQuery(request);
        if (!ErrorCodeConstants.SUCCESS.equalsCode(response.getReturnCode())) {
            listener.onSearchError(new SearchStatus(response.getReturnCode(), response.getReturnDesc()));
            return;
        }
        listener.onSearchResult(response);
    }

    /**
     * getTimezone
     *
     * @param request timezoneRequest
     * @param listener listener
     */
    public void getTimezone(TimezoneRequest request, SearchResultListener<TimezoneResponse> listener) {
        LOG.debug("getTimezone request start...");
        // Check parameters.
        Preconditions.checkState(request != null, "TimezoneRequest is null.");
        Preconditions.checkArgument(request.getLocation() != null, "location is null.");
        Preconditions.checkArgument(request.getTimestamp() != null, "timestamp is null.");

        // Initiating request
        TimezoneResponse response = TimezoneRequestClient.timezoneQuery(request);
        if (!ErrorCodeConstants.SUCCESS.equalsCode(response.getReturnCode())) {
            listener.onSearchError(new SearchStatus(response.getReturnCode(), response.getReturnDesc()));
            return;
        }
        listener.onSearchResult(response);
    }
}
