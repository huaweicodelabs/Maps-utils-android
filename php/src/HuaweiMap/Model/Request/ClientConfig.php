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

namespace HuaweiMap\Model\Request;

use HuaweiMap\Utils;

class ClientConfig extends Base
{
    /**
     * @var string Api key
     */
    private $apiKey;

    /**
     * @var string Base url
     */
    private $baseUrl;

    /**
     * @var float Timeout interval
     */
    private $timeOut;

    /**
     * @var float Connection timeout interval
     */
    private $connectTimeOut;

    /**
     * @var int Max retry count
     */
    private $maxRetry;

    /**
     * @var float
     */
    private $retryInterval;
    const intervalFactor = 1.5;

    public function __construct(
            $apiKey,
            $baseUrl = "https://siteapi.cloud.huawei.com",
            $timeOut = 1,
            $connectTimeOut = 1,
            $maxRetry = 0,
            $retryInterval = 1)
    {
        $this->setApiKey($apiKey)
                ->setBaseUrl($baseUrl)
                ->setTimeOut($timeOut)
                ->setConnectTimeOut($connectTimeOut)
                ->setMaxRetry($maxRetry)
                ->setRetryInterval($retryInterval);
    }

    /**
     * @return string
     */
    public function getApiKey()
    {
        return $this->apiKey;
    }

    /**
     * @param $apiKey string
     * @return $this
     */
    public function setApiKey($apiKey)
    {
        $this->apiKey = $apiKey;
        return $this;
    }

    /**
     * @return string
     */
    public function getBaseUrl()
    {
        return $this->baseUrl;
    }

    /**
     * @param $baseUrl string
     * @return $this
     */
    public function setBaseUrl($baseUrl)
    {
        $this->baseUrl = $baseUrl;
        return $this;
    }

    /**
     * @return float
     */
    public function getTimeOut()
    {
        return $this->timeOut;
    }

    /**
     * @param $timeOut float
     * @return $this
     */
    public function setTimeOut($timeOut)
    {
        $this->timeOut = $timeOut;
        return $this;
    }

    /**
     * @return float
     */
    public function getConnectTimeOut()
    {
        return $this->connectTimeOut;
    }

    /**
     * @param $connectTimeOut float
     * @return $this
     */
    public function setConnectTimeOut($connectTimeOut)
    {
        $this->connectTimeOut = $connectTimeOut;
        return $this;
    }

    /**
     * @return int
     */
    public function getMaxRetry()
    {
        return $this->maxRetry;
    }

    /**
     * @param $maxRetry int
     * @return $this
     */
    public function setMaxRetry($maxRetry)
    {
        $this->maxRetry = $maxRetry;
        return $this;
    }

    /**
     * @return float
     */
    public function getRetryInterval()
    {
        return $this->retryInterval;
    }

    /**
     * @param $retryInterval float
     * @return $this
     */
    public function setRetryInterval($retryInterval)
    {
        $this->retryInterval = $retryInterval;
        return $this;
    }

    public function merge(ClientConfig $newObj = null)
    {
        $oldObj = clone $this;
        if ($newObj === null) {
            return $oldObj;
        }
        if ($newObj->getApiKey() !== null) {
            $oldObj->setApiKey($newObj->getApiKey());
        }
        if ($newObj->getBaseUrl() !== null) {
            $oldObj->setBaseUrl($newObj->getBaseUrl());
        }
        if ($newObj->getTimeOut() !== null) {
            $oldObj->setTimeOut($newObj->getTimeOut());
        }
        if ($newObj->getConnectTimeOut() !== null) {
            $oldObj->setConnectTimeOut($newObj->getConnectTimeOut());
        }
        if ($newObj->getMaxRetry() !== null) {
            $oldObj->setMaxRetry($newObj->getMaxRetry());
        }
        if ($newObj->getRetryInterval() !== null) {
            $oldObj->setRetryInterval($newObj->getRetryInterval());
        }
        return $oldObj;
    }

    public function getProperties()
    {
        return get_object_vars($this);
    }

    public static function fromArray($arr)
    {
        if (gettype($arr) !== "array") {
            return null;
        }
        return new self(
                Utils::getValue($arr, "apiKey"),
                Utils::getValue($arr, "baseUrl"),
                Utils::getValue($arr, "timeOut"),
                Utils::getValue($arr, "connectTimeOut"),
                Utils::getValue($arr, "maxRetry"),
                Utils::getValue($arr, "retryInterval")
        );
    }
}
