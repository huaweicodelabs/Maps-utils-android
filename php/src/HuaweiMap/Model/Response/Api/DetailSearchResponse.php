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

class DetailSearchResponse extends SiteResponse
{
    /**
     * @var Site Place object
     */
    private $site;

    public function __construct($returnCode, $returnDesc, $site)
    {
        parent::__construct($returnCode, $returnDesc);
        $this->site = $site;
    }

    public function getSite()
    {
        return $this->site;
    }

    public function setSite($site)
    {
        $this->site = $site;
    }

    public static function toObject($json)
    {
        if (!isset($json)) {
            return null;
        }
        return new self(
                Utils::getValue($json, "returnCode"),
                Utils::getValue($json, "returnDesc"),
                Site::toObject(Utils::getValue($json, "site"))
        );
    }

    public function getProperties()
    {
        return get_object_vars($this);
    }
}