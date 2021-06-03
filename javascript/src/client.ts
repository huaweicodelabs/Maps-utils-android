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

import { TextSearchRequest, TextSearchResponse } from "./models/site/textSearch";
import { NearbySearchRequest, NearbySearchResponse } from "./models/site/nearbySearch";
import { DetailSearchRequest, DetailSearchResponse } from "./models/site/detailSearch";
import { QuerySuggestionRequest, QuerySuggestionResponse } from "./models/site/querySuggestion";
import { QueryAutoCompleteRequest, QueryAutoCompleteResponse } from "./models/site/queryAutocomplete";
import { GeocodeRequest, GeocodeResponse } from "./models/site/geocode";
import { ReverseGeocodeRequest, ReverseGeocodeResponse } from "./models/site/reverseGeocode";
import { TimezoneRequest, TimezoneResponse } from "./models/site/timezone";
import { ClientConfig } from "./models/common/common";
import { SiteService } from "./siteService";
import { HttpClient } from "./httpClient";

const defaultHeaders = {
  // eslint-disable-next-line @typescript-eslint/no-var-requires
  "X-User-Agent": `huawei-maps-services-node-client/${require("../package.json").version}`,
  "Content-Type": "application/json;charset=utf-8",
};

const defaultRetryOpts = {
  maxRetry: 0,
  retryInterval: 1000,
  retryCount: 0,
  intervalFactor: 1.5,
};

const defaultClientConfig = {
  baseURL: "https://siteapi.cloud.huawei.com",
  timeout: 100000,
  retryOpts: defaultRetryOpts,
};

export class Client {
  private siteService: SiteService;
  private httpClient: HttpClient;

  constructor(config?: ClientConfig) {
    this.httpClient = new HttpClient({
      headers: defaultHeaders,
      ...defaultClientConfig,
      ...config,
      retryOpts: { ...defaultClientConfig.retryOpts, ...config?.retryOpts },
    });
    this.siteService = new SiteService(this.httpClient);
  }

  /**
   * Searches for a place, such as a scenic spot, enterprise,
   * or school, based on a user's input keyword and coordinate
   * bounds. Coordinate bounds are optional.
   *
   * @param request A request object used to search for places by keyword.
   * @param clientConfig Custom client config
   * @returns `Promise<TextSearchResponse>` When it is successfully executed,
   * promise is resolved into a TextSearchResponse. Otherwise, you will get an error.
   *
   * @example
   * ```ts
   * const resp = await client.textSearch(request);
   * console.log(JSON.stringify(resp));
   * ```
   */
  textSearch(request: TextSearchRequest, clientConfig?: ClientConfig): Promise<TextSearchResponse> {
    return this.siteService.textSearch(request, clientConfig);
  }
  /**
   * Searches for places in a specified nearby area.
   * You can optimize the search result by providing keywords
   * or specifying the type of the places to search.
   *
   * @param request A request object used to search for nearby places.
   * @param clientConfig Custom client config
   * @returns `Promise<NearbySearchResponse>` When it is successfully executed,
   * promise is resolved into a NearbySearchResponse. Otherwise, you will get an error.
   *
   * @example
   * ```ts
   * const resp = await client.nearbySearch(request);
   * console.log(JSON.stringify(resp));
   * ```
   */
  nearbySearch(request: NearbySearchRequest, clientConfig?: ClientConfig): Promise<NearbySearchResponse> {
    return this.siteService.nearbySearch(request, clientConfig);
  }
  /**
   * Obtains details about a place based on its unique ID which serves as the primary key.
   *
   * @param request A request object used to search for place details.
   * @param clientConfig Custom client config
   * @returns `Promise<DetailSearchResponse>` When it is successfully executed,
   * promise is resolved into a DetailSearchResponse. Otherwise, you will get an error.
   *
   * @example
   * ```ts
   * const resp = await client.detailSearch(request);
   * console.log(JSON.stringify(resp));
   * ```
   */
  detailSearch(request: DetailSearchRequest, clientConfig?: ClientConfig): Promise<DetailSearchResponse> {
    return this.siteService.detailSearch(request, clientConfig);
  }
  /**
   * Provides suggested places when a user enters a search keyword.
   *
   * @param request A request object used to search for place details.
   * @param clientConfig Custom client config
   * @returns `Promise<QuerySuggestionResponse>` When it is successfully executed,
   * promise is resolved into a QuerySuggestionResponse. Otherwise, you will get an error.
   *
   * @example
   * ```ts
   * const resp = await client.querySuggestion(request);
   * console.log(JSON.stringify(resp));
   * ```
   */
  querySuggestion(request: QuerySuggestionRequest, clientConfig?: ClientConfig): Promise<QuerySuggestionResponse> {
    return this.siteService.querySuggestion(request, clientConfig);
  }
  /**
   * Returns a list of suggested places based on the entered keyword.
   *
   * @param request An autocomplete request object.
   * @param clientConfig Custom client config
   * @returns `Promise<QueryAutoCompleteResponse>` When it is successfully executed,
   * promise is resolved into a QueryAutoCompleteResponse. Otherwise, you will get an error.
   *
   * @example
   * ```ts
   * const resp = await client.queryAutoComplete(request);
   * console.log(JSON.stringify(resp));
   * ```
   */
  queryAutoComplete(
    request: QueryAutoCompleteRequest,
    clientConfig?: ClientConfig
  ): Promise<QueryAutoCompleteResponse> {
    return this.siteService.queryAutoComplete(request, clientConfig);
  }
  /**
   * Obtains the longitude and latitude of a place based on its structured address.
   *
   * @param request A geocode request object
   * @param clientConfig Custom client config
   * @returns `Promise<GeocodeResponse>` When it is successfully executed,
   * promise is resolved into a GeocodeResponse. Otherwise, you will get an error.
   *
   * @example
   * ```ts
   * const resp = await client.geocode(request);
   * console.log(JSON.stringify(resp));
   * ```
   */
  geocode(request: GeocodeRequest, clientConfig?: ClientConfig): Promise<GeocodeResponse> {
    return this.siteService.geocode(request, clientConfig);
  }
  /**
   * Obtains information about a place based on its longitude and latitude.
   *
   * @param request A reverse geocode request object.
   * @param clientConfig Custom client config
   * @returns `Promise<ReverseGeocodeResponse>` When it is successfully executed,
   * promise is resolved into a ReverseGeocodeResponse. Otherwise, you will get an error.
   *
   * @example
   * ```ts
   * const resp = await client.reverseGeocode(request);
   * console.log(JSON.stringify(resp));
   * ```
   */
  reverseGeocode(request: ReverseGeocodeRequest, clientConfig?: ClientConfig): Promise<ReverseGeocodeResponse> {
    return this.siteService.reverseGeocode(request, clientConfig);
  }
  /**
   * Obtains the time zone information about a place based on its longitude and latitude.
   *
   * @param request A timezone request object.
   * @param clientConfig Custom client config
   * @returns `Promise<TimezoneResponse>` When it is successfully executed,
   * promise is resolved into a TimezoneResponse. Otherwise, you will get an error.
   *
   * @example
   * ```ts
   * const resp = await client.getTimezone(request);
   * console.log(JSON.stringify(resp));
   * ```
   */
  getTimezone(request: TimezoneRequest, clientConfig?: ClientConfig): Promise<TimezoneResponse> {
    return this.siteService.getTimezone(request, clientConfig);
  }
}
