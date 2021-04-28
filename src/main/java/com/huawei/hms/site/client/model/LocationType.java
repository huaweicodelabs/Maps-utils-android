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
 * Location Type Enum
 *
 * @since 2021-01-21
 */
public enum LocationType {
    /**
     * ACCOUNTING
     */
    ACCOUNTING("accounting"),
    /**
     * ADDRESS, only used for site autocomplete
     */
    ADDRESS("address"),
    /**
     * ADMINISTRATIVE_AREA_LEVEL_1
     */
    ADMINISTRATIVE_AREA_LEVEL_1("administrative_area_level_1"),
    /**
     * ADMINISTRATIVE_AREA_LEVEL_2
     */
    ADMINISTRATIVE_AREA_LEVEL_2("administrative_area_level_2"),
    /**
     * ADMINISTRATIVE_AREA_LEVEL_3
     */
    ADMINISTRATIVE_AREA_LEVEL_3("administrative_area_level_3"),
    /**
     * ADMINISTRATIVE_AREA_LEVEL_4
     */
    ADMINISTRATIVE_AREA_LEVEL_4("administrative_area_level_4"),
    /**
     * ADMINISTRATIVE_AREA_LEVEL_5
     */
    ADMINISTRATIVE_AREA_LEVEL_5("administrative_area_level_5"),
    /**
     * AIRPORT
     */
    AIRPORT("airport"),
    /**
     * AMUSEMENT_PARK
     */
    AMUSEMENT_PARK("amusement_park"),
    /**
     * AQUARIUM
     */
    AQUARIUM("aquarium"),
    /**
     * ARCHIPELAGO
     */
    ARCHIPELAGO("archipelago"),
    /**
     * ART_GALLERY
     */
    ART_GALLERY("art_gallery"),
    /**
     * ATM
     */
    ATM("atm"),
    /**
     * BAKERY
     */
    BAKERY("bakery"),
    /**
     * BANK
     */
    BANK("bank"),
    /**
     * BAR
     */
    BAR("bar"),
    /**
     * BEAUTY_SALON
     */
    BEAUTY_SALON("beauty_salon"),
    /**
     * BICYCLE_STORE
     */
    BICYCLE_STORE("bicycle_store"),
    /**
     * BOOK_STORE
     */
    BOOK_STORE("book_store"),
    /**
     * BOWLING_ALLEY
     */
    BOWLING_ALLEY("bowling_alley"),
    /**
     * BUS_STATION
     */
    BUS_STATION("bus_station"),
    /**
     * CAFE
     */
    CAFE("cafe"),
    /**
     * CAMPGROUND
     */
    CAMPGROUND("campground"),
    /**
     * CAPITAL
     */
    CAPITAL("capital"),
    /**
     * CAPITAL_CITY
     */
    CAPITAL_CITY("capital_city"),
    /**
     * CAR_DEALER
     */
    CAR_DEALER("car_dealer"),
    /**
     * CAR_RENTAL
     */
    CAR_RENTAL("car_rental"),
    /**
     * CAR_REPAIR
     */
    CAR_REPAIR("car_repair"),
    /**
     * CAR_WASH
     */
    CAR_WASH("car_wash"),
    /**
     * CASINO
     */
    CASINO("casino"),
    /**
     * CEMETERY
     */
    CEMETERY("cemetery"),
    /**
     * CHURCH
     */
    CHURCH("church"),
    /**
     * CITIES
     */
    CITIES("cities"),
    /**
     * CITY_HALL
     */
    CITY_HALL("city_hall"),
    /**
     * CLOTHING_STORE
     */
    CLOTHING_STORE("clothing_store"),
    /**
     * COLLOQUIAL_AREA
     */
    COLLOQUIAL_AREA("colloquial_area"),
    /**
     * CONTINENT
     */
    CONTINENT("continent"),
    /**
     * CONVENIENCE_STORE
     */
    CONVENIENCE_STORE("convenience_store"),
    /**
     * COUNTRY
     */
    COUNTRY("country"),
    /**
     * COURTHOUSE
     */
    COURTHOUSE("courthouse"),
    /**
     * DENTIST
     */
    DENTIST("dentist"),
    /**
     * DEPARTMENT_STORE
     */
    DEPARTMENT_STORE("department_store"),
    /**
     * DOCTOR
     */
    DOCTOR("doctor"),
    /**
     * DRUGSTORE
     */
    DRUGSTORE("drugstore"),
    /**
     * ELECTRICIAN
     */
    ELECTRICIAN("electrician"),
    /**
     * ELECTRONICS_STORE
     */
    ELECTRONICS_STORE("electronics_store"),
    /**
     * EMBASSY
     */
    EMBASSY("embassy"),
    /**
     * ESTABLISHMENT
     */
    ESTABLISHMENT("establishment"),
    /**
     * FINANCE
     */
    FINANCE("finance"),
    /**
     * FIRE_STATION
     */
    FIRE_STATION("fire_station"),
    /**
     * FLOOR
     */
    FLOOR("floor"),
    /**
     * FLORIST
     */
    FLORIST("florist"),
    /**
     * FOOD
     */
    FOOD("food"),
    /**
     * FUNERAL_HOME
     */
    FUNERAL_HOME("funeral_home"),
    /**
     * FURNITURE_STORE
     */
    FURNITURE_STORE("furniture_store"),
    /**
     * GAS_STATION
     */
    GAS_STATION("gas_station"),
    /**
     * GENERAL_CITY
     */
    GENERAL_CITY("general_city"),
    /**
     * GENERAL_CONTRACTOR
     */
    GENERAL_CONTRACTOR("general_contractor"),
    /**
     * GEOCODE
     */
    GEOCODE("geocode"),
    /**
     * GROCERY_OR_SUPERMARKET
     */
    GROCERY_OR_SUPERMARKET("grocery_or_supermarket"),
    /**
     * GYM
     */
    GYM("gym"),
    /**
     * HAIR_CARE
     */
    HAIR_CARE("hair_care"),
    /**
     * HAMLET
     */
    HAMLET("hamlet"),
    /**
     * HARDWARE_STORE
     */
    HARDWARE_STORE("hardware_store"),
    /**
     * HEALTH
     */
    HEALTH("health"),
    /**
     * HINDU_TEMPLE
     */
    HINDU_TEMPLE("hindu_temple"),
    /**
     * HOME_GOODS_STORE
     */
    HOME_GOODS_STORE("home_goods_store"),
    /**
     * HOSPITAL
     */
    HOSPITAL("hospital"),
    /**
     * INSURANCE_AGENCY
     */
    INSURANCE_AGENCY("insurance_agency"),
    /**
     * INTERSECTION
     */
    INTERSECTION("intersection"),
    /**
     * JEWELRY_STORE
     */
    JEWELRY_STORE("jewelry_store"),
    /**
     * LAUNDRY
     */
    LAUNDRY("laundry"),
    /**
     * LAWYER
     */
    LAWYER("lawyer"),
    /**
     * LIBRARY
     */
    LIBRARY("library"),
    /**
     * LIGHT_RAIL_STATION
     */
    LIGHT_RAIL_STATION("light_rail_station"),
    /**
     * LIQUOR_STORE
     */
    LIQUOR_STORE("liquor_store"),
    /**
     * LOCALITY
     */
    LOCALITY("locality"),
    /**
     * LOCAL_GOVERNMENT_OFFICE
     */
    LOCAL_GOVERNMENT_OFFICE("local_government_office"),
    /**
     * LOCKSMITH
     */
    LOCKSMITH("locksmith"),
    /**
     * LODGING
     */
    LODGING("lodging"),
    /**
     * MEAL_DELIVERY
     */
    MEAL_DELIVERY("meal_delivery"),
    /**
     * MEAL_TAKEAWAY
     */
    MEAL_TAKEAWAY("meal_takeaway"),
    /**
     * MOSQUE
     */
    MOSQUE("mosque"),
    /**
     * MOVIE_RENTAL
     */
    MOVIE_RENTAL("movie_rental"),
    /**
     * MOVIE_THEATER
     */
    MOVIE_THEATER("movie_theater"),
    /**
     * MOVING_COMPANY
     */
    MOVING_COMPANY("moving_company"),
    /**
     * MUSEUM
     */
    MUSEUM("museum"),
    /**
     * NATURAL_FEATURE
     */
    NATURAL_FEATURE("natural_feature"),
    /**
     * NEIGHBORHOOD
     */
    NEIGHBORHOOD("neighborhood"),
    /**
     * NIGHT_CLUB
     */
    NIGHT_CLUB("night_club"),
    /**
     * OTHER
     */
    OTHER("other"),
    /**
     * PAINTER
     */
    PAINTER("painter"),
    /**
     * PARK
     */
    PARK("park"),
    /**
     * PARKING
     */
    PARKING("parking"),
    /**
     * PET_STORE
     */
    PET_STORE("pet_store"),
    /**
     * PHARMACY
     */
    PHARMACY("pharmacy"),
    /**
     * PHYSIOTHERAPIST
     */
    PHYSIOTHERAPIST("physiotherapist"),
    /**
     * PLACE_OF_WORSHIP
     */
    PLACE_OF_WORSHIP("place_of_worship"),
    /**
     * PLUMBER
     */
    PLUMBER("plumber"),
    /**
     * POINT_OF_INTEREST
     */
    POINT_OF_INTEREST("point_of_interest"),
    /**
     * POLICE
     */
    POLICE("police"),
    /**
     * POLITICAL
     */
    POLITICAL("political"),
    /**
     * POSTAL_CODE
     */
    POSTAL_CODE("postal_code"),
    /**
     * POSTAL_CODE_PREFIX
     */
    POSTAL_CODE_PREFIX("postal_code_prefix"),
    /**
     * POSTAL_CODE_SUFFIX
     */
    POSTAL_CODE_SUFFIX("postal_code_suffix"),
    /**
     * POSTAL_TOWN
     */
    POSTAL_TOWN("postal_town"),
    /**
     * POST_BOX
     */
    POST_BOX("post_box"),
    /**
     * POST_OFFICE
     */
    POST_OFFICE("post_office"),
    /**
     * PREMISE
     */
    PREMISE("premise"),
    /**
     * primary_school
     */
    PRIMARY_SCHOOL("primary_school"),
    /**
     * REAL_ESTATE_AGENCY
     */
    REAL_ESTATE_AGENCY("real_estate_agency"),
    /**
     * REGION, only used for site autocomplete
     */
    REGION("region"),
    /**
     * REGIONS
     */
    REGIONS("regions"),
    /**
     * RESTAURANT
     */
    RESTAURANT("restaurant"),
    /**
     * ROOFING_CONTRACTOR
     */
    ROOFING_CONTRACTOR("roofing_contractor"),
    /**
     * ROOM
     */
    ROOM("room"),
    /**
     * ROUTE
     */
    ROUTE("route"),
    /**
     * RV_PARK
     */
    RV_PARK("rv_park"),
    /**
     * SCHOOL
     */
    SCHOOL("school"),
    /**
     * SECONDARY_SCHOOL
     */
    SECONDARY_SCHOOL("secondary_school"),
    /**
     * SHOE_STORE
     */
    SHOE_STORE("shoe_store"),
    /**
     * SHOPPING_MALL
     */
    SHOPPING_MALL("shopping_mall"),
    /**
     * SPA
     */
    SPA("spa"),
    /**
     * STADIUM
     */
    STADIUM("stadium"),
    /**
     * STORAGE
     */
    STORAGE("storage"),
    /**
     * STORE
     */
    STORE("store"),
    /**
     * STREET_ADDRESS
     */
    STREET_ADDRESS("street_address"),
    /**
     * STREET_NUMBER
     */
    STREET_NUMBER("street_number"),
    /**
     * SUBLOCALITY
     */
    SUBLOCALITY("sublocality"),
    /**
     * SUBLOCALITY_LEVEL_1
     */
    SUBLOCALITY_LEVEL_1("sublocality_level_1"),
    /**
     * SUBLOCALITY_LEVEL_2
     */
    SUBLOCALITY_LEVEL_2("sublocality_level_2"),
    /**
     * SUBLOCALITY_LEVEL_3
     */
    SUBLOCALITY_LEVEL_3("sublocality_level_3"),
    /**
     * SUBLOCALITY_LEVEL_4
     */
    SUBLOCALITY_LEVEL_4("sublocality_level_4"),
    /**
     * SUBLOCALITY_LEVEL_5
     */
    SUBLOCALITY_LEVEL_5("sublocality_level_5"),
    /**
     * SUBPREMISE
     */
    SUBPREMISE("subpremise"),
    /**
     * SUBWAY_STATION
     */
    SUBWAY_STATION("subway_station"),
    /**
     * SUPERMARKET
     */
    SUPERMARKET("supermarket"),
    /**
     * SYNAGOGUE
     */
    SYNAGOGUE("synagogue"),
    /**
     * TAXI_STAND
     */
    TAXI_STAND("taxi_stand"),
    /**
     * TOURIST_ATTRACTION
     */
    TOURIST_ATTRACTION("tourist_attraction"),
    /**
     * TOWN
     */
    TOWN("town"),
    /**
     * TOWN_SQUARE
     */
    TOWN_SQUARE("town_square"),
    /**
     * TRAIN_STATION
     */
    TRAIN_STATION("train_station"),
    /**
     * TRANSIT_STATION
     */
    TRANSIT_STATION("transit_station"),
    /**
     * TRAVEL_AGENCY
     */
    TRAVEL_AGENCY("travel_agency"),
    /**
     * UNIVERSITY
     */
    UNIVERSITY("university"),
    /**
     * VETERINARY_CARE
     */
    VETERINARY_CARE("veterinary_care"),
    /**
     * ZOO
     */
    ZOO("zoo");

    private String locType;

    LocationType(String locType) {
        this.locType = locType;
    }

    /**
     * returen value
     *
     * @return responding value
     */
    @Deprecated
    public String value() {
        return locType;
    }

    @Deprecated
    public String getName() {
        return locType;
    }
}
