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
import { GeocodeRequest } from "../src/models/site/geocode";

const API_KEY = process.env.HUAWEI_SITE_WEB_API_KEY ?? "invalidkey";

const client = new Client({ apiKey: encodeURIComponent(API_KEY) });
const request: GeocodeRequest = {
  address: "Cleary Garden,Queen Victoria St,London",
  bounds: {
    northeast: {
      lng: -0.0953,
      lat: 51.512,
    },
    southwest: {
      lng: -1.0953,
      lat: 50.512,
    },
  },
  language: Language.en,
};

test("geocode request", async (): Promise<void> => {
  const resp = await client.geocode(request);

  expect(resp.sites).toBeDefined();
  expect(resp.returnCode).toBeDefined();
  expect(resp.returnDesc).toBeDefined();
});

test("Promise rejected when send request without API_KEY", async () => {
  const localClient = new Client();

  await expect(localClient.geocode({ address: "somewhere" })).rejects.toHaveProperty("returnCode", "6");
  await expect(localClient.geocode({ address: "somewhere" })).rejects.toHaveProperty("returnDesc", "REQUEST_DENIED");
});
