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

import { AxiosInstance } from "axios";
import { DetailSearchRequest, DetailSearchResponse } from "../site/detailSearch";
import { GeocodeRequest, GeocodeResponse } from "../site/geocode";
import { NearbySearchRequest, NearbySearchResponse } from "../site/nearbySearch";
import { QueryAutoCompleteRequest, QueryAutoCompleteResponse } from "../site/queryAutocomplete";
import { QuerySuggestionRequest, QuerySuggestionResponse } from "../site/querySuggestion";
import { ReverseGeocodeRequest, ReverseGeocodeResponse } from "../site/reverseGeocode";
import { TextSearchRequest, TextSearchResponse } from "../site/textSearch";
import { TimezoneRequest, TimezoneResponse } from "../site/timezone";
import { HwLocationType, LocationType } from "./poiTypes";

export type RetryOpts = {
  /** Max retry count configuration */
  maxRetry?: number;
  /** Retry interval  */
  retryInterval?: number;
  /** @internal */
  intervalFactor?: number;
  /** @internal */
  retryCount?: number;
  /** @internal */
  axiosInstance?: AxiosInstance;
};

export interface ClientConfig {
  /** Key for using API */
  apiKey?: string;
  /** Base URL */
  baseURL?: string;
  /** Retry options */
  retryOpts?: RetryOpts;
  /** Timeout */
  timeout?: number;
}

export type SiteRequest =
  /** Request format for getTimeZone */
  | TextSearchRequest
  /** Request format for nearbySearch */
  | NearbySearchRequest
  /** Request format for detailSearch */
  | DetailSearchRequest
  /** Request format for querySuggestion */
  | QuerySuggestionRequest
  /** Request format for queryAutoComplete */
  | QueryAutoCompleteRequest
  /** Request format for geocode */
  | GeocodeRequest
  /** Request format for reverseGeocode */
  | ReverseGeocodeRequest
  /** Request format for getTimeZone */
  | TimezoneRequest;

export type SiteResponse =
  /** Response format for getTimeZone */
  | TextSearchResponse
  /** Response format for nearbySearch */
  | NearbySearchResponse
  /** Response format for detailSearch */
  | DetailSearchResponse
  /** Response format for querySuggestion */
  | QuerySuggestionResponse
  /** Response format for queryAutoComplete */
  | QueryAutoCompleteResponse
  /** Response format for geocode */
  | GeocodeResponse
  /** Response format for reverseGeocode */
  | ReverseGeocodeResponse
  /** Response format for getTimeZone */
  | TimezoneResponse;

/**
 * Generic API Response
 */
export interface ApiResponse {
  /**
   * Return code
   */
  returnCode: string;
  /**
   * Return code description.
   */
  returnDesc: string;
}

/**
 * Longitude and Latitude Model
 */
export interface Coordinate {
  /**
   * Latitude
   */
  lat: number;

  /**
   * Longitude
   */
  lng: number;
}

/**
 * Longitude and Latitude Boundary Model
 */
export interface CoordinateBounds {
  /**
   * Coordinates of the northeast corner.
   */
  northeast: Coordinate;

  /**
   * Coordinates of the southwest corner.
   */
  southwest: Coordinate;
}

/** Address model */
export interface Address {
  /** Country/Region code.*/
  countryCode?: string;

  /** Country name. */
  country?: string;

  /** Province/State. */
  state?: string;

  /** City/County. */
  county?: string;

  /** Town/District. */
  town?: string;

  /** Settlement place. */
  settlement?: string;
}

/** Address details model */
export interface AddressDetail {
  /** Country/Region code, which complies with the ISO 3166-1 alpha-2 standard. */
  countryCode?: string;

  /** Country name. */
  country?: string;

  /** Level-1 administrative region in a country, which is generally a province or state. */
  adminArea?: string;

  /** Level-2 administrative region in a country, which is generally a city. */
  subAdminArea?: string;

  /** Level-3 administrative region of a country. */
  tertiaryAdminArea?: string;

  /** Level-3 administrative region in a country, which is generally a county or district. */
  locality?: string;

  /** District/county to which a place belongs. */
  subLocality?: string;

  /** Street number. */
  streetNumber?: string;

  /** Street. */
  thoroughfare?: string;

  /** Postal code. */
  postalCode?: string;
}

/**  Word model */
export interface Word {
  /** Offset of a word in the description.   */
  offset: number;

  /**  Word */
  value: string;
}

/** Model for details of an autocomplete place. */
export interface AutocompletePrediction {
  /** Description of a predicted autocomplete place. */
  description: string;

  /** Matching position of the entered keyword in the description. */
  matchedKeywords: Word[];

  /** Matched words and their positions in the description. */
  matchedWords: Word[];
}

/** Model for information about child nodes of a POI. */
export interface ChildrenNode {
  /** ID of a place. */
  siteId: string;

  /** Name of a place. */
  name: string;

  /** Formatted detailed address of a place. */
  formatAddress: string;

  /** Longitude and latitude of a place. */
  location: Coordinate;

  /** Huawei POI type. */
  hwPoiTypes: string[];

  /**
   * Whether an airport terminal is a national or international terminal. The options are as follows:
   * 1：national
   * 2：international
   * 3：national and international
   */
  domeAndInt?: string;

  /**
   * Whether an airport terminal is a departure or arrival terminal. The options are as follows:
   * 1：departure
   * 2：arrival
   * 3：departure and arrival
   */
  depAndArr?: string;
}

/**  Opening hours model */
export interface OpeningHours {
  /** Opening hours of a place. */
  periods: Period[];

  /** Description of weekly opening hours of a place. */
  texts: string[];
}

/** Weekly Time Model  */
export interface TimeOfWeek {
  /**
   * 0-Sunday
   * 1-Monday
   * 2-Tuesday
   * 3-Wednesday
   * 4-Thursday
   * 5-Friday
   * 6-Saturday
   */
  week: number;

  /**
   * 24-hour time point on a day, in hhmm format.
   * The value ranges from 0000 to 2359.
   */
  time: string;
}

/** site opening time segment model  */
export interface Period {
  /** Open time of a place. */
  open: TimeOfWeek;

  /** Close time of a place.  */
  close: TimeOfWeek;
}

/** POI Model.  */
export interface Poi {
  /** POI type. */
  poiTypes: LocationType[];

  /** Huawei POI type. */
  hwPoiTypes: HwLocationType[];

  /** Phone number. */
  phone?: string;

  /** International phone number. */
  internationalPhone?: string;

  /** Rating. */
  rating?: number;

  /** Official website. */
  websiteUrl?: string;

  /** Opening hours. */
  openingHours?: OpeningHours;

  /** Photo URL. */
  photoUrls?: string[];

  /** Price level. The value ranges from 0 to 4. */
  priceLevel?: number;

  /**
   * Business status of a place. The options are as follows:
   * OPEN_NOW：open
   * CLOSE_NOW：closed
   * CLOSED_TEMPORARILY：temporarily closed
   * CLOSED_PERMANENTLY：permanently closed
   */
  businessStatus?: string;

  /** Child nodes of a Poi object. */
  childrenNodes?: ChildrenNode[];
}

/**  Place Model. */
export interface Site {
  /** Unique ID of a place. */
  siteId: string;

  /** Name of a place. */
  name?: string;

  /** Formatted detailed address of a place. */
  formatAddress: string;

  /** Place details. */
  address: AddressDetail;

  /** Longitude and latitude of a place. */
  location?: Coordinate;

  /** Viewport of a place.*/
  viewport?: CoordinateBounds;

  /** Linear distance between a predicted place
   * and the location specified by the input parameter location, in meters.
   */
  distance?: number;

  /** POI of a place. */
  poi?: Poi;

  /** Difference between the time zone of a place and the UTC time zone, in minutes. */
  utcOffset?: number;

  /** Autocomplete place description. */
  prediction?: AutocompletePrediction;
}

/** Supported languages */
export enum Language {
  /** Afrikaans */
  af = "af",

  /** Amharic */
  am = "am",

  /** Arabic */
  ar = "ar",

  /** Assamese */
  as = "as",

  /** Azerbaijani */
  az = "az",

  /** Belarusian */
  be = "be",

  /** Bulgaria */
  bg = "bg",

  /** Bengali */
  bn = "bn",

  /** Tibetan */
  bo = "bo",

  /** Bosnian */
  bs = "bs",

  /** Catalan; Valencian */
  ca = "ca",

  /** Czech */
  cs = "cs",

  /** Danish */
  da = "da",

  /** German */
  de = "de",

  /** Greek */
  el = "el",

  /** English */
  en = "en",

  /** English (Australia) */
  en_AU = "en_AU",

  /** English (UK) */
  en_GB = "en_GB",

  /** Spanish */
  es = "es",

  /** Spanish (Latin America) */
  es_419 = "es_419",

  /** Estonian */
  et = "et",

  /** Basque */
  eu = "eu",

  /** Persian */
  fa = "fa",

  /** Finnish */
  fi = "fi",

  /** Filipino */
  fil = "fil",

  /** French */
  fr = "fr",

  /** French (Canada) */
  fr_CA = "fr_CA",

  /** Galician */
  gl = "gl",

  /** Gujarati */
  gu = "gu",

  /** Hebrew */
  he = "he",

  /** Hindi */
  hi = "hi",

  /** Croatian */
  hr = "hr",

  /** Hungarian */
  hu = "hu",

  /** Armenia */
  hy = "hy",

  /** Indonesian */
  id = "id",

  /** Icelandic */
  is = "is",

  /** Italian */
  it = "it",

  /** Hebrew */
  iw = "iw",

  /** Japanese */
  ja = "ja",

  /** Javanese */
  jv = "jv",

  /** Georgian */
  ka = "ka",

  /** Kazakh */
  kk = "kk",

  /** Central Khmer */
  km = "km",

  /** Kannada */
  kn = "kn",

  /** Korean */
  ko = "ko",

  /** Kirghiz, Kyrgyz */
  ky = "ky",

  /** Lao */
  lo = "lo",

  /** Lithuanian */
  lt = "lt",

  /** Latvian */
  lv = "lv",

  /** Maithili */
  mai = "mai",

  /** Macedonian */
  mk = "mk",

  /** Malayalam */
  ml = "ml",

  /** Mongolian */
  mn = "mn",

  /** Marathi */
  mr = "mr",

  /** Malay */
  ms = "ms",

  /** Burmese */
  my = "my",

  /** Norwegian Bokmål */
  nb = "nb",

  /** Nepali */
  ne = "ne",

  /** Dutch; Flemish */
  nl = "nl",

  /** Norwegian */
  no = "no",

  /** Oriya */
  or = "or",

  /** Punjabi, Panjabi */
  pa = "pa",

  /** Polish */
  pl = "pl",

  /** Portuguese */
  pt = "pt",

  /** Portuguese (Brazil) */
  pt_BR = "pt_BR",

  /** Portuguese (Portugal) */
  pt_PT = "pt_PT",

  /** Romanian; Moldavian; Moldovan */
  ro = "ro",

  /** Russian */
  ru = "ru",

  /** Sinhala; Sinhalese */
  si = "si",

  /** Slovak */
  sk = "sk",

  /** Slovenian */
  sl = "sl",

  /** Albanian */
  sq = "sq",

  /** Serbian */
  sr = "sr",

  /** Swedish */
  sv = "sv",

  /** Swahili */
  sw = "sw",

  /** Tamil */
  ta = "ta",

  /** Telugu */
  te = "te",

  /** Thai */
  th = "th",

  /** Turkish */
  tr = "tr",

  /** Uighur */
  ug = "ug",

  /** Ukrainian */
  uk = "uk",

  /** Urdu */
  ur = "ur",

  /** Uzbek */
  uz = "uz",

  /** Vietnamese */
  vi = "vi",

  /** Chinese */
  zh = "zh",

  /** Simplified Chinese */
  zh_CN = "zh_CN",

  /** Traditional Chinese (Hong Kong, China) */
  zh_HK = "zh_HK",

  /** Traditional Chinese (Taiwan, China) */
  zh_TW = "zh_TW",

  /** Zulu */
  zu = "zu",
}
