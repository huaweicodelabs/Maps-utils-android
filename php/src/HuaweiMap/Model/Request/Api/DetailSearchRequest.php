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
use HuaweiMap\Utils;

class DetailSearchRequest extends Base
{
    /**
     * @var string ID of a place.
     */
    private $siteId;

    /**
     * @var string Language in which search results are displayed.
     * If this parameter is not passed, the local language will be used.
     */
    private $language;

    /**
     * @var bool Indicates whether to return information about child nodes.
     * The options are true (indicating to return the IDs of child nodes) and
     * false (indicating that no child information is returned). The default value is false.
     */
    private $children;

    public function __construct(
            $siteId,
            $language = null,
            $children = null)
    {
        $this->setSiteId($siteId)->setLanguage($language)->setChildren($children);
    }

    /**
     * @return string
     */
    public function getSiteId()
    {
        return $this->siteId;
    }

    /**
     * @param $siteId string
     * @return $this
     */
    public function setSiteId($siteId)
    {
        $this->siteId = $siteId;
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
                Utils::getValue($arr, "siteId"),
                Utils::getValue($arr, "language"),
                Utils::getValue($arr, "children")
        );
    }
}