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
import { QueryAutoCompleteRequest } from "../src/models/site/queryAutocomplete";

const API_KEY = process.env.HUAWEI_SITE_WEB_API_KEY ?? "invalidkey";

const client = new Client({ apiKey: encodeURIComponent(API_KEY) });

const request: QueryAutoCompleteRequest = {
  query: "hotel",
  location: {
    lng: 2.4444,
    lat: 48.8815,
  },
  radius: 10000,
  language: Language.en,
};

test("queryAutoComplete request success", async (): Promise<void> => {
  const resp = await client.queryAutoComplete(request);

  expect(resp.hotNames).toBeDefined();
  expect(resp.predictions).toBeDefined();
  expect(resp.returnCode).toBeDefined();
  expect(resp.returnDesc).toBeDefined();
  expect(resp.sites).toBeDefined();
});

test("Promise rejected when send request without API_KEY", async () => {
  const localClient = new Client();

  await expect(localClient.queryAutoComplete({ query: "rest" })).rejects.toHaveProperty("returnCode", "6");
  await expect(localClient.queryAutoComplete({ query: "rest" })).rejects.toHaveProperty(
    "returnDesc",
    "REQUEST_DENIED"
  );
});
