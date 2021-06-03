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

from huaweimaps import Client 
from huaweimaps.exceptions import ApiException

import pytest
import responses

from tests import create
from tests import base_url

client = Client() 

@responses.activate
def test_get_timezone_good_code():
    responses.add(create('timezoneService/getTimezone', 'adssa', 200))
    response = client.get_timezone({}, 12132112, api_key= 'adssa')
    assert response is not None
    assert responses.calls[0].request.url == base_url + 'timezoneService/getTimezone?key=adssa'
    assert responses.calls[0].request.body == b'{"location": {}, "timestamp": 12132112}'

@responses.activate
def test_get_timezone_bad_code():
    responses.add(create('timezoneService/getTimezone', 'ad', 400))
    with pytest.raises(ApiException):
        client.get_timezone({}, 12321321, api_key='ad')
    