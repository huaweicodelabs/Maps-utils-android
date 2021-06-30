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

use HuaweiMap\Model\Common\Coordinate;
use HuaweiMap\Model\Request\Base;
use HuaweiMap\Utils;

class QueryAutocompleteRequest extends Base
{
    /**
     * @var string Search keyword. This parameter is mandatory.
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
     * @var string Language in which the autocomplete results are displayed.
     */
    private $language;

    /**
     * @var bool Indicates whether to return information about child nodes. The options are true (indicating to return the IDs of
     * child nodes) and false (indicating that no child information is returned). The default value is false.
     */
    private $children;

    public function __construct(
            $query,
            Coordinate $location = null,
            $radius = null,
            $language = null,
            $children = null
    )
    {
        $this->setQuery($query)
                ->setLocation($location)
                ->setRadius($radius)
                ->setLanguage($language)
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
                Utils::getValue($arr, "language"),
                Utils::getValue($arr, "children")
        );
    }

}