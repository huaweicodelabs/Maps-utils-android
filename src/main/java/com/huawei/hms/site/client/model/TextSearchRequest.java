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
 * textSearch request object.
 *
 * @since 2021-01-21
 */
public class TextSearchRequest {
    /**
     * Language in which search results are displayed. If this parameter is not passed, the local language will be used.
     */
    private String language;

    /**
     * Search keyword.
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
     * Number of records on each page. The value ranges from 1 to 20. The default value is 20.
     * NOTE:pageIndex * pageSize <= 60
     */
    private Integer pageSize;

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
     * Number of the current page. The value ranges from 1 to 60. The default value is 1.
     * NOTE:pageIndex * pageSize <= 60
     */
    private Integer pageIndex;

    /**
     * Country/Region code, which complies with the ISO 3166-1 alpha-2 standard. This parameter is used to specify the
     * country/region where places are searched.
     */
    private String countryCode;

    /**
     * Indicates whether to return information about child nodes. The options are true (indicating to return all
     * information about child nodes) and false (indicating that no child information is returned). The default value is
     * false.
     */
    private boolean children;

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

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

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
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

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    @Override
    public String toString() {
        return "TextSearchRequest{" + "poiType=" + poiType + ", hwPoiType=" + hwPoiType + '}';
    }

    public boolean isChildren() {
        return children;
    }

    public void setChildren(boolean children) {
        this.children = children;
    }
}
