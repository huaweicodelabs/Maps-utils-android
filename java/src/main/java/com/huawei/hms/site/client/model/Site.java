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
 * Place Model.
 *
 * @since 2021-01-21
 */
public class Site {
    /**
     * Unique ID of a place.
     */
    private String siteId;

    /**
     * Name of a place.
     */
    private String name;

    /**
     * Formatted detailed address of a place.
     */
    private String formatAddress;

    /**
     * Place details.
     */
    private AddressDetail address;

    /**
     * Longitude and latitude of a place.
     */
    private Coordinate location;

    /**
     * Viewport of a place.
     */
    private CoordinateBounds viewport;

    /**
     * Linear distance between a predicted place and the location specified by the input parameter location, in meters.
     */
    private Double distance = Double.NaN;

    /**
     * POI of a place.
     */
    private Poi poi;

    /**
     * Autocomplete place description.
     */
    private AutoCompletePrediction prediction;

    /**
     * Difference between the time zone of a place and the UTC time zone, in minutes.
     */
    private Integer utcOffset = 0;

    public String getSiteId() {
        return siteId;
    }

    public void setSiteId(String siteId) {
        this.siteId = siteId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFormatAddress() {
        return formatAddress;
    }

    public void setFormatAddress(String formatAddress) {
        this.formatAddress = formatAddress;
    }

    public AddressDetail getAddress() {
        return address;
    }

    public void setAddress(AddressDetail address) {
        this.address = address;
    }

    public Coordinate getLocation() {
        return location;
    }

    public void setLocation(Coordinate location) {
        this.location = location;
    }

    public CoordinateBounds getViewport() {
        return viewport;
    }

    public void setViewport(CoordinateBounds viewport) {
        this.viewport = viewport;
    }

    public Double getDistance() {
        return distance;
    }

    public void setDistance(Double distance) {
        this.distance = distance;
    }

    public Poi getPoi() {
        return poi;
    }

    public void setPoi(Poi poi) {
        this.poi = poi;
    }

    public AutoCompletePrediction getPrediction() {
        return prediction;
    }

    public void setPrediction(AutoCompletePrediction prediction) {
        this.prediction = prediction;
    }

    public Integer getUtcOffset() {
        return utcOffset;
    }

    public void setUtcOffset(Integer utcOffset) {
        this.utcOffset = utcOffset;
    }
}
