# Copyright 2021. Huawei Technologies Co., Ltd. All rights reserved.

# Licensed under the Apache License, Version 2.0 (the "License")
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     https://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import json
import time
import responses
import pytest

from huaweimaps.client import Client
from huaweimaps.exceptions import ApiException


client = Client(max_retry=3, retry_interval=1, api_key='none')
url = 'https://siteapi.cloud.huawei.com/mapApi/v1/siteService/searchById?key=none'

@responses.activate
def test_client_retry_on_fail():
   responses.add(method=responses.POST, url= url, status=503 ) 

   with pytest.raises(ApiException):
       client.detail_search(site_id='someid')

   responses.assert_call_count(url, 4)


@responses.activate
def test_client_retry_interval():
    req_times = []

    def callback(request):
        req_times.append(time.time())
        payload = json.loads(request.body)
        return (503, {}, json.dumps(payload))

    responses.add_callback(method=responses.POST, url=url,
                           callback=callback, content_type='application/json')

    with pytest.raises(ApiException):
        client.detail_search(site_id='someid')

    seconds = 1
    for rq_idx in range(1, len(req_times)):
        diff = req_times[rq_idx] - req_times[rq_idx - 1]
        assert diff >= seconds
        seconds *= 1.5


