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

class TimeOfWeek extends Base
{
    /**
     * @var integer
     * 0-Sunday
     * 1-Monday
     * 2-Tuesday
     * 3-Wednesday
     * 4-Thursday
     * 5-Friday
     * 6-Saturday
     */
    private $week;
    /**
     * @var string 4-hour time point on a day, in hhmm format. The value ranges from 0000 to 2359.
     */
    private $time;

    public function __construct($week, $time)
    {
        $this->week = $week;
        $this->time = $time;
    }

    public function getWeek()
    {
        return $this->week;
    }

    public function setWeek($week)
    {
        $this->week = $week;
    }

    public function getTime()
    {
        return $this->time;
    }

    public function setTime($time)
    {
        $this->time = $time;
    }

    public static function toObject($json)
    {
        if (!isset($json)) {
            return null;
        }
        return new self(
                Utils::getValue($json, 'week'),
                Utils::getValue($json, 'time')
        );
    }

    public function getProperties()
    {
        return get_object_vars($this);
    }

}