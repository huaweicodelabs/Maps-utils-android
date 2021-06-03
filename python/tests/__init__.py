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

content_type = 'application/json; charset=UTF-8'
base_url = 'https://siteapi.cloud.huawei.com/mapApi/v1/'
data = {"returnCode": "0100007",
        "returnDesc": "Place search failure."}


def create(query, key, status, d = None) -> responses.Response:
    return responses.Response(method=responses.POST,
                              url='%s%s?key=%s' % (base_url, query, key),
                              json=d or data,
                              status=status,
                              content_type=content_type)