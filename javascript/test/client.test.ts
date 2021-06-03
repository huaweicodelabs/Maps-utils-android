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

import nock from "nock";
import { Client } from "../src/client";

const API_KEY = "invalidkey";
const client = new Client({ apiKey: encodeURIComponent(API_KEY) });

test("test client", (): void => {
  expect(client).toBeTruthy();
});

const error = {
  returnCode: "010010",
  returnDesc: "INVALID_REQUEST",
};
test("retry request", async () => {
  const nockScope = nock("https://siteapi.cloud.huawei.com")
    .post("/mapApi/v1/siteService/searchById?key=invalidkey")
    .reply(500, error)
    .post("/mapApi/v1/siteService/searchById?key=invalidkey")
    .reply(500, error)
    .post("/mapApi/v1/siteService/searchById?key=invalidkey")
    .reply(500, error)
    .post("/mapApi/v1/siteService/searchById?key=invalidkey")
    .reply(200, { returnStatus: "0" });
  const resp = await client.detailSearch(
    { siteId: "" },
    {
      retryOpts: { maxRetry: 3 },
    }
  );
  expect(resp).toEqual({ returnStatus: "0" });
  expect(nockScope.isDone()).toBeTruthy();
});
