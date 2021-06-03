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


class GeocodeApiMixin(metaclass=ABCMeta):

    def geocode(self, address,
                bounds=None,
                language=None,
                api_key=None):
        """
        Obtains the longitude and latitude of a place based on its structured address.
        A maximum of 10 records can be returned.

        Arguments:\n
            address {str} -- Address information.

        Keyword Arguments:\n
            bounds {dict} -- Coordinate bounds to which search results need to be biased. (default: {None})
            language {str} -- Language in which search results are displayed. (default: {None})
            api_key {str} -- Api key. (default: {None})

        Returns:\n
            {dict} -- Response object.

        Example usage:\n
        >>> client = Client(api_key= 'Api key here.')
        >>> response = client.geocode(address= "Piazzale Dante, 41, 55049 Viareggio, Tuscany, Italy",language= "en")
        >>> print(response)

        """

        req = {'address': address}

        if bounds:
            req['bounds'] = bounds

        if language:
            req['language'] = language

        return self._send_request('/mapApi/v1/siteService/geocode', req, api_key=api_key)

    def reverse_geocode(self, location,
                        language=None,
                        return_poi=True,
                        api_key=None):
        """Obtains information about a place based on its longitude and latitude. A maximum of 11 records can be returned.

        Arguments:\n
            location {dict} -- Longitude and latitude.

        Keyword Arguments:\n
            language {str} -- Language in which search results are displayed. (default: {None})
            return_poi {bool} -- Indicates whether to return a POI. (default: {True})
            api_key {str} -- Api key. (default: {None})

        Returns:\n
            {dict} -- Response object.

        Example Usage:\n
            >>> client = Client(api_key= 'Api key here..')
            >>> resp = client.reverse_geocode(location= {'lat': 33.22, 'lng': 23.32})
            >>> print(resp)


        """

        req = {'location': location, 'returnPoi': return_poi}

        if language:
            req['language'] = language

        return self._send_request('/mapApi/v1/siteService/reverseGeocode', req, api_key=api_key)
