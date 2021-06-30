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

namespace HuaweiMap;

use HuaweiMap\Model\PropertiesAccessible;

class Utils
{
    public static function isArray($var)
    {
        return gettype($var) === "array";
    }

    public static function isObject($var)
    {
        return gettype($var) === "object";
    }

    public static function toArray($var)
    {
        if (!self::isObject($var) && !self::isArray($var)) {
            return null;
        }
        $arr = array();
        $iter = self::isObject($var) && $var instanceof PropertiesAccessible ? $var->getProperties() : $var;
        foreach ($iter as $key => $value) {
            if (isset($value)) {
                if (self::isObject($value) || self::isArray($value)) {
                    $arr[$key] = Utils::toArray($value);
                } else {
                    $arr[$key] = $value;
                }
            }
        }
        return $arr;
    }

    public static function getValue($arr, $key, $default = null)
    {
        if (array_key_exists($key, $arr)) {
            return $arr[$key];
        }
        return $default;
    }

    /**
     * @param $jsonString
     * @return mixed|null
     */
    public static function parseJson($jsonString)
    {
        $res = json_decode($jsonString, true);
        return (json_last_error() == JSON_ERROR_NONE) ? $res : null;
    }
}