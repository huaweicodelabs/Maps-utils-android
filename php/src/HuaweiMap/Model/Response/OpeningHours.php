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

namespace HuaweiMap\Model\Response;

use HuaweiMap\Utils;

class OpeningHours extends Base
{
    /**
     * @var Period[] Opening hours of a place
     */
    private $periods;

    /**
     * @var string[] Description of weekly opening hours of a place
     */
    private $texts;

    /**
     * OpeningHours constructor.
     * @param $periods Period[]
     * @param $texts string[]
     */
    public function __construct($periods, $texts)
    {
        $this->periods = $periods;
        $this->texts = $texts;
    }

    public function getPeriods()
    {
        return $this->periods;
    }

    /**
     * @param $periods Period[]
     * @return $this
     */
    public function setPeriods($periods)
    {
        $this->periods = $periods;
    }

    public function getTexts()
    {
        return $this->texts;
    }

    public function setTexts($texts)
    {
        $this->texts = $texts;
    }

    public static function toObject($json)
    {
        if (!isset($json)) {
            return null;
        }
        return new self(
                Period::toObjectArray(Utils::getValue($json, "periods")),
                Utils::getValue($json, "texts")
        );
    }

    public function getProperties()
    {
        return get_object_vars($this);
    }
}
