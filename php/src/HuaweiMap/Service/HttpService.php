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
use HuaweiMap\Model\Request\Base;
use HuaweiMap\Model\Request\ClientConfig;

abstract class HttpService
{
    private $httpClient;

    public function __construct(HttpClient $httpClient)
    {
        $this->httpClient = $httpClient;
    }

    /**
     * @param $url
     * @param Base $request
     * @param ClientConfig|null $requestConfig
     * @return mixed|null
     * @throws ApiException
     */
    function post($url, Base $request, ClientConfig $requestConfig = null)
    {
        return $this->httpClient->post($url, $request, $requestConfig);
    }
}