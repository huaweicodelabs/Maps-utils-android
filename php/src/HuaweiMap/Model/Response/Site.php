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
use HuaweiMap\Model\Common\CoordinateBounds;
use HuaweiMap\Utils;

class Site extends Base
{
    /**
     * @var string Unique ID of a place.
     */
    private $siteId;

    /**
     * @var string Formatted detailed address of a place.
     */
    private $formatAddress;

    /**
     * @var AddressDetail Place details.
     */
    private $address;

    /**
     * @var string Name of a place.
     */
    private $name;

    /**
     * @var Coordinate Longitude and latitude of a place.
     */
    private $location;

    /**
     * @var CoordinateBounds Viewport of a place.
     */
    private $viewport;

    /**
     * @var float Linear distance between a predicted place and the location specified by the input parameter location, in meters.
     */
    private $distance;

    /**
     * @var Poi POI of a place.
     */
    private $poi;

    /**
     * @var string Difference between the time zone of a place and the UTC time zone, in minutes.
     */
    private $utcOffset;

    /**
     * @var AutocompletePrediction Autocomplete place description.
     */
    private $prediction;

    public function __construct(
            $siteId,
            $formatAddress,
            $address,
            $name,
            $location,
            $viewport,
            $distance,
            $poi,
            $utcOffset,
            $prediction
    )
    {
        $this->siteId = $siteId;
        $this->formatAddress = $formatAddress;
        $this->address = $address;
        $this->name = $name;
        $this->location = $location;
        $this->viewport = $viewport;
        $this->distance = $distance;
        $this->poi = $poi;
        $this->utcOffset = $utcOffset;
        $this->prediction = $prediction;
    }

    public function getSiteId()
    {
        return $this->siteId;
    }

    public function setSiteId($siteId)
    {
        $this->siteId = $siteId;
    }

    public function getFormatAddress()
    {
        return $this->formatAddress;
    }

    public function setFormatAddress($formatAddress)
    {
        $this->formatAddress = $formatAddress;
    }

    public function getAddress()
    {
        return $this->address;
    }

    public function setAddress($address)
    {
        $this->address = $address;
    }

    public function getName()
    {
        return $this->name;
    }

    public function setName($name)
    {
        $this->name = $name;
    }

    public function getLocation()
    {
        return $this->location;
    }

    public function setLocation($location)
    {
        $this->location = $location;
    }

    public function getViewport()
    {
        return $this->viewport;
    }

    public function setViewport($viewport)
    {
        $this->viewport = $viewport;
    }

    public function getDistance()
    {
        return $this->distance;
    }

    public function setDistance($distance)
    {
        $this->distance = $distance;
    }

    public function getPoi()
    {
        return $this->poi;
    }

    public function setPoi($poi)
    {
        $this->poi = $poi;
    }

    public function getUtcOffset()
    {
        return $this->utcOffset;
    }

    public function setUtcOffset($utcOffset)
    {
        $this->utcOffset = $utcOffset;
    }

    public function getPrediction()
    {
        return $this->prediction;
    }

    public function setPrediction($prediction)
    {
        $this->prediction = $prediction;
    }

    public static function toObject($json)
    {
        if (!isset($json)) {
            return null;
        }
        return new self(
                Utils::getValue($json, "siteId"),
                Utils::getValue($json, "formatAddress"),
                AddressDetail::toObject(Utils::getValue($json, "address")),
                Utils::getValue($json, "name"),
                Coordinate::toObject(Utils::getValue($json, "location")),
                CoordinateBounds::toObject(Utils::getValue($json, "viewport")),
                Utils::getValue($json, "distance"),
                Poi::toObject(Utils::getValue($json, "poi")),
                Utils::getValue($json, "utcOffset"),
                AutocompletePrediction::toObject(Utils::getValue($json, "prediction"))
        );
    }

    public function getProperties()
    {
        return get_object_vars($this);
    }

}