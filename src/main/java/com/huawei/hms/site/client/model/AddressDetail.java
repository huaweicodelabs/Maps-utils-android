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
public class AddressDetail {
    /**
     * Country/Region code, which complies with the ISO 3166-1 alpha-2 standard.
     */
    private String countryCode;

    /**
     * Country name.
     */
    private String country;

    /**
     * Level-1 administrative region in a country, which is generally a province or state.
     */
    private String adminArea;

    /**
     * Level-2 administrative region in a country, which is generally a city.
     */
    private String subAdminArea;

    /**
     * Level-3 administrative region of a country.
     */
    private String tertiaryAdminArea;

    /**
     * District/county to which a place belongs.
     */
    private String subLocality;

    /**
     * Level-3 administrative region in a country, which is generally a county or district.
     */
    private String locality;

    /**
     * Street.
     */
    private String thoroughfare;

    /**
     * Street number.
     */
    private String streetNumber;

    /**
     * Postal code.
     */
    private String postalCode;

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getAdminArea() {
        return adminArea;
    }

    public void setAdminArea(String adminArea) {
        this.adminArea = adminArea;
    }

    public String getSubAdminArea() {
        return subAdminArea;
    }

    public void setSubAdminArea(String subAdminArea) {
        this.subAdminArea = subAdminArea;
    }

    public String getLocality() {
        return locality;
    }

    public void setLocality(String locality) {
        this.locality = locality;
    }

    public String getSubLocality() {
        return subLocality;
    }

    public void setSubLocality(String subLocality) {
        this.subLocality = subLocality;
    }

    public String getThoroughfare() {
        return thoroughfare;
    }

    public void setThoroughfare(String thoroughfare) {
        this.thoroughfare = thoroughfare;
    }

    public String getStreetNumber() {
        return streetNumber;
    }

    public void setStreetNumber(String streetNumber) {
        this.streetNumber = streetNumber;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getTertiaryAdminArea() {
        return tertiaryAdminArea;
    }

    public void setTertiaryAdminArea(String tertiaryAdminArea) {
        this.tertiaryAdminArea = tertiaryAdminArea;
    }
}
