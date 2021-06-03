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
 * reverseGeocode request object.
 *
 * @since 2021-01-21
 */
public class ReverseGeocodeRequest {
    /**
     * Current location of a user.
     */
    private Coordinate location;

    /**
     * Language in which search results are displayed. If this parameter is not passed, the local language will be used.
     */
    private String language;

    /**
     * Indicates whether to return the POI. The default value is true.
     */
    private Boolean returnPoi;

    public Coordinate getLocation() {
        return location;
    }

    public void setLocation(Coordinate location) {
        this.location = location;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public Boolean getReturnPoi() {
        return returnPoi;
    }

    public void setReturnPoi(Boolean returnPoi) {
        this.returnPoi = returnPoi;
    }
}
