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

from huaweimaps.exceptions import ApiException
from huaweimaps import Client
import urllib.parse

key = 'Api key here..'
encoded_key = urllib.parse.quote(key, 'UTF-8')
client = Client(api_key= encoded_key)

responses = []
responses.append(client.nearby_search({'lat': 3.33, 'lng': 22.74}))
responses.append(client.text_search('restaurant'))
responses.append(client.detail_search('EB731B7298F1E2EEDC42532CFD3B8E32'))
responses.append(client.query_suggestion("Accés a l' Aeroport"))
responses.append(client.query_autocomplete('hotel'))
responses.append(client.geocode("Cleary Garden,Queen Victoria St,London"))
responses.append(client.reverse_geocode({'lat': 77.21, 'lng': 18.05}))
try:
    responses.append(client.get_timezone({'lat': 30, 'lng': 12}, 1577435043, api_key= "assadsa"))
except ApiException as e:
    print(e)

for response in responses:
    print(response)
    print('\n\n\n')
