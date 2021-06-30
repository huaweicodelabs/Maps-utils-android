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

class AutocompletePrediction extends Base
{
    /**
     * @var string Description of a predicted autocomplete place
     */
    private $description;

    /**
     * @var Word[] Matching position of the entered keyword in the description
     */
    private $matchedKeywords;

    /**
     * @var Word[] Matched words and their positions in the description
     */
    private $matchedWords;

    public function __construct(
            $description,
            $matchedKeywords,
            $matchedWords)
    {
        $this->description = $description;
        $this->matchedKeywords = $matchedKeywords;
        $this->matchedWords = $matchedWords;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function setDescription($description)
    {
        $this->description = $description;
    }

    public function getMatchedKeywords()
    {
        return $this->matchedKeywords;
    }

    public function setMatchedKeywords($matchedKeywords)
    {
        $this->matchedKeywords = $matchedKeywords;
    }

    public function getMatchedWords()
    {
        return $this->matchedWords;
    }

    public function setMatchedWords($matchedWords)
    {
        $this->matchedWords = $matchedWords;
    }

    public static function toObject($json)
    {
        if (!isset($json)) {
            return null;
        }
        return new self(
                Utils::getValue($json, "description"),
                Word::toObjectArray(Utils::getValue($json, "matchedKeywords")),
                Word::toObjectArray(Utils::getValue($json, "matchedWords"))
        );
    }

    public function getProperties()
    {
        return get_object_vars($this);
    }
}
