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
 * queryAutocomplete request object.
 *
 * @since 2021-01-21
 */
public class QueryAutocompleteRequest {
    /**
     * Search keyword. This parameter is mandatory.
     */
    private String query;

    /**
     * Longitude and latitude to which search results need to be biased.
     */
    private Coordinate location;

    /**
     * Search radius, in meters. The value ranges from 1 to 50000. The default value is 50000.
     */
    private Integer radius;

    /**
     * Language in which the autocomplete results are displayed.
     */
    private String language;

    /**
     * Indicates whether to return information about child nodes. The options are true (indicating to return the IDs of
     * child nodes) and false (indicating that no child information is returned). The default value is false.
     */
    private boolean children;

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public Coordinate getLocation() {
        return location;
    }

    public void setLocation(Coordinate location) {
        this.location = location;
    }

    public Integer getRadius() {
        return radius;
    }

    public void setRadius(Integer radius) {
        this.radius = radius;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public boolean isChildren() {
        return children;
    }

    public void setChildren(boolean children) {
        this.children = children;
    }
}
