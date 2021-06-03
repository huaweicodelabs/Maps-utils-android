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
 * POI Model.
 *
 * @since 2021-01-21
 */
public class Poi {
    /**
     * POI type.
     */
    private String[] poiTypes;

    /**
     * Huawei POI type.
     */
    private String[] hwPoiTypes;

    /**
     * Phone number.
     */
    private String phone;

    /**
     * International phone number.
     */
    private String internationalPhone;

    /**
     * Rating.
     */
    private double rating;

    /**
     * Official website.
     */
    private String websiteUrl;

    /**
     * Opening hours.
     */
    private OpeningHours openingHours;

    /**
     * Photo URL.
     */
    private String[] photoUrls;

    /**
     * Price level. The value ranges from 0 to 4.
     */
    private Integer priceLevel = -1;

    /**
     * Business status of a place. The options are as follows:
     * OPEN_NOW：open
     * CLOSE_NOW：closed
     * CLOSED_TEMPORARILY：temporarily closed
     * CLOSED_PERMANENTLY：permanently closed
     */
    private String businessStatus;

    private ChildrenNode[] childrenNodes;

    public String[] getPoiTypes() {
        return poiTypes;
    }

    public void setPoiTypes(String[] poiTypes) {
        this.poiTypes = poiTypes;
    }

    public String[] getHwPoiTypes() {
        return hwPoiTypes;
    }

    public void setHwPoiTypes(String[] hwPoiTypes) {
        this.hwPoiTypes = hwPoiTypes;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getInternationalPhone() {
        return internationalPhone;
    }

    public void setInternationalPhone(String internationalPhone) {
        this.internationalPhone = internationalPhone;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getWebsiteUrl() {
        return websiteUrl;
    }

    public void setWebsiteUrl(String websiteUrl) {
        this.websiteUrl = websiteUrl;
    }

    public OpeningHours getOpeningHours() {
        return openingHours;
    }

    public void setOpeningHours(OpeningHours openingHours) {
        this.openingHours = openingHours;
    }

    public String[] getPhotoUrls() {
        return photoUrls;
    }

    public void setPhotoUrls(String[] photoUrls) {
        this.photoUrls = photoUrls;
    }

    public Integer getPriceLevel() {
        return priceLevel;
    }

    public void setPriceLevel(Integer priceLevel) {
        this.priceLevel = priceLevel;
    }

    public String getBusinessStatus() {
        return businessStatus;
    }

    public void setBusinessStatus(String businessStatus) {
        this.businessStatus = businessStatus;
    }

    public ChildrenNode[] getChildrenNodes() {
        return childrenNodes;
    }

    public void setChildrenNodes(ChildrenNode[] childrenNodes) {
        this.childrenNodes = childrenNodes;
    }
}
