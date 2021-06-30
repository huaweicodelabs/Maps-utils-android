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

namespace HuaweiMap;

use Guzzle\Common\Exception\GuzzleException;
use Guzzle\Http\Client as GuzzleClient;

use Guzzle\Http\Exception\ClientErrorResponseException;
use Guzzle\Http\Exception\ServerErrorResponseException;
use HuaweiMap\Model\Request\Base;
use HuaweiMap\Model\Request\ClientConfig;

class HttpClient
{
    private $clientConfig;
    private $client;

    function __construct(ClientConfig $config)
    {
        $this->clientConfig = $config;
        $this->client = new GuzzleClient(array('verify' => false));
        $this->client->setSslVerification(false);
    }

    /**
     * @param $apiUrl
     * @param Base $requestData
     * @param ClientConfig|null $requestConfig
     * @return mixed
     * @throws ApiException
     */
    function post($apiUrl, Base $requestData, ClientConfig $requestConfig = null)
    {
        $config = $this->clientConfig->merge($requestConfig);
        return $this->_post(
                $this->getUrl($apiUrl, $config),
                array('content-type' => 'application/json'),
                json_encode(Utils::toArray($requestData)),
                array('timeout' => $config->getTimeOut(), 'connect_timeout' => $config->getConnectTimeOut()),
                $config->getMaxRetry(),
                0);
    }

    /**
     * @param $url
     * @param $headers
     * @param $data
     * @param $options
     * @param $maxRetry
     * @param $retryCount
     * @return mixed|null
     * @throws ApiException
     */
    private function _post($url, $headers, $data, $options, $maxRetry, $retryCount)
    {
        try {
            $response = $this->client->post($url, $headers, $data, $options)->send();
            return Utils::parseJson($response->getBody(true));
        } catch (ClientErrorResponseException $e) {
            throw ApiException::fromResponse($e->getResponse()->getBody());
        } catch (ServerErrorResponseException $e) {
            if ($maxRetry > $retryCount) {
                sleep(pow(ClientConfig::intervalFactor, $retryCount));
                return $this->_post($url, $headers, $data, $options, $maxRetry, $retryCount + 1);
            }
            throw ApiException::fromResponse($e->getResponse()->getBody());
        } catch (GuzzleException $e) {
            throw new ApiException(strval($e->getCode()), $e->getMessage());
        }
    }

    /**
     * @param $apiUrl
     * @param ClientConfig $config
     * @return string
     */
    private function getUrl($apiUrl, ClientConfig $config)
    {
        $baseUrl = $config->getBaseUrl();
        $apiKey = $config->getApiKey();
        return "$baseUrl$apiUrl?key=$apiKey";
    }
}