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

import { ApiResponse, Coordinate, Language } from "../common/common";

/** timezoneRequest object. */
export interface TimezoneRequest {
  /** Longitude and latitude. */
  location: Coordinate;

  /** Number of seconds between the current time and 00:00:00 on January 1, 1970 (UTC).  */
  timestamp: number;

  /**
   * Language in which search results are displayed.
   * If this parameter is not passed, the local language will be used.
   */
  language?: Language;
}
/** timezoneResponse object */
export interface TimezoneResponse extends ApiResponse {
  /**
   * DST offset, in seconds.
   * If the specified timestamp is out of the DST, 0 will be returned.
   */
  dstOffset: number;

  /** Time zone offset of a specified place from UTC, in seconds. */
  rawOffset: number;

  /** Time zone ID. */
  timeZoneId: string;

  /** Time zone name. */
  timeZoneName: string;
}
