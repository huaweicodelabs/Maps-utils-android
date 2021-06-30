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

class TextSearchRequest extends Base
{
    /**
     * @var string Search keyword.
     */
    private $query;

    /**
     * @var Coordinate Longitude and latitude to which search results need to be biased.
     */
    private $location;

    /**
     * @var int Search radius, in meters. The value ranges from 1 to 50000. The default value is 50000.
     */
    private $radius;

    /**
     * @var string POI type.
     */
    private $poiType;

    /**
     * @var string Huawei POI type. This parameter is recommended.
     * NOTE:If both hwPoiType and poiType are set, search results of hwPoiType take precedence.
     */
    private $hwPoiType;

    /**
     * @var string Country/Region code, which complies with the ISO 3166-1 alpha-2 standard. This parameter is used to specify the
     * country/region where places are searched.
     */
    private $countryCode;

    /**
     * @var string Language in which search results are displayed. If this parameter is not passed, the local language will be used.
     */
    private $language;

    /**
     * @var int Number of the current page. The value ranges from 1 to 60. The default value is 1.
     * NOTE:pageIndex * pageSize <= 60
     */
    private $pageIndex;

    /**
     * @var int Number of records on each page. The value ranges from 1 to 20. The default value is 20.
     * NOTE:pageIndex * pageSize <= 60
     */
    private $pageSize;

    /**
     * @var boolean Indicates whether to return information about child nodes. The options are true (indicating to return all
     * information about child nodes) and false (indicating that no child information is returned). The default value is
     * false.
     */
    private $children;

    public function __construct(
            $query,
            Coordinate $location = null,
            $radius = null,
            $poiType = null,
            $hwPoiType = null,
            $countryCode = null,
            $language = null,
            $pageSize = null,
            $pageIndex = null,
            $children = null
    )
    {
        $this->setQuery($query)
                ->setLocation($location)
                ->setRadius($radius)
                ->setPoiType($poiType)
                ->setHwPoiType($hwPoiType)
                ->setCountryCode($countryCode)
                ->setLanguage($language)
                ->setPageSize($pageSize)
                ->setPageIndex($pageIndex)
                ->setChildren($children);
    }

    /**
     * @return string
     */
    public function getQuery()
    {
        return $this->query;
    }

    /**
     * @param $query string
     * @return $this
     */
    public function setQuery($query)
    {
        $this->query = $query;
        return $this;
    }

    /**
     * @return Coordinate
     */
    public function getLocation()
    {
        return $this->location;
    }

    /**
     * @param Coordinate|null $location
     * @return $this
     */
    public function setLocation(Coordinate $location = null)
    {
        $this->location = $location;
        return $this;
    }

    /**
     * @return int
     */
    public function getRadius()
    {
        return $this->radius;
    }

    /**
     * @param $radius int
     * @return $this
     */
    public function setRadius($radius)
    {
        $this->radius = $radius;
        return $this;
    }

    /**
     * @return string
     */
    public function getPoiType()
    {
        return $this->poiType;
    }

    /**
     * @param $poiType string
     * @return $this
     */
    public function setPoiType($poiType)
    {
        $this->poiType = $poiType;
        return $this;
    }

    /**
     * @return string
     */
    public function getHwPoiType()
    {
        return $this->hwPoiType;
    }

    /**
     * @param $hwPoiType string
     * @return $this
     */
    public function setHwPoiType($hwPoiType)
    {
        $this->hwPoiType = $hwPoiType;
        return $this;
    }

    /**
     * @return string
     */
    public function getCountryCode()
    {
        return $this->countryCode;
    }

    /**
     * @param $countryCode string
     * @return $this
     */
    public function setCountryCode($countryCode)
    {
        $this->countryCode = $countryCode;
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

    /**
     * @return int
     */
    public function getPageSize()
    {
        return $this->pageSize;
    }

    /**
     * @param $pageSize int
     * @return $this
     */
    public function setPageSize($pageSize)
    {
        $this->pageSize = $pageSize;
        return $this;
    }

    /**
     * @return int
     */
    public function getPageIndex()
    {
        return $this->pageIndex;
    }

    /**
     * @param $pageIndex int
     * @return $this
     */
    public function setPageIndex($pageIndex)
    {
        $this->pageIndex = $pageIndex;
        return $this;
    }

    /**
     * @return bool
     */
    public function getChildren()
    {
        return $this->children;
    }

    /**
     * @param $children bool
     * @return $this
     */
    public function setChildren($children)
    {
        $this->children = $children;
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
                Utils::getValue($arr, "query"),
                Utils::getValue($arr, "location"),
                Utils::getValue($arr, "radius"),
                Utils::getValue($arr, "poiType"),
                Utils::getValue($arr, "hwPoiType"),
                Utils::getValue($arr, "countryCode"),
                Utils::getValue($arr, "language"),
                Utils::getValue($arr, "pageSize"),
                Utils::getValue($arr, "pageIndex"),
                Utils::getValue($arr, "children")
        );
    }
}