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
import requests
import time

import huaweimaps

from huaweimaps.exceptions import ApiException
from huaweimaps.places import PlacesApiMixin
from huaweimaps.timezone import TimezoneApiMixin
from huaweimaps.geocode import GeocodeApiMixin

_BASE_URL = 'https://siteapi.cloud.huawei.com'
_HEADERS = {'Content-Type': 'application/json; charset=UTF-8',
            'X-User-Agent': 'huawei-maps-services-python-client/%s' % huaweimaps.__version__}


class Client(PlacesApiMixin, TimezoneApiMixin, GeocodeApiMixin):
    def __init__(self, api_key=None, base_url=_BASE_URL,
                 timeout=10, connect_timeout=None, read_timeout=None,
                 retry_interval=1, max_retry=1):
        """Huawei maps client constructor. Set client configurations. Declare timeout parameters for upcoming requests.

        Keyword Arguments:\n
            api_key {str} -- Api key. (default: {None})
            base_url {str} -- Base url. (default: {_BASE_URL})
            timeout {float} -- Timeout seconds. (default: {10.0})
            connect_timeout {float} -- Connect timeout seconds. (default: {None})
            read_timeout {float} -- Read timeout seconds. (default: {None})
            retry_interval {float} -- Retry interval seconds. (default: {1.0})
            max_retry {int} -- Max retry count. (default: {1})
        """

        self._api_key = api_key
        self._base_url = base_url
        self._max_retry = max_retry
        self._retry_interval = retry_interval
        self._timeout = timeout if timeout else 10

        version = list(map(int, requests.__version__.split('.')))
        if (version[0] > 2 or (version[0] == 2 and version[1] >= 4)) and connect_timeout and read_timeout:
            self._timeout = (connect_timeout, read_timeout)

        self._session = requests.Session()
        self._session.headers = _HEADERS

    def _send_request(self, url, params, method="POST", api_key=None, retry_time=0):
        """Mixin classes are using this method to send requests to server. 

        Arguments:\n
            url {str} -- Url.
            params {dict} -- Request body dictionary object.

        Keyword Arguments:\n
            method {str} -- Request method. (default: {"POST"})
            api_key {str} -- Api key. (default: {None})
            retry_time {int} -- Retry time. (default: {1})

        Raises:\n
            {ValueError}: If api key is not provided raise ValueError.

        Returns:\n
            {dict} - Response object obtained from the api.
        """

        if not api_key and not self._api_key:
            raise ValueError(
                "API key should be provided when initializing the client or on each request.")
        final_url = self._base_url + url + '?key=' + (api_key or self._api_key)

        response = self._session.request(
            method, final_url, json=params, timeout=self._timeout)

        if response.status_code >= 500 and retry_time < self._max_retry:
            seconds = (self._retry_interval * (1.5 ** retry_time))
            time.sleep(seconds)
            response = self._send_request(
                url, params, method=method, api_key=api_key, retry_time=retry_time+1)

        return self._parse_body(response)

    def _parse_body(self, response):
        body = {'returnCode': response.status_code,
                'returnDesc': response.content}

        try:
            body.update(response.json())
        except json.JSONDecodeError:
            pass

        if not (200 <= response.status_code < 300):
            raise ApiException(body['returnCode'], body['returnDesc'])

        return body
