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

class Poi extends Base
{
    /**
     * @var string[] POI type.
     */
    private $poiTypes;

    /**
     * @var string[] Huawei POI type.
     */
    private $hwPoiTypes;

    /**
     * @var string Phone number.
     */
    private $phone;

    /**
     * @var string International phone number.
     */
    private $internationalPhone;

    /**
     * @var string Rating.
     */
    private $rating;

    /**
     * @var string Official website
     */
    private $websiteUrl;

    /**
     * @var OpeningHours Opening hours.
     */
    protected $openingHours;

    /**
     * @var string[] Photo URL.
     */
    private $photoUrls;

    /**
     * @var integer Price level. The value ranges from 0 to 4.
     */
    private $priceLevel;

    /**
     * @var string Business status of a place. The options are as follows:
     * OPEN_NOW：open
     * CLOSE_NOW：closed
     * CLOSED_TEMPORARILY：temporarily closed
     * CLOSED_PERMANENTLY：permanently closed
     */
    private $businessStatus;

    /**
     * @var ChildrenNode[]
     */
    private $childrenNodes;

    public function __construct(
            $poiTypes,
            $hwPoiTypes,
            $phone,
            $internationalPhone,
            $rating,
            $websiteUrl,
            $openingHours,
            $photoUrls,
            $priceLevel,
            $businessStatus,
            $childrenNodes)
    {
        $this->poiTypes = $poiTypes;
        $this->hwPoiTypes = $hwPoiTypes;
        $this->phone = $phone;
        $this->internationalPhone = $internationalPhone;
        $this->rating = $rating;
        $this->websiteUrl = $websiteUrl;
        $this->openingHours = $openingHours;
        $this->photoUrls = $photoUrls;
        $this->priceLevel = $priceLevel;
        $this->businessStatus = $businessStatus;
        $this->childrenNodes = $childrenNodes;
    }

    public function getPoiTypes()
    {
        return $this->poiTypes;
    }

    public function setPoiTypes($poiTypes)
    {
        $this->poiTypes = $poiTypes;
    }

    public function getHwPoiTypes()
    {
        return $this->hwPoiTypes;
    }

    public function setHwPoiTypes($hwPoiTypes)
    {
        $this->hwPoiTypes = $hwPoiTypes;
    }

    public function getPhone()
    {
        return $this->phone;
    }

    public function setPhone($phone)
    {
        $this->phone = $phone;
    }

    public function getInternationalPhone()
    {
        return $this->internationalPhone;
    }

    public function setInternationalPhone($internationalPhone)
    {
        $this->internationalPhone = $internationalPhone;
    }

    public function getRating()
    {
        return $this->rating;
    }

    public function setRating($rating)
    {
        $this->rating = $rating;
    }

    public function getWebsiteUrl()
    {
        return $this->websiteUrl;
    }

    public function setWebsiteUrl($websiteUrl)
    {
        $this->websiteUrl = $websiteUrl;
    }

    public function getOpeningHours()
    {
        return $this->openingHours;
    }

    public function setOpeningHours(OpeningHours $openingHours)
    {
        $this->openingHours = $openingHours;
    }

    public function getPhotoUrls()
    {
        return $this->photoUrls;
    }

    public function setPhotoUrls($photoUrls)
    {
        $this->photoUrls = $photoUrls;
    }

    public function getPriceLevel()
    {
        return $this->priceLevel;
    }

    public function setPriceLevel($priceLevel)
    {
        $this->priceLevel = $priceLevel;
    }

    public function getBusinessStatus()
    {
        return $this->businessStatus;
    }

    public function setBusinessStatus($businessStatus)
    {
        $this->businessStatus = $businessStatus;
    }

    public function getChildrenNodes()
    {
        return $this->childrenNodes;
    }

    public function setChildrenNodes($childrenNodes)
    {
        $this->childrenNodes = $childrenNodes;
    }

    public static function toObject($json)
    {
        if (!isset($json)) {
            return null;
        }
        return new self(
                Utils::getValue($json, "poiTypes"),
                Utils::getValue($json, "hwPoiTypes"),
                Utils::getValue($json, "phone"),
                Utils::getValue($json, "internationalPhone"),
                Utils::getValue($json, "rating"),
                Utils::getValue($json, "websiteUrl"),
                OpeningHours::toObject(Utils::getValue($json, "openingHours")),
                Utils::getValue($json, "photoUrls"),
                Utils::getValue($json, "priceLevel", -1),
                Utils::getValue($json, "businessStatus"),
                ChildrenNode::toObjectArray(Utils::getValue($json, "childrenNodes"))
        );
    }

    public function getProperties()
    {
        return get_object_vars($this);
    }
}

