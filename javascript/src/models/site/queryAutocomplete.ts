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

import { ApiResponse, AutocompletePrediction, Coordinate, Language, Site } from "../common/common";

/** queryAutocomplete response object. */
export interface QueryAutoCompleteRequest {
  /** Search keyword. This parameter is mandatory. */
  query: string;

  /** Longitude and latitude to which search results need to be biased. */
  location?: Coordinate;

  /**
   * Search radius, in meters.
   * The value ranges from 1 to 50000. The default value is 50000.
   */
  radius?: number;

  /** Language in which the autocomplete results are displayed. */
  language?: Language;

  /**
   * Indicates whether to return information about child nodes. The options are true (indicating to return the IDs of
   * child nodes) and false (indicating that no child information is returned). The default value is false.
   */
  children?: boolean;
}

/** queryAutocomplete response object. */
export interface QueryAutoCompleteResponse extends ApiResponse {
  /** Predicted search keywords. */
  predictions: AutocompletePrediction[];
  /** Hot names */
  hotNames: string[];
  /** Autocomplete result. */
  sites: Site[];
}
