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
 * AddressDetail model
 *
 * @since 2021-01-21
 */
public class ChildrenNode {
    /**
     * ID of a place.
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
     * Longitude and latitude of a place.
     */
    private Coordinate location;

    /**
     * Huawei POI type.
     */
    private String[] hwPoiTypes;

    /**
     * Whether an airport terminal is a national or international terminal. The options are as follows:
     * 1：national
     * 2：international
     * 3：national and international
     */
    private String domeAndInt;

    /**
     * Whether an airport terminal is a departure or arrival terminal. The options are as follows:
     * 1：departure
     * 2：arrival
     * 3：departure and arrival
     */
    private String depAndArr;

    public ChildrenNode() {
    }

    public void resetChildrenInfo() {
        name = null;
        formatAddress = null;
        location = null;
        hwPoiTypes = null;
        domeAndInt = null;
        depAndArr = null;
    }

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

    public Coordinate getLocation() {
        return location;
    }

    public void setLocation(Coordinate location) {
        this.location = location;
    }

    public String[] getHwPoiTypes() {
        return hwPoiTypes;
    }

    public void setHwPoiTypes(String[] hwPoiTypes) {
        this.hwPoiTypes = hwPoiTypes;
    }

    public String getDomeAndInt() {
        return domeAndInt;
    }

    public void setDomeAndInt(String domeAndInt) {
        this.domeAndInt = domeAndInt;
    }

    public String getDepAndArr() {
        return depAndArr;
    }

    public void setDepAndArr(String depAndArr) {
        this.depAndArr = depAndArr;
    }

}
