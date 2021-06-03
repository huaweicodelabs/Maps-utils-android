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

import { ApiResponse, CoordinateBounds, Language, Site } from "../common/common";

/** geocode request object.  */
export interface GeocodeRequest {
  /** Address information */
  address: string;

  /** Coordinate bounds to which search results need to be biased. */
  bounds?: CoordinateBounds;

  /**
   * Language in which search results are displayed.
   * If this parameter is not passed, the local language will be used.
   */
  language?: Language;
}

/** geocode response object. */
export interface GeocodeResponse extends ApiResponse {
  /**
   * Search result returned upon a successful search.
   * If no record is found, an empty array will be returned.
   */
  sites: Site[];
}
