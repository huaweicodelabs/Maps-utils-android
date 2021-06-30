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

namespace HuaweiMap\Model\Response\Api;

use HuaweiMap\Utils;

class TimezoneResponse extends SiteResponse
{
    /**
     * @var integer DST offset, in seconds. If the specified timestamp is out of the DST, 0 will be returned.
     */
    private $dstOffset;

    /**
     * @var integer Time zone offset of a specified place from UTC, in seconds.
     */
    private $rawOffset;

    /**
     * @var string Time zone ID.
     */
    private $timeZoneId;

    /**
     * @var string Time zone name.
     */
    private $timeZoneName;

    public function __construct($returnCode, $returnDesc, $dstOffset, $rawOffset, $timeZoneId, $timeZoneName)
    {
        parent::__construct($returnCode, $returnDesc);
        $this->dstOffset = $dstOffset;
        $this->rawOffset = $rawOffset;
        $this->timeZoneId = $timeZoneId;
        $this->timeZoneName = $timeZoneName;
    }

    public function getDstOffset()
    {
        return $this->dstOffset;
    }

    public function setDstOffset($dstOffset)
    {
        $this->dstOffset = $dstOffset;
    }

    public function getRawOffset()
    {
        return $this->rawOffset;
    }

    public function setRawOffset($rawOffset)
    {
        $this->rawOffset = $rawOffset;
    }

    public function getTimeZoneId()
    {
        return $this->timeZoneId;
    }

    public function setTimeZoneId($timeZoneId)
    {
        $this->timeZoneId = $timeZoneId;
    }

    public function getTimeZoneName()
    {
        return $this->timeZoneName;
    }

    public function setTimeZoneName($timeZoneName)
    {
        $this->timeZoneName = $timeZoneName;
    }

    public static function toObject($json)
    {
        if (!isset($json)) {
            return null;
        }
        return new self(
                Utils::getValue($json, "returnCode"),
                Utils::getValue($json, "returnDesc"),
                Utils::getValue($json, "dstOffset"),
                Utils::getValue($json, "rawOffset"),
                Utils::getValue($json, "timeZoneId"),
                Utils::getValue($json, "timeZoneName")
        );
    }

    public function getProperties()
    {
        return get_object_vars($this);
    }
}