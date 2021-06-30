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

use HuaweiMap\Model\Common\Coordinate;
use HuaweiMap\Utils;

class ChildrenNode extends Base
{
    /**
     * @var string ID of a place
     */
    private $siteId;

    /**
     * @var string Name of a place
     */
    private $name;

    /**
     * @var string Formatted detailed address of a place
     */
    private $formatAddress;

    /**
     * @var Coordinate Longitude and latitude of a place
     */
    private $location;

    /**
     * @var string[] Huawei POI types
     */
    private $hwPoiTypes;

    /**
     * @var string
     * Whether an airport terminal is a national or international terminal. The options are as follows:
     * 1：national
     * 2：international
     * 3：national and international
     */
    private $domeAndInt;

    /**
     * @var string
     * Whether an airport terminal is a departure or arrival terminal. The options are as follows:
     * 1：departure
     * 2：arrival
     * 3：departure and arrival
     */
    private $depAndArr;

    public function __construct(
            $siteId,
            $name,
            $formatAddress,
            Coordinate $location,
            $hwPoiTypes,
            $domeAndInt,
            $depAndArr)
    {
        $this->siteId = $siteId;
        $this->name = $name;
        $this->formatAddress = $formatAddress;
        $this->location = $location;
        $this->hwPoiTypes = $hwPoiTypes;
        $this->domeAndInt = $domeAndInt;
        $this->depAndArr = $depAndArr;
    }

    public function getSiteId()
    {
        return $this->siteId;
    }

    public function setSiteId($siteId)
    {
        $this->siteId = $siteId;
    }

    public function getName()
    {
        return $this->name;
    }

    public function setName($name)
    {
        $this->name = $name;
    }

    public function getFormatAddress()
    {
        return $this->formatAddress;
    }

    public function setFormatAddress($formatAddress)
    {
        $this->formatAddress = $formatAddress;
    }

    public function getLocation()
    {
        return $this->location;
    }

    public function setLocation(Coordinate $location)
    {
        $this->location = $location;
    }

    public function getHwPoiTypes()
    {
        return $this->hwPoiTypes;
    }

    public function setHwPoiTypes($hwPoiTypes)
    {
        $this->hwPoiTypes = $hwPoiTypes;
    }

    public function getDomeAndInt()
    {
        return $this->domeAndInt;
    }

    public function setDomeAndInt($domeAndInt)
    {
        $this->domeAndInt = $domeAndInt;
    }

    public function getDepAndArr()
    {
        return $this->depAndArr;
    }

    public function setDepAndArr($depAndArr)
    {
        $this->depAndArr = $depAndArr;
    }

    public static function toObject($json)
    {
        if (!isset($json)) {
            return null;
        }
        return new self(
                Utils::getValue($json, "siteId"),
                Utils::getValue($json, "name"),
                Utils::getValue($json, "formatAddress"),
                Coordinate::toObject(Utils::getValue($json, "location")),
                Utils::getValue($json, "hwPoiTypes"),
                Utils::getValue($json, "domeAndInt"),
                Utils::getValue($json, "depAndArr")
        );
    }

    public function getProperties()
    {
        return get_object_vars($this);
    }
}