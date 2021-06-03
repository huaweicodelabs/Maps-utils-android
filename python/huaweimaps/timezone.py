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

from abc import ABCMeta

class TimezoneApiMixin(metaclass= ABCMeta):

    def get_timezone(self, location,
                     timestamp,
                     language=None,
                     api_key= None):

        """
        Obtains the timezone of a place based on its longitude and latitude.

        Arguments:\n
            location {dict} -- Longitude and Latitude. 
            timestamp {int} -- Number of seconds between the current time and 00:00:00 on January 1, 1970 (UTC).
        
        Keyword Arguments:\n
            language {str} -- Language in which search results are displayed. (default: {None})
            api_key {str} -- Api key. (default: {None})
            
        Returns:\n
            {dict} -- Response object.

        Example usage:\n
        >>> client = Client(api_key= 'Api key here..')
        >>> response = client.get_timezone({"lng": 30.23235, "lat":12.242585}, 1577435043, language= "en")
        >>> print(response)
        """


        req = {'location': location, 'timestamp': timestamp}

        if language:
            req['language'] = language

        return self._send_request('/mapApi/v1/timezoneService/getTimezone', req, api_key = api_key)
