/*
 * Copyright 2021. Huawei Technologies Co., Ltd. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.huawei.hms.site.client.model;

/**
 * AutoCompletePrediction model
 *
 * @since 2021-01-21
 */
public class AutoCompletePrediction {
    /**
     * Description of a predicted autocomplete place.
     */
    private String description;

    /**
     * Matching position of the entered keyword in the description.
     */
    private Word[] matchedKeywords;

    /**
     * Matched words and their positions in the description.
     */
    private Word[] matchedWords;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Word[] getMatchedKeywords() {
        return matchedKeywords;
    }

    public void setMatchedKeywords(Word[] matchedKeywords) {
        this.matchedKeywords = matchedKeywords;
    }

    public Word[] getMatchedWords() {
        return matchedWords;
    }

    public void setMatchedWords(Word[] matchedWords) {
        this.matchedWords = matchedWords;
    }
}
