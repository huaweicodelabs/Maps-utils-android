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

class Word extends Base
{
    /**
     * @var integer Offset of a word in the description.
     */
    private $offset;

    /**
     * @var string Word.
     */
    private $value;

    public function __construct($offset, $value)
    {
        $this->offset = $offset;
        $this->value = $value;
    }

    public function getOffset()
    {
        return $this->offset;
    }

    public function setOffset($offset)
    {
        $this->offset = $offset;
    }

    public function getValue()
    {
        return $this->value;
    }

    public function setValue($value)
    {
        $this->value = $value;
    }

    public static function toObject($json)
    {
        if (!isset($json)) {
            return null;
        }
        return new Word(
                Utils::getValue($json, "offset"),
                Utils::getValue($json, "value")
        );
    }

    public function getProperties()
    {
        return get_object_vars($this);
    }
}
