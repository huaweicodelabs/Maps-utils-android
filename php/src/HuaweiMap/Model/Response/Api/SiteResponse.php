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

use HuaweiMap\Model\Response\Base;

abstract class SiteResponse extends Base
{
    private $returnCode;
    private $returnDesc;

    public function __construct($returnCode, $returnDesc)
    {
        $this->returnCode = $returnCode;
        $this->returnDesc = $returnDesc;
    }

    public function getReturnDesc()
    {
        return $this->returnDesc;
    }

    public function setReturnDesc($returnDesc)
    {
        $this->returnDesc = $returnDesc;
    }

    public function getReturnCode()
    {
        return $this->returnCode;
    }

    public function setReturnCode($returnCode)
    {
        $this->returnCode = $returnCode;
    }

}