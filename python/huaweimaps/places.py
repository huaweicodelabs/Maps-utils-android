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
import huaweimaps.utils

class PlacesApiMixin(metaclass= ABCMeta):

    def nearby_search(self, location,
                      radius=1000,
                      query=None,
                      poi_type=None,
                      hw_poi_type=None,
                      language=None,
                      page_size=20,
                      page_index=1,
                      api_key=None):
        """Searches for places in a specified nearby area. You can optimize the search result by providing keywords or specifying the type of the places to search.

        Arguments:\n
            location {dict} -- Current location of a user.

        Keyword Arguments:\n
            radius {int} -- Search radius, in meters. The value ranges from 1 to 50000. (default: {1000})
            query {str} -- Search keyword. (default: {None})
            poi_type {str} -- POI type of a place to search. (default: {None})
            hw_poi_type {str} -- Huawei POI type of a place to search. (default: {None})
            language {str} -- Language in which search results are displayed. (default: {None})
            page_size {int} -- Number of records on each page. The value ranges from 1 to 20. (default: {20})
            page_index {int} -- Number of the current page. The value ranges from 1 to 60. (default: {1})
            api_key {str} -- Api key. (default: {None})

        Returns:\n
            {dict} -- Response object.

        Example usage:\n
            >>> client = Client(api_key='Api key here..')
            >>> res = client.nearby_search({"lat": 10.252502, "lng": 43.8739168}, query= "Piazzale Dante", radius= 5000, hw_poi_type= "NATIONAL_RAILWAY_STATION", language= "en", page_index=1, page_size=1)
            >>> print(res)


        """

        req = {'location': location, 'radius': radius,
                  'pageSize': page_size, 'pageIndex': page_index}

        if query:
            req['query'] = query

        if poi_type:
            huaweimaps.utils.warn_poi_not_exists(poi_type)
            req['poiType'] = poi_type

        if hw_poi_type:
            huaweimaps.utils.warn_hw_poi_not_exists(hw_poi_type)
            req['hwPoiType'] = hw_poi_type

        if language:
            req['language'] = language

        return self._send_request('/mapApi/v1/siteService/nearbySearch', req, api_key=api_key)

    def text_search(self, query,
                    location=None,
                    radius=50000,
                    poi_type=None,
                    hw_poi_type=None,
                    country_code=None,
                    language=None,
                    page_size=20,
                    page_index=1,
                    children=False,
                    api_key=None):
        """Searches for a place, such as a scenic spot, enterprise, or school, based on a user's input keyword and coordinate bounds. Coordinate bounds are optional.

        Arguments:\n
            query {str} -- Search keyword.

        Keyword Arguments:\n
            location {dict} -- Longitude and latitude to which search results need to be biased. (default: {None})
            radius {int} -- Search radius, in meters. The value ranges from 1 to 50000. (default: {50000})
            poi_type {str} -- POI type of a place to search. (default: {None})
            hw_poi_type {str} -- Huawei POI type of a place to search. (default: {None})
            country_code {str} -- Country/Region code, which complies with ISO 3166-1 alpha-2. (default: {None})
            language {str} -- Language in which search results are displayed. (default: {None})
            page_size {int} -- Number of records on each page. The value ranges from 1 to 20. (default: {20})
            page_index {int} -- Number of the current page. The value ranges from 1 to 60. (default: {1})
            children {bool} -- Indicates whether to return information about the child node. (default: {False})
            api_key {str} -- Api key. (default: {None})

        Returns:\n
            {dict} -- Response object.

        Example Usage:\n
            >>> client = Client(api_key= 'Api key here..')
            >>> resp = client.text_search(query= 'restaurant')
            >>> print(resp)


        """

        req = {'query': query, 'radius': radius, 'pageSize': page_size,
                  'pageIndex': page_index, 'children': children}

        if location:
            req['location'] = location

        if poi_type:
            huaweimaps.utils.warn_poi_not_exists(poi_type)
            req['poiType'] = poi_type

        if hw_poi_type:
            huaweimaps.utils.warn_hw_poi_not_exists(hw_poi_type)
            req['hwPoiType'] = hw_poi_type

        if country_code:
            req['countryCode'] = country_code

        if language:
            req['language'] = language

        return self._send_request('/mapApi/v1/siteService/searchByText', req, api_key=api_key)

    def detail_search(self, site_id,
                      language=None,
                      children=False,
                      api_key=None):
        """Obtains details about a place based on its unique ID which serves as the primary key.

        Arguments:\n
            site_id {str} -- ID of a place.

        Keyword Arguments:\n
            language {str} -- Language in which search results are displayed. (default: {None})
            children {bool} -- Indicates whether to return information about child nodes. (default: {False})
            api_key {str} -- Api key. (default: {None})

        Returns:\n
            {dict} -- Response object.

        Example Usage:\n
            >>> client = Client(api_key= 'Api key here..')
            >>> resp = client.detail_search(site_id= 'EB731B7298F1E2EEDC42532CFD3B8E32')
            >>> print(resp)


        """

        req = {'siteId': site_id, 'children': children}

        if language:
            req['language'] = language

        return self._send_request('/mapApi/v1/siteService/searchById', req, api_key=api_key)

    def query_suggestion(self, query,
                         location=None,
                         radius=50000,
                         bounds=None,
                         poi_types=None,
                         country_code=None,
                         language=None,
                         children=False,
                         api_key=None):
        """Provides suggested places when a user enters a search keyword.
        A maximum of 5 records can be returned.

        Arguments:\n
            query {str} -- Search Keyword

        Keyword Arguments:\n
            location {dict} -- Longitude and latitude to which search results need to be biased. (default: {None})
            radius {int} -- Search radius, in meters. The value ranges from 1 to 50000. (default: {50000})
            bounds {dict} -- Coordinate bounds to which search results need to be biased.If both bounds and location are passed, the value of bounds takes precedence. (default: {None})
            poi_types {str} -- POI Type. (default: {None})
            country_code {str} -- Country/Region code, which complies with ISO 3166-1 alpha-2. (default: {None})
            language {str} -- Language in which search results are displayed. (default: {None})
            children {bool} -- Indicates whether to return information about child nodes. (default: {False})
            api_key {str} -- Api key. (default: {None})

        Returns:\n
            {dict} -- Response object.

        Example Usage:\n
            >>> client = Client(api_key= 'Api key here..')
            >>> resp = client.query_suggestion(query='Accés a l' Aeroport')
            >>> print(resp)

        """    

        req = {'query': query, 'radius': radius, 'children': children}

        if location:
            req['location'] = location

        if bounds:
            req['bounds'] = bounds

        if poi_types:
            for poi_type in poi_types:
                huaweimaps.utils.warn_poi_not_exists(poi_type)
            req['poiType'] = poi_types

        if country_code:
            req['countryCode'] = country_code

        if language:
            req['language'] = language

        return self._send_request('/mapApi/v1/siteService/querySuggestion', req, api_key=api_key)

    def query_autocomplete(self, query,
                           location=None,
                           radius=50000,
                           language=None,
                           children=False,
                           api_key=None):
        """Returns a list of suggested places based on the entered keyword.

        Arguments:\n
            query {str} -- Search keyword.

        Keyword Arguments:\n
            location {dict} -- Longitude and latitude to which search results need to be biased. (default: {None})
            radius {int} -- Search radius, in meters. The value ranges from 1 to 50000. (default: {50000})
            language {str} -- Language in which search results are displayed. (default: {None})
            children {bool} -- Indicates whether to return information about child nodes. (default: {False})
            api_key {str} -- Api key. (default: {None})

        Returns:\n
            {dict} -- Response object.

        Example Usage:\n
            >>> client = Client(api_key= 'Api key here..')
            >>> resp = client.query_autocomplete(query= 'hotel')
            >>> print(resp)

        """

        req = {'query': query, 'radius': radius, 'children': children}

        if location:
            req['location'] = location

        if language:
            req['language'] = language

        return self._send_request('/mapApi/v1/siteService/queryAutoComplete', req, api_key=api_key)
