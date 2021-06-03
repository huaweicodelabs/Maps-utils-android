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
 * nearbySearch request object.
 *
 * @since 2021-01-21
 */
public class NearbySearchRequest {
    /**
     * Number of the current page. The value ranges from 1 to 60. The default value is 1.
     * NOTE：pageIndex * pageSize <= 60
     */
    private Integer pageSize;

    /**
     * Number of records on each page. The value ranges from 1 to 20. The default value is 20.
     * NOTE：pageIndex * pageSize <= 60
     */
    private Integer pageIndex;

    /**
     * Search keyword.
     */
    private String query;

    /**
     * Current location of a user.
     */
    private Coordinate location;

    /**
     * Search radius, in meters. The value ranges from 1 to 50000. The default value is 1000.
     */
    private Integer radius;

    /**
     * POI type.
     */
    private LocationType poiType;

    /**
     * Huawei POI type. This parameter is recommended.
     * NOTE:If both hwPoiType and poiType are set, search results of hwPoiType take precedence.
     */
    private HwLocationType hwPoiType;

    /**
     * Language in which search results are displayed. If this parameter is not passed, the local language will be used.
     */
    private String language;

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public Integer getRadius() {
        return radius;
    }

    public Coordinate getLocation() {
        return location;
    }

    public void setLocation(Coordinate location) {
        this.location = location;
    }

    public void setRadius(Integer radius) {
        this.radius = radius;
    }

    public LocationType getPoiType() {
        return poiType;
    }

    public void setPoiType(LocationType poiType) {
        this.poiType = poiType;
    }

    public HwLocationType getHwPoiType() {
        return hwPoiType;
    }

    public void setHwPoiType(HwLocationType hwPoiType) {
        this.hwPoiType = hwPoiType;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }
}
