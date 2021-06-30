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

namespace HuaweiMap\Service;

use HuaweiMap\ApiException;
use HuaweiMap\HttpClient;
use HuaweiMap\Model\Request\Api\DetailSearchRequest;
use HuaweiMap\Model\Request\Api\NearbySearchRequest;
use HuaweiMap\Model\Request\Api\QueryAutocompleteRequest;
use HuaweiMap\Model\Request\Api\QuerySuggestionRequest;
use HuaweiMap\Model\Request\Api\TextSearchRequest;
use HuaweiMap\Model\Request\ClientConfig;
use HuaweiMap\Model\Response\Api\DetailSearchResponse;
use HuaweiMap\Model\Response\Api\NearbySearchResponse;
use HuaweiMap\Model\Response\Api\QueryAutocompleteResponse;
use HuaweiMap\Model\Response\Api\QuerySuggestionResponse;
use HuaweiMap\Model\Response\Api\TextSearchResponse;

class SiteService extends HttpService
{
    const URL_TEXT_SEARCH = "/mapApi/v1/siteService/searchByText";
    const URL_NEARBY_SEARCH = "/mapApi/v1/siteService/nearbySearch";
    const URL_DETAIL_SEARCH = "/mapApi/v1/siteService/searchById";
    const URL_QUERY_SUGGESTION = "/mapApi/v1/siteService/querySuggestion";
    const URL_QUERY_AUTOCOMPLETE = "/mapApi/v1/siteService/queryAutoComplete";

    public function __construct(HttpClient $httpClient)
    {
        parent::__construct($httpClient);
    }

    /**
     * @param TextSearchRequest $request
     * @param ClientConfig|null $requestConfig
     * @return TextSearchResponse|null
     * @throws ApiException
     */
    function textSearch(TextSearchRequest $request, ClientConfig $requestConfig = null)
    {
        return TextSearchResponse::toObject($this->post(self::URL_TEXT_SEARCH, $request, $requestConfig));
    }

    /**
     * @param NearbySearchRequest $request
     * @param ClientConfig|null $requestConfig
     * @return NearbySearchResponse|null
     * @throws ApiException
     */
    function nearbySearch(NearbySearchRequest $request, ClientConfig $requestConfig = null)
    {
        return NearbySearchResponse::toObject($this->post(self::URL_NEARBY_SEARCH, $request, $requestConfig));
    }

    /**
     * @param DetailSearchRequest $request
     * @param ClientConfig|null $requestConfig
     * @return DetailSearchResponse|null
     * @throws ApiException
     */
    function detailSearch(DetailSearchRequest $request, ClientConfig $requestConfig = null)
    {
        return DetailSearchResponse::toObject($this->post(self::URL_DETAIL_SEARCH, $request, $requestConfig));
    }

    /**
     * @param QuerySuggestionRequest $request
     * @param ClientConfig|null $requestConfig
     * @return QuerySuggestionResponse|null
     * @throws ApiException
     */
    function querySuggestion(QuerySuggestionRequest $request, ClientConfig $requestConfig = null)
    {
        return QuerySuggestionResponse::toObject($this->post(self::URL_QUERY_SUGGESTION, $request, $requestConfig));
    }

    /**
     * @param QueryAutocompleteRequest $request
     * @param ClientConfig|null $requestConfig
     * @return QueryAutocompleteResponse|null
     * @throws ApiException
     */
    function queryAutoComplete(QueryAutocompleteRequest $request, ClientConfig $requestConfig = null)
    {
        return QueryAutocompleteResponse::toObject($this->post(self::URL_QUERY_AUTOCOMPLETE, $request, $requestConfig));
    }
}