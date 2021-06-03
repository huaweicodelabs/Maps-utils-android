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

from huaweimaps.client import Client
from huaweimaps.exceptions import ApiException

import pytest
import responses

from tests import create
from tests import base_url

client = Client()

def test_site_functions_no_apikey():
    # When apikey doesn't provided in client or in method call. 
    # Called function should throw a ValueError.
    with pytest.raises(ValueError):
        client.nearby_search(location={})
        client.detail_search(site_id='someid')
        client.query_suggestion(query='mandatory')
        client.reverse_geocode(location= {})
        client.geocode(address= 'mandatory')
        client.query_autocomplete(query= 'mandatory')
        client.text_search(query='mandatory')

@responses.activate
def test_nearby_search():

    responses.add(create('siteService/nearbySearch', 'apikey1', 400))
    responses.add(create('siteService/nearbySearch', 'apikey2', 200))

    with pytest.raises(ApiException):
        client.nearby_search(location={}, api_key='apikey1')

    client.nearby_search(location={}, api_key='apikey2')

    assert responses.calls[1].request.url == base_url + 'siteService/nearbySearch?key=apikey2'
    assert responses.calls[1].request.body == b'{"location": {}, "radius": 1000, "pageSize": 20, "pageIndex": 1}'


@responses.activate
def test_text_search():
    responses.add(create('siteService/searchByText', 'apikey1', 400))
    responses.add(create('siteService/searchByText', 'apikey2', 200))

    with pytest.raises(ApiException):
        client.text_search(query='somequery', api_key= 'apikey1')
    
    client.text_search(query='somequery', api_key= 'apikey2')

    assert responses.calls[1].request.url == base_url + 'siteService/searchByText?key=apikey2'
    assert responses.calls[1].request.body == b'{"query": "somequery", "radius": 50000, "pageSize": 20, "pageIndex": 1, "children": false}'


@responses.activate
def test_detail_search():
    responses.add(create('siteService/searchById', 'apikey1', 400))
    responses.add(create('siteService/searchById', 'apikey2', 200))

    with pytest.raises(ApiException):
        client.detail_search(site_id='someid', api_key= 'apikey1')
    
    client.detail_search(site_id='someid', language="en", api_key= 'apikey2')

    assert responses.calls[1].request.url == base_url + 'siteService/searchById?key=apikey2'
    assert responses.calls[1].request.body == b'{"siteId": "someid", "children": false, "language": "en"}'


@responses.activate
def test_query_suggestion():
    responses.add(create('siteService/querySuggestion', 'apikey1', 400))
    responses.add(create('siteService/querySuggestion', 'apikey2', 200))

    with pytest.raises(ApiException):
        client.query_suggestion(query='somequery', api_key= 'apikey1')
    
    client.query_suggestion(query='somequery', api_key= 'apikey2')

    assert responses.calls[1].request.url == base_url + 'siteService/querySuggestion?key=apikey2'
    assert responses.calls[1].request.body == b'{"query": "somequery", "radius": 50000, "children": false}'

@responses.activate
def test_query_autocomplete():
    responses.add(create('siteService/queryAutoComplete', 'apikey1', 400))
    responses.add(create('siteService/queryAutoComplete', 'apikey2', 200))

    with pytest.raises(ApiException):
        client.query_autocomplete(query='somequery', api_key= 'apikey1')
    
    client.query_autocomplete(query='somequery', api_key= 'apikey2')

    assert responses.calls[1].request.url == base_url + 'siteService/queryAutoComplete?key=apikey2'
    assert responses.calls[1].request.body == b'{"query": "somequery", "radius": 50000, "children": false}'
