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

import { Client } from "../src/client";
import { Language } from "../src/models/common/common";
import { LocationType } from "../src/models/common/poiTypes";
import { QuerySuggestionRequest } from "../src/models/site/querySuggestion";

const API_KEY = process.env.HUAWEI_SITE_WEB_API_KEY ?? "invalidkey";

const client = new Client({ apiKey: encodeURIComponent(API_KEY) });

const request: QuerySuggestionRequest = {
  query: "Accés a l' Aeroport",
  location: {
    lng: 2.0797638,
    lat: 41.300621,
  },
  radius: 10000,
  bounds: {
    northeast: {
      lng: 2.181,
      lat: 41.5,
    },
    southwest: {
      lng: 2.008,
      lat: 41.099,
    },
  },
  poiTypes: [LocationType.GEOCODE, LocationType.ESTABLISHMENT],
  countryCode: "ES",
  language: Language.en,
  children: true,
};

test("querySuggestion request success", async (): Promise<void> => {
  const resp = await client.querySuggestion(request);

  expect(resp.returnCode).toBeDefined();
  expect(resp.returnDesc).toBeDefined();
  expect(resp.sites).toBeDefined();
});

test("Promise rejected when send request without API_KEY", async () => {
  const localClient = new Client();

  await expect(localClient.querySuggestion({ query: "restaurant" })).rejects.toHaveProperty("returnCode", "6");
  await expect(localClient.querySuggestion({ query: "restaurant" })).rejects.toHaveProperty(
    "returnDesc",
    "REQUEST_DENIED"
  );
});
