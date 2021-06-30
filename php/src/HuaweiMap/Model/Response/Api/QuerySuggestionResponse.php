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

use HuaweiMap\Model\Response\Site;
use HuaweiMap\Utils;

class QuerySuggestionResponse extends SiteResponse
{
    /**
     * @var Site[] List of matched places.
     */
    private $sites;

    public function __construct($returnCode, $returnDesc, $sites)
    {
        parent::__construct($returnCode, $returnDesc);
        $this->sites = $sites;
    }

    public function getSites()
    {
        return $this->sites;
    }

    public function setSites($sites)
    {
        $this->sites = $sites;
    }

    public static function toObject($json)
    {
        if (!isset($json)) {
            return null;
        }
        return new self(
                Utils::getValue($json, "returnCode"),
                Utils::getValue($json, "returnDesc"),
                Site::toObjectArray(Utils::getValue($json, "sites"))
        );
    }

    public function getProperties()
    {
        return get_object_vars($this);
    }
}