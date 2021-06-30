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

class AddressDetail extends Base
{
    /**
     * @var string Country/Region code, which complies with the ISO 3166-1 alpha-2 standard.
     */
    private $countryCode;

    /**
     * @var string Country name.
     */
    private $country;

    /**
     * @var string Level-1 administrative region in a country, which is generally a province or state.
     */
    private $adminArea;

    /**
     * @var string Level-2 administrative region in a country, which is generally a city.
     */
    private $subAdminArea;

    /**
     * @var string Level-3 administrative region of a country.
     */
    private $tertiaryAdminArea;

    /**
     * @var string Level-3 administrative region in a country, which is generally a county or district.
     */
    private $locality;

    /**
     * @var string District/county to which a place belongs.
     */
    private $subLocality;

    /**
     * @var string Street.
     */
    private $streetNumber;

    /**
     * @var string Street number.
     */
    private $thoroughfare;

    /**
     * @var string Postal code.
     */
    private $postalCode;

    public function __construct(
            $countryCode,
            $country,
            $adminArea,
            $subAdminArea,
            $tertiaryAdminArea,
            $locality,
            $subLocality,
            $streetNumber,
            $thoroughfare,
            $postalCode)
    {
        $this->countryCode = $countryCode;
        $this->country = $country;
        $this->adminArea = $adminArea;
        $this->subAdminArea = $subAdminArea;
        $this->tertiaryAdminArea = $tertiaryAdminArea;
        $this->locality = $locality;
        $this->subLocality = $subLocality;
        $this->streetNumber = $streetNumber;
        $this->thoroughfare = $thoroughfare;
        $this->postalCode = $postalCode;
    }

    public function getCountryCode()
    {
        return $this->countryCode;
    }

    public function setCountryCode($countryCode)
    {
        $this->countryCode = $countryCode;
    }

    public function getCountry()
    {
        return $this->country;
    }

    public function setCountry($country)
    {
        $this->country = $country;
    }

    public function getAdminArea()
    {
        return $this->adminArea;
    }

    public function setAdminArea($adminArea)
    {
        $this->adminArea = $adminArea;
    }

    public function getSubAdminArea()
    {
        return $this->subAdminArea;
    }

    public function setSubAdminArea($subAdminArea)
    {
        $this->subAdminArea = $subAdminArea;
    }

    public function getTertiaryAdminArea()
    {
        return $this->tertiaryAdminArea;
    }

    public function setTertiaryAdminArea($tertiaryAdminArea)
    {
        $this->tertiaryAdminArea = $tertiaryAdminArea;
    }

    public function getLocality()
    {
        return $this->locality;
    }

    public function setLocality($locality)
    {
        $this->locality = $locality;
    }

    public function getSubLocality()
    {
        return $this->subLocality;
    }

    public function setSubLocality($subLocality)
    {
        $this->subLocality = $subLocality;
    }

    public function getStreetNumber()
    {
        return $this->streetNumber;
    }

    public function setStreetNumber($streetNumber)
    {
        $this->streetNumber = $streetNumber;
    }

    public function getThoroughfare()
    {
        return $this->thoroughfare;
    }

    public function setThoroughfare($thoroughfare)
    {
        $this->thoroughfare = $thoroughfare;
    }

    public function getPostalCode()
    {
        return $this->postalCode;
    }

    public function setPostalCode($postalCode)
    {
        $this->postalCode = $postalCode;
    }

    public static function toObject($json)
    {
        if (!isset($json)) {
            return null;
        }
        return new self(
                Utils::getValue($json, "countryCode"),
                Utils::getValue($json, "country"),
                Utils::getValue($json, "adminArea"),
                Utils::getValue($json, "subAdminArea"),
                Utils::getValue($json, "tertiaryAdminArea"),
                Utils::getValue($json, "locality"),
                Utils::getValue($json, "subLocality"),
                Utils::getValue($json, "streetNumber"),
                Utils::getValue($json, "thoroughfare"),
                Utils::getValue($json, "postalCode"));
    }

    public function getProperties()
    {
        return get_object_vars($this);
    }
}