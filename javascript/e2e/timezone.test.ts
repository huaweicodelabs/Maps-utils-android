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
import { TimezoneRequest } from "../src/models/site/timezone";

const API_KEY = process.env.HUAWEI_SITE_WEB_API_KEY ?? "invalidkey";

const client = new Client({ apiKey: encodeURIComponent(API_KEY) });

const request: TimezoneRequest = {
  location: {
    lng: 30.23235,
    lat: 12.242585,
  },
  timestamp: 1577435043,
  language: Language.en,
};

test("getTimezone request success", async (): Promise<void> => {
  const resp = await client.getTimezone(request);

  expect(resp.dstOffset).toBeDefined();
  expect(resp.rawOffset).toBeDefined();
  expect(resp.returnCode).toBeDefined();
  expect(resp.returnDesc).toBeDefined();
  expect(resp.timeZoneId).toBeDefined();
  expect(resp.timeZoneName).toBeDefined();
});

test("Promise rejected when send request without API_KEY", async () => {
  const localClient = new Client();

  await expect(
    localClient.getTimezone({
      location: {
        lng: 30.23235,
        lat: 12.242585,
      },
      timestamp: 1577435043,
    })
  ).rejects.toHaveProperty("returnCode", "6");
  await expect(
    localClient.getTimezone({
      location: {
        lng: 30.23235,
        lat: 12.242585,
      },
      timestamp: 1577435043,
    })
  ).rejects.toHaveProperty("returnDesc", "REQUEST_DENIED");
});
