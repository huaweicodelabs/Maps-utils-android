/**
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

import { ClientConfig } from "./models/common/common";
import { HttpClient } from "./httpClient";
import { TextSearchRequest, TextSearchResponse } from "./models/site/textSearch";
import { NearbySearchRequest, NearbySearchResponse } from "./models/site/nearbySearch";
import { DetailSearchRequest, DetailSearchResponse } from "./models/site/detailSearch";
import { QuerySuggestionRequest, QuerySuggestionResponse } from "./models/site/querySuggestion";
import { QueryAutoCompleteRequest, QueryAutoCompleteResponse } from "./models/site/queryAutocomplete";
import { GeocodeRequest, GeocodeResponse } from "./models/site/geocode";
import { ReverseGeocodeRequest, ReverseGeocodeResponse } from "./models/site/reverseGeocode";
import { TimezoneRequest, TimezoneResponse } from "./models/site/timezone";

enum SitePaths {
  TEXT_SEARCH = "/mapApi/v1/siteService/searchByText",
  NEARBY_SEARCH = "/mapApi/v1/siteService/nearbySearch",
  DETAIL_SEARCH = "/mapApi/v1/siteService/searchById",
  QUERY_SUGGESTION = "/mapApi/v1/siteService/querySuggestion",
  QUERY_AUTOCOMPLETE = "/mapApi/v1/siteService/queryAutoComplete",
  GEOCODE = "/mapApi/v1/siteService/geocode",
  REVERSE_GEOCODE = "/mapApi/v1/siteService/reverseGeocode",
  TIMEZONE = "/mapApi/v1/timezoneService/getTimezone",
}

export class SiteService {
  constructor(private httpClient: HttpClient) {}

  textSearch(request: TextSearchRequest, requestConfig?: ClientConfig): Promise<TextSearchResponse> {
    return this.httpClient.post(SitePaths.TEXT_SEARCH, request, requestConfig);
  }

  nearbySearch(request: NearbySearchRequest, requestConfig?: ClientConfig): Promise<NearbySearchResponse> {
    return this.httpClient.post(SitePaths.NEARBY_SEARCH, request, requestConfig);
  }

  detailSearch(request: DetailSearchRequest, requestConfig?: ClientConfig): Promise<DetailSearchResponse> {
    return this.httpClient.post(SitePaths.DETAIL_SEARCH, request, requestConfig);
  }

  querySuggestion(request: QuerySuggestionRequest, requestConfig?: ClientConfig): Promise<QuerySuggestionResponse> {
    return this.httpClient.post(SitePaths.QUERY_SUGGESTION, request, requestConfig);
  }

  queryAutoComplete(
    request: QueryAutoCompleteRequest,
    requestConfig?: ClientConfig
  ): Promise<QueryAutoCompleteResponse> {
    return this.httpClient.post(SitePaths.QUERY_AUTOCOMPLETE, request, requestConfig);
  }

  geocode(request: GeocodeRequest, requestConfig?: ClientConfig): Promise<GeocodeResponse> {
    return this.httpClient.post(SitePaths.GEOCODE, request, requestConfig);
  }

  reverseGeocode(request: ReverseGeocodeRequest, requestConfig?: ClientConfig): Promise<ReverseGeocodeResponse> {
    return this.httpClient.post(SitePaths.REVERSE_GEOCODE, request, requestConfig);
  }

  getTimezone(request: TimezoneRequest, requestConfig?: ClientConfig): Promise<TimezoneResponse> {
    return this.httpClient.post(SitePaths.TIMEZONE, request, requestConfig);
  }
}
