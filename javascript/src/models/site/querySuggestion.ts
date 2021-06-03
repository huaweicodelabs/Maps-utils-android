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

import { ApiResponse, Coordinate, CoordinateBounds, Language, Site } from "../common/common";
import { LocationType } from "../common/poiTypes";

/** querySuggestion request object. */
export interface QuerySuggestionRequest {
  /** Search keyword. This parameter is mandatory. */
  query: string;

  /**
   * Longitude and latitude to which search results need to be biased.
   * NOTE:If both location and bounds are passed, the value of bounds takes precedence.
   */
  location?: Coordinate;

  /**
   * Search radius, in meters.
   * The value ranges from 1 to 50000.
   * The default value is 50000.
   */
  radius?: number;

  /**
   * Coordinate bounds to which search results need to be biased.
   * NOTE:If both bounds and location are passed, the value of bounds takes precedence.
   */
  bounds?: CoordinateBounds;

  /** List of POI types. */
  poiTypes?: LocationType[];
  /**
   * Country/region code, which complies with the ISO 3166-1 alpha-2 standard. This parameter is used to specify the
   * country/region where places are searched.
   */
  countryCode?: string;

  /**
   * Language in which search results are displayed.
   * If this parameter is not passed, the local language will be used.
   */
  language?: Language;

  /**
   * Indicates whether to return information about child nodes. The options are true (indicating to return the IDs of
   * child nodes) and false (indicating that no child information is returned). The default value is false.
   */
  children?: boolean;
}

/** querySuggestion response object. */
export interface QuerySuggestionResponse extends ApiResponse {
  /**  List of suggested places, excluding the POI information. */
  sites: Site[];
}
