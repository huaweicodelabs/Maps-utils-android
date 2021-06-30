<?php

/*
    Copyright 2021. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License")
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

namespace HuaweiMap\Service;

use HuaweiMap\ApiException;
use HuaweiMap\HttpClient;
use HuaweiMap\Model\Request\Api\TimezoneRequest;
use HuaweiMap\Model\Request\ClientConfig;
use HuaweiMap\Model\Response\Api\TimezoneResponse;

class TimezoneService extends HttpService
{
    const URL_TIMEZONE = "/mapApi/v1/timezoneService/getTimezone";

    public function __construct(HttpClient $httpClient)
    {
        parent::__construct($httpClient);
    }

    /**
     * @param TimezoneRequest $request
     * @param ClientConfig|null $requestConfig
     * @return TimezoneResponse|null
     * @throws ApiException
     */
    function getTimezone(TimezoneRequest $request, ClientConfig $requestConfig = null)
    {
        return TimezoneResponse::toObject($this->post(self::URL_TIMEZONE, $request, $requestConfig));
    }

}