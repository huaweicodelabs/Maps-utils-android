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

namespace HuaweiMap\Model\Request\Api;

use HuaweiMap\Model\Request\Base;
use HuaweiMap\Model\Common\Coordinate;
use HuaweiMap\Utils;

class TimezoneRequest extends Base
{
    /**
     * @var Coordinate Longitude and latitude.
     */
    private $location;

    /**
     * @var float Number  of seconds between the current time and 00:00:00 on January 1, 1970 (UTC).
     */
    private $timestamp;

    /**
     * @var string Language in which search results are displayed. If this parameter is not passed, the local language will be used.
     */
    private $language;

    public function __construct(
            Coordinate $location,
            $timestamp = null,
            $language = null
    )
    {
        $this->setLocation($location)->setTimestamp($timestamp)->setLanguage($language);
    }

    /**
     * @return Coordinate
     */
    public function getLocation()
    {
        return $this->location;
    }

    /**
     * @param Coordinate $location
     * @return $this
     */
    public function setLocation(Coordinate $location)
    {
        $this->location = $location;
        return $this;
    }

    /**
     * @return float
     */
    public function getTimestamp()
    {
        return $this->timestamp;
    }

    /**
     * @param $timestamp float
     * @return $this
     */
    public function setTimestamp($timestamp)
    {
        $this->timestamp = $timestamp;
        return $this;
    }

    /**
     * @return string
     */
    public function getLanguage()
    {
        return $this->language;
    }

    /**
     * @param $language string
     * @return $this
     */
    public function setLanguage($language)
    {
        $this->language = $language;
        return $this;
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
                Utils::getValue($arr, "location"),
                Utils::getValue($arr, "timestamp"),
                Utils::getValue($arr, "language")
        );
    }

}
