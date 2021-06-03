<?php

/*
   Copyright 2021. Huawei Technologies Co., Ltd. All rights reserved.

   Licensed under the Apache License, Version 2.0 (the "License")
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       https://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

namespace HuaweiMap;

use HuaweiMap\Model\Request\Api\DetailSearchRequest;
use HuaweiMap\Model\Request\Api\GeocodeRequest;
use HuaweiMap\Model\Request\Api\NearbySearchRequest;
use HuaweiMap\Model\Request\Api\QueryAutocompleteRequest;
use HuaweiMap\Model\Request\Api\QuerySuggestionRequest;
use HuaweiMap\Model\Request\Api\ReverseGeocodeRequest;
use HuaweiMap\Model\Request\Api\TextSearchRequest;
use HuaweiMap\Model\Request\Api\TimezoneRequest;
use HuaweiMap\Model\Request\ClientConfig;
use HuaweiMap\Model\Response\Api\DetailSearchResponse;
use HuaweiMap\Model\Response\Api\GeocodeResponse;
use HuaweiMap\Model\Response\Api\NearbySearchResponse;
use HuaweiMap\Model\Response\Api\QueryAutocompleteResponse;
use HuaweiMap\Model\Response\Api\QuerySuggestionResponse;
use HuaweiMap\Model\Response\Api\ReverseGeocodeResponse;
use HuaweiMap\Model\Response\Api\TextSearchResponse;
use HuaweiMap\Model\Response\Api\TimezoneResponse;
use HuaweiMap\Service\GeocodeService;
use HuaweiMap\Service\SiteService;
use HuaweiMap\Service\TimezoneService;

class Client
{
    private $siteService;
    private $geocodeService;
    private $timezoneService;

    function __construct(ClientConfig $config)
    {
        $httpClient = new HttpClient($config);
        $this->siteService = new SiteService($httpClient);
        $this->geocodeService = new GeocodeService($httpClient);
        $this->timezoneService = new TimezoneService($httpClient);
    }

    /**
     * Searches for a place, such as a scenic spot, enterprise,
     * or school, based on a user's input keyword and coordinate
     * bounds. Coordinate bounds are optional.
     *
     * @param TextSearchRequest $request A request object used to search for places by keyword
     * @param ClientConfig|null $requestConfig Custom client config
     * @return TextSearchResponse|null Return object if successfully executed  Return object if successfully executed
     * @throws ApiException Exception thrown if not successfully executed Exception thrown if not successfully executed
     */
    public function textSearch(TextSearchRequest $request, ClientConfig $requestConfig = null)
    {
        return $this->siteService->textSearch($request, $requestConfig);
    }

    /**
     * Searches for places in a specified nearby area.
     * You can optimize the search result by providing keywords
     * or specifying the type of the places to search.
     *
     * @param NearbySearchRequest $request
     * @param ClientConfig|null $requestConfig Custom client config
     * @return NearbySearchResponse|null Return object if successfully executed
     * @throws ApiException Exception thrown if not successfully executed
     */
    function nearbySearch(NearbySearchRequest $request, ClientConfig $requestConfig = null)
    {
        return $this->siteService->nearbySearch($request, $requestConfig);
    }

    /**
     * Obtains details about a place based on its unique ID which serves as the primary key.
     *
     * @param DetailSearchRequest $request
     * @param ClientConfig|null $requestConfig Custom client config
     * @return DetailSearchResponse|null Return object if successfully executed
     * @throws ApiException Exception thrown if not successfully executed
     */
    function detailSearch(DetailSearchRequest $request, ClientConfig $requestConfig = null)
    {
        return $this->siteService->detailSearch($request, $requestConfig);
    }

    /**
     * Provides suggested places when a user enters a search keyword.
     *
     * @param QuerySuggestionRequest $request
     * @param ClientConfig|null $requestConfig Custom client config
     * @return QuerySuggestionResponse|null Return object if successfully executed
     * @throws ApiException Exception thrown if not successfully executed
     */
    function querySuggestion(QuerySuggestionRequest $request, ClientConfig $requestConfig = null)
    {
        return $this->siteService->querySuggestion($request, $requestConfig);
    }

    /**
     * Returns a list of suggested places based on the entered keyword.
     *
     * @param QueryAutocompleteRequest $request
     * @param ClientConfig|null $requestConfig Custom client config
     * @return QueryAutocompleteResponse|null Return object if successfully executed
     * @throws ApiException Exception thrown if not successfully executed
     */
    function queryAutoComplete(QueryAutocompleteRequest $request, ClientConfig $requestConfig = null)
    {
        return $this->siteService->queryAutoComplete($request, $requestConfig);
    }

    /**
     * Obtains the longitude and latitude of a place based on its structured address.
     *
     * @param GeocodeRequest $request
     * @param ClientConfig|null $requestConfig Custom client config
     * @return GeocodeResponse|null Return object if successfully executed
     * @throws ApiException Exception thrown if not successfully executed
     */
    function geocode(GeocodeRequest $request, ClientConfig $requestConfig = null)
    {
        return $this->geocodeService->geocode($request, $requestConfig);
    }

    /**
     * Obtains information about a place based on its longitude and latitude.
     *
     * @param ReverseGeocodeRequest $request
     * @param ClientConfig|null $requestConfig Custom client config
     * @return ReverseGeocodeResponse|null Return object if successfully executed
     * @throws ApiException Exception thrown if not successfully executed
     */
    function reverseGeocode(ReverseGeocodeRequest $request, ClientConfig $requestConfig = null)
    {
        return $this->geocodeService->reverseGeocode($request, $requestConfig);
    }

    /**
     * Obtains the time zone information about a place based on its longitude and latitude.
     *
     * @param TimezoneRequest $request
     * @param ClientConfig|null $requestConfig Custom client config
     * @return TimezoneResponse|null Return object if successfully executed
     * @throws ApiException Exception thrown if not successfully executed
     */
    function getTimezone(TimezoneRequest $request, ClientConfig $requestConfig = null)
    {
        return $this->timezoneService->getTimezone($request, $requestConfig);
    }

}