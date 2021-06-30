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

namespace HuaweiMap\Model\Common;

use HuaweiMap\Model\ArrayCreatable;
use HuaweiMap\Model\Response\Base;
use HuaweiMap\Utils;

class Coordinate extends Base implements ArrayCreatable
{
    /**
     * @var float
     * Latitude
     */
    private $lat;

    /**
     * @var float
     * Longitude
     */
    private $lng;

    public function __construct($lat, $lng)
    {
        $this->setLat($lat)->setLng($lng);
    }

    /**
     * @return float
     */
    public function getLat()
    {
        return $this->lat;
    }

    /**
     * @param $lat float
     * @return $this
     */
    public function setLat($lat)
    {
        $this->lat = $lat;
        return $this;
    }

    /**
     * @return float
     */
    public function getLng()
    {
        return $this->lng;
    }

    /**
     * @param $lng float
     * @return $this
     */
    public function setLng($lng)
    {
        $this->lng = $lng;
        return $this;
    }

    public static function toObject($json)
    {
        if (!isset($json)) {
            return null;
        }
        return new self(
                Utils::getValue($json, "lat"),
                Utils::getValue($json, "lng")
        );
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
                Utils::getValue($arr, "lat"),
                Utils::getValue($arr, "lng")
        );
    }

}