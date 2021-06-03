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

import { ApiResponse, Language, Site } from "../common/common";

export interface DetailSearchRequest {
  /** ID of a place. */
  siteId: string;

  /**
   * Language in which search results are displayed.
   * If this parameter is not passed, the local language will be used.
   */
  language?: Language;

  /**
   * Indicates whether to return information about child nodes.
   * The options are true (indicating to return the IDs of child nodes)
   * and false (indicating that no child information is returned).
   * The default value is false.
   */
  children?: boolean;
}

export interface DetailSearchResponse extends ApiResponse {
  /** Searched place.*/
  site: Site;
}
