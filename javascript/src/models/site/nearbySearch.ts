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
import { HwLocationType, LocationType } from "../common/poiTypes";

/** nearbySearch request object.  */
export interface NearbySearchRequest {
  /** Current location of a user. */
  location: Coordinate;

  /**
   * Search radius, in meters.
   * The value ranges from 1 to 50000.
   * The default value is 1000.
   */
  radius?: number;

  /** Search keyword. */
  query?: string;

  /** POI type. */
  poiType?: LocationType;

  /**
   * Huawei POI type. This parameter is recommended.
   * NOTE:If both hwPoiType and poiType are set, search results of hwPoiType take precedence.
   */
  hwPoiType?: HwLocationType;

  /**
   * Language in which search results are displayed.
   * If this parameter is not passed, the local language will be used.
   */
  language?: Language;

  /**
   * Number of the current page. The value ranges from 1 to 60. The default value is 1.
   * NOTE：pageIndex * pageSize <= 60
   */
  pageSize?: number;

  /**
   * Number of records on each page. The value ranges from 1 to 20. The default value is 20.
   * NOTE：pageIndex * pageSize <= 60
   */
  pageIndex?: number;
}

/** nearbySearch response object. */
export interface NearbySearchResponse extends ApiResponse {
  /** Total number of matched places.*/
  totalCount: number;

  /** List of matched places. */
  sites: Site[];
}
