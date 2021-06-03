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
import nock from "nock";

const API_KEY = "invalidkey";
const client = new Client({ apiKey: encodeURIComponent(API_KEY) });

beforeEach(() => nock.cleanAll());

test("Promise resolved when request success", async () => {
  nock("https://siteapi.cloud.huawei.com")
    .post("/mapApi/v1/siteService/queryAutoComplete?key=invalidkey")
    .reply(200, { returnCode: "0" });
  const resp = await client.queryAutoComplete({ query: "restaurant" });
  expect(resp.returnCode).toBe("0");
});

const error = {
  returnCode: "010010",
  returnDesc: "INVALID_REQUEST",
};
test("Promise rejected when response status code not OK", async (): Promise<void> => {
  nock("https://siteapi.cloud.huawei.com")
    .persist()
    .post("/mapApi/v1/siteService/queryAutoComplete?key=invalidkey")
    .reply(400, error);
  await expect(client.queryAutoComplete({ query: "" }, { retryOpts: { maxRetry: 3 } })).rejects.toHaveProperty(
    "returnCode",
    "010010"
  );
});
