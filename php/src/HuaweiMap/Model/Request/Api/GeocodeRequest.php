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
use HuaweiMap\Model\Common\CoordinateBounds;
use HuaweiMap\Utils;

class GeocodeRequest extends Base
{
    /**
     * @var string Address information
     */
    private $address;

    /**
     * @var CoordinateBounds Coordinate bounds to which search results need to be biased.
     */
    private $bounds;

    /**
     * @var string Language in which search results are displayed.
     * If this parameter is not passed, the local language will be used.
     */
    private $language;

    public function __construct(
            $address,
            CoordinateBounds $bounds = null,
            $language = null)
    {
        $this->setAddress($address)->setBounds($bounds)->setLanguage($language);
    }

    public function getAddress()
    {
        return $this->address;
    }

    public function setAddress($address)
    {
        $this->address = $address;
        return $this;
    }

    public function getBounds()
    {
        return $this->bounds;
    }

    public function setBounds(CoordinateBounds $bounds = null)
    {
        $this->bounds = $bounds;
        return $this;
    }

    public function getLanguage()
    {
        return $this->language;
    }

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
                Utils::getValue($arr, "address"),
                Utils::getValue($arr, "bounds"),
                Utils::getValue($arr, "language")
        );
    }
}