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

import responses
import pytest

from tests import create
from tests import base_url

from huaweimaps import Client
from huaweimaps.exceptions import ApiException

client = Client()

@responses.activate
def test_geocode():
    responses.add(create('siteService/geocode', 'apikey1', 400))
    responses.add(create('siteService/geocode', 'apikey2', 200))

    with pytest.raises(ApiException):
        client.geocode(address='someaddress', api_key= 'apikey1')
    
    client.geocode(address='someaddress', api_key= 'apikey2')

    assert responses.calls[1].request.url == base_url + 'siteService/geocode?key=apikey2'
    assert responses.calls[1].request.body == b'{"address": "someaddress"}'


@responses.activate
def test_reverse_geocode():
    responses.add(create('siteService/reverseGeocode', 'apikey1', 400))
    responses.add(create('siteService/reverseGeocode', 'apikey2', 200))

    with pytest.raises(ApiException):
        client.reverse_geocode(location={}, api_key= 'apikey1')
    
    client.reverse_geocode(location={}, api_key= 'apikey2')

    assert responses.calls[1].request.url == base_url + 'siteService/reverseGeocode?key=apikey2'
    assert responses.calls[1].request.body == b'{"location": {}, "returnPoi": true}'
