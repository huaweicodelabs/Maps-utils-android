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

import { ApiResponse, Coordinate, Language, Site } from "../common/common";
import { LocationType, HwLocationType } from "../common/poiTypes";

/** textSearch request object. */
export interface TextSearchRequest {
  /** Search keyword. */
  query: string;

  /** Longitude and latitude to which search results need to be biased. */
  location?: Coordinate;

  /**
   * Search radius, in meters.
   * The value ranges from 1 to 50000.
   * The default value is 50000.
   */
  radius?: number;

  /** POI type. */
  poiType?: LocationType;

  /**
   * Huawei POI type. This parameter is recommended.
   * NOTE:If both hwPoiType and poiType are set, search results of hwPoiType take precedence.
   */
  hwPoiType?: HwLocationType;

  /**
   * Country/Region code, which complies with the ISO 3166-1 alpha-2 standard. This parameter is used to specify the
   * country/region where places are searched.
   */
  countryCode?: string;

  /**
   * Language in which search results are displayed.
   * If this parameter is not passed, the local language will be used.
   */
  language?: Language;

  /**
   * Number of records on each page. The value ranges from 1 to 20. The default value is 20.
   * NOTE:pageIndex * pageSize <= 60
   */
  pageSize?: number;

  /**
   * Number of the current page. The value ranges from 1 to 60. The default value is 1.
   * NOTE:pageIndex * pageSize <= 60
   */
  pageIndex?: number;

  /**
   * Indicates whether to return information about child nodes. The options are true (indicating to return all
   * information about child nodes) and false (indicating that no child information is returned). The default value is
   * false.
   */
  children?: boolean;
}

/** textSearch response object. */
export interface TextSearchResponse extends ApiResponse {
  /** Total number of matched places. */
  totalCount: number;

  /** List of matched places.*/
  sites: Site[];
}
