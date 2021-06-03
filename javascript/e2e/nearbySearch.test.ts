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
import { HwLocationType } from "../src/models/common/poiTypes";
import { NearbySearchRequest } from "../src/models/site/nearbySearch";

const API_KEY = process.env.HUAWEI_SITE_WEB_API_KEY ?? "invalidkey";

const client = new Client({ apiKey: encodeURIComponent(API_KEY) });

const request: NearbySearchRequest = {
  location: {
    lng: 2.4444,
    lat: 48.8815,
  },
  radius: 5000,
  query: "hotel",
  hwPoiType: HwLocationType.HOTEL,
  language: Language.en,
  pageIndex: 1,
  pageSize: 1,
};

test("nearbySearch request success", async (): Promise<void> => {
  const resp = await client.nearbySearch(request);

  expect(resp.returnCode).toBeDefined();
  expect(resp.returnDesc).toBeDefined();
  expect(resp.sites).toBeDefined();
  expect(resp.totalCount).toBeDefined();
});

test("Promise rejected when send request without API_KEY", async () => {
  const localClient = new Client();

  await expect(
    localClient.nearbySearch({
      location: {
        lat: 10,
        lng: 10,
      },
    })
  ).rejects.toHaveProperty("returnCode", "6");
  await expect(
    localClient.nearbySearch({
      location: {
        lat: 10,
        lng: 10,
      },
    })
  ).rejects.toHaveProperty("returnDesc", "REQUEST_DENIED");
});
