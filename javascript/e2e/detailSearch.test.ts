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
import { DetailSearchRequest } from "../src/models/site/detailSearch";

const API_KEY = process.env.HUAWEI_SITE_WEB_API_KEY ?? "invalidkey";

const client = new Client({ apiKey: encodeURIComponent(API_KEY) });

const request: DetailSearchRequest = {
  siteId: "EB731B7298F1E2EEDC42532CFD3B8E32",
  language: Language.en,
  children: true,
};

test("detailSearch request success", async (): Promise<void> => {
  const response = await client.detailSearch(request);

  expect(response.site).toBeDefined();
  expect(response.returnCode).toBeDefined();
  expect(response.returnDesc).toBeDefined();
});

test("Promise rejected when send request without API_KEY", async () => {
  const localClient = new Client();

  await expect(localClient.detailSearch({ siteId: "EB731B7298F1E2EEDC42532CFD3B8E32" })).rejects.toHaveProperty(
    "returnCode",
    "6"
  );
  await expect(localClient.detailSearch({ siteId: "EB731B7298F1E2EEDC42532CFD3B8E32" })).rejects.toHaveProperty(
    "returnDesc",
    "REQUEST_DENIED"
  );
});
