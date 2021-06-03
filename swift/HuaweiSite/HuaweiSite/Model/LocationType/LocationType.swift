/*
 Copyright 2021. Huawei Technologies Co., Ltd. All rights reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import Foundation


/// Location Type Constant Struct
public struct LocationType {
    /**
     * ACCOUNTING
     */
    public static var ACCOUNTING = "accounting"
    /**
     * ADDRESS only used for site autocomplete
     */
    public static var ADDRESS = "address"
    /**
     * ADMINISTRATIVE_AREA_LEVEL_1
     */
    public static var ADMINISTRATIVE_AREA_LEVEL_1 = "administrative_area_level_1"
    /**
     * ADMINISTRATIVE_AREA_LEVEL_2
     */
    public static var ADMINISTRATIVE_AREA_LEVEL_2 = "administrative_area_level_2"
    /**
     * ADMINISTRATIVE_AREA_LEVEL_3
     */
    public static var ADMINISTRATIVE_AREA_LEVEL_3 = "administrative_area_level_3"
    /**
     * ADMINISTRATIVE_AREA_LEVEL_4
     */
    public static var ADMINISTRATIVE_AREA_LEVEL_4 = "administrative_area_level_4"
    /**
     * ADMINISTRATIVE_AREA_LEVEL_5
     */
    public static var ADMINISTRATIVE_AREA_LEVEL_5 = "administrative_area_level_5"
    /**
     * AIRPORT
     */
    public static var AIRPORT = "airport"
    /**
     * AMUSEMENT_PARK
     */
    public static var AMUSEMENT_PARK = "amusement_park"
    /**
     * AQUARIUM
     */
    public static var AQUARIUM = "aquarium"
    /**
     * ARCHIPELAGO
     */
    public static var ARCHIPELAGO = "archipelago"
    /**
     * ART_GALLERY
     */
    public static var ART_GALLERY = "art_gallery"
    /**
     * ATM
     */
    public static var ATM = "atm"
    /**
     * BAKERY
     */
    public static var BAKERY = "bakery"
    /**
     * BANK
     */
    public static var BANK = "bank"
    /**
     * BAR
     */
    public static var BAR = "bar"
    /**
     * BEAUTY_SALON
     */
    public static var BEAUTY_SALON = "beauty_salon"
    /**
     * BICYCLE_STORE
     */
    public static var BICYCLE_STORE = "bicycle_store"
    /**
     * BOOK_STORE
     */
    public static var BOOK_STORE = "book_store"
    /**
     * BOWLING_ALLEY
     */
    public static var BOWLING_ALLEY = "bowling_alley"
    /**
     * BUS_STATION
     */
    public static var BUS_STATION = "bus_station"
    /**
     * CAFE
     */
    public static var CAFE = "cafe"
    /**
     * CAMPGROUND
     */
    public static var CAMPGROUND = "campground"
    /**
     * CAPITAL
     */
    public static var CAPITAL = "capital"
    /**
     * CAPITAL_CITY
     */
    public static var CAPITAL_CITY = "capital_city"
    /**
     * CAR_DEALER
     */
    public static var CAR_DEALER = "car_dealer"
    /**
     * CAR_RENTAL
     */
    public static var CAR_RENTAL = "car_rental"
    /**
     * CAR_REPAIR
     */
    public static var CAR_REPAIR = "car_repair"
    /**
     * CAR_WASH
     */
    public static var CAR_WASH = "car_wash"
    /**
     * CASINO
     */
    public static var CASINO = "casino"
    /**
     * CEMETERY
     */
    public static var CEMETERY = "cemetery"
    /**
     * CHURCH
     */
    public static var CHURCH = "church"
    /**
     * CITIES
     */
    public static var CITIES = "cities"
    /**
     * CITY_HALL
     */
    public static var CITY_HALL = "city_hall"
    /**
     * CLOTHING_STORE
     */
    public static var CLOTHING_STORE = "clothing_store"
    /**
     * COLLOQUIAL_AREA
     */
    public static var COLLOQUIAL_AREA = "colloquial_area"
    /**
     * CONTINENT
     */
    public static var CONTINENT = "continent"
    /**
     * CONVENIENCE_STORE
     */
    public static var CONVENIENCE_STORE = "convenience_store"
    /**
     * COUNTRY
     */
    public static var COUNTRY = "country"
    /**
     * COURTHOUSE
     */
    public static var COURTHOUSE = "courthouse"
    /**
     * DENTIST
     */
    public static var DENTIST = "dentist"
    /**
     * DEPARTMENT_STORE
     */
    public static var DEPARTMENT_STORE = "department_store"
    /**
     * DOCTOR
     */
    public static var DOCTOR = "doctor"
    /**
     * DRUGSTORE
     */
    public static var DRUGSTORE = "drugstore"
    /**
     * ELECTRICIAN
     */
    public static var ELECTRICIAN = "electrician"
    /**
     * ELECTRONICS_STORE
     */
    public static var ELECTRONICS_STORE = "electronics_store"
    /**
     * EMBASSY
     */
    public static var EMBASSY = "embassy"
    /**
     * ESTABLISHMENT
     */
    public static var ESTABLISHMENT = "establishment"
    /**
     * FINANCE
     */
    public static var  FINANCE = "finance"
    /**
     * FIRE_STATION
     */
    public static var FIRE_STATION = "fire_station"
    /**
     * FLOOR
     */
    public static var  FLOOR = "floor"
    /**
     * FLORIST
     */
    public static var FLORIST = "florist"
    /**
     * FOOD
     */
    public static var FOOD = "food"
    /**
     * FUNERAL_HOME
     */
    public static var FUNERAL_HOME = "funeral_home"
    /**
     * FURNITURE_STORE
     */
    public static var FURNITURE_STORE = "furniture_store"
    /**
     * GAS_STATION
     */
    public static var GAS_STATION = "gas_station"
    /**
     * GENERAL_CITY
     */
    public static var GENERAL_CITY = "general_city"
    /**
     * GENERAL_CONTRACTOR
     */
    public static var GENERAL_CONTRACTOR = "general_contractor"
    /**
     * GEOCODE
     */
    public static var GEOCODE = "geocode"
    /**
     * GROCERY_OR_SUPERMARKET
     */
    public static var GROCERY_OR_SUPERMARKET = "grocery_or_supermarket"
    /**
     * GYM
     */
    public static var GYM = "gym"
    /**
     * HAIR_CARE
     */
    public static var HAIR_CARE = "hair_care"
    /**
     * HAMLET
     */
    public static var HAMLET = "hamlet"
    /**
     * HARDWARE_STORE
     */
    public static var HARDWARE_STORE = "hardware_store"
    /**
     * HEALTH
     */
    public static var HEALTH = "health"
    /**
     * HINDU_TEMPLE
     */
    public static var HINDU_TEMPLE = "hindu_temple"
    /**
     * HOME_GOODS_STORE
     */
    public static var HOME_GOODS_STORE = "home_goods_store"
    /**
     * HOSPITAL
     */
    public static var HOSPITAL = "hospital"
    /**
     * INSURANCE_AGENCY
     */
    public static var INSURANCE_AGENCY = "insurance_agency"
    /**
     * INTERSECTION
     */
    public static var INTERSECTION = "intersection"
    /**
     * JEWELRY_STORE
     */
    public static var JEWELRY_STORE = "jewelry_store"
    /**
     * LAUNDRY
     */
    public static var LAUNDRY = "laundry"
    /**
     * LAWYER
     */
    public static var LAWYER = "lawyer"
    /**
     * LIBRARY
     */
    public static var LIBRARY = "library"
    /**
     * LIGHT_RAIL_STATION
     */
    public static var LIGHT_RAIL_STATION = "light_rail_station"
    /**
     * LIQUOR_STORE
     */
    public static var LIQUOR_STORE = "liquor_store"
    /**
     * LOCALITY
     */
    public static var LOCALITY = "locality"
    /**
     * LOCAL_GOVERNMENT_OFFICE
     */
    public static var LOCAL_GOVERNMENT_OFFICE = "local_government_office"
    /**
     * LOCKSMITH
     */
    public static var LOCKSMITH = "locksmith"
    /**
     * LODGING
     */
    public static var LODGING = "lodging"
    /**
     * MEAL_DELIVERY
     */
    public static var MEAL_DELIVERY = "meal_delivery"
    /**
     * MEAL_TAKEAWAY
     */
    public static var MEAL_TAKEAWAY = "meal_takeaway"
    /**
     * MOSQUE
     */
    public static var  MOSQUE = "mosque"
    /**
     * MOVIE_RENTAL
     */
    public static var MOVIE_RENTAL = "movie_rental"
    /**
     * MOVIE_THEATER
     */
    public static var MOVIE_THEATER = "movie_theater"
    /**
     * MOVING_COMPANY
     */
    public static var MOVING_COMPANY = "moving_company"
    /**
     * MUSEUM
     */
    public static var MUSEUM = "museum"
    /**
     * NATURAL_FEATURE
     */
    public static var NATURAL_FEATURE = "natural_feature"
    /**
     * NEIGHBORHOOD
     */
    public static var NEIGHBORHOOD = "neighborhood"
    /**
     * NIGHT_CLUB
     */
    public static var NIGHT_CLUB = "night_club"
    /**
     * OTHER
     */
    public static var OTHER = "other"
    /**
     * PAINTER
     */
    public static var PAINTER = "painter"
    /**
     * PARK
     */
    public static var PARK = "park"
    /**
     * PARKING
     */
    public static var PARKING = "parking"
    /**
     * PET_STORE
     */
    public static var PET_STORE = "pet_store"
    /**
     * PHARMACY
     */
    public static var PHARMACY = "pharmacy"
    /**
     * PHYSIOTHERAPIST
     */
    public static var PHYSIOTHERAPIST = "physiotherapist"
    /**
     * PLACE_OF_WORSHIP
     */
    public static var PLACE_OF_WORSHIP = "place_of_worship"
    /**
     * PLUMBER
     */
    public static var PLUMBER = "plumber"
    /**
     * POINT_OF_INTEREST
     */
    public static var POINT_OF_INTEREST = "point_of_interest"
    /**
     * POLICE
     */
    public static var POLICE = "police"
    /**
     * POLITICAL
     */
    public static var POLITICAL = "political"
    /**
     * POSTAL_CODE
     */
    public static var POSTAL_CODE = "postal_code"
    /**
     * POSTAL_CODE_PREFIX
     */
    public static var POSTAL_CODE_PREFIX = "postal_code_prefix"
    /**
     * POSTAL_CODE_SUFFIX
     */
    public static var POSTAL_CODE_SUFFIX = "postal_code_suffix"
    /**
     * POSTAL_TOWN
     */
    public static var POSTAL_TOWN = "postal_town"
    /**
     * POST_BOX
     */
    public static var POST_BOX = "post_box"
    /**
     * POST_OFFICE
     */
    public static var POST_OFFICE = "post_office"
    /**
     * PREMISE
     */
    public static var PREMISE = "premise"
    /**
     * primary_school
     */
    public static var PRIMARY_SCHOOL = "primary_school"
    /**
     * REAL_ESTATE_AGENCY
     */
    public static var REAL_ESTATE_AGENCY = "real_estate_agency"
    /**
     * REGION only used for site autocomplete
     */
    public static var REGION = "region"
    /**
     * REGIONS
     */
    public static var REGIONS = "regions"
    /**
     * RESTAURANT
     */
    public static var RESTAURANT = "restaurant"
    /**
     * ROOFING_CONTRACTOR
     */
    public static var ROOFING_CONTRACTOR = "roofing_contractor"
    /**
     * ROOM
     */
    public static var ROOM = "room"
    /**
     * ROUTE
     */
    public static var ROUTE = "route"
    /**
     * RV_PARK
     */
    public static var RV_PARK = "rv_park"
    /**
     * SCHOOL
     */
    public static var SCHOOL = "school"
    /**
     * SECONDARY_SCHOOL
     */
    public static var SECONDARY_SCHOOL = "secondary_school"
    /**
     * SHOE_STORE
     */
    public static var SHOE_STORE = "shoe_store"
    /**
     * SHOPPING_MALL
     */
    public static var SHOPPING_MALL = "shopping_mall"
    /**
     * SPA
     */
    public static var SPA = "spa"
    /**
     * STADIUM
     */
    public static var STADIUM = "stadium"
    /**
     * STORAGE
     */
    public static var STORAGE = "storage"
    /**
     * STORE
     */
    public static var STORE = "store"
    /**
     * STREET_ADDRESS
     */
    public static var STREET_ADDRESS = "street_address"
    /**
     * STREET_NUMBER
     */
    public static var STREET_NUMBER = "street_number"
    /**
     * SUBLOCALITY
     */
    public static var SUBLOCALITY = "sublocality"
    /**
     * SUBLOCALITY_LEVEL_1
     */
    public static var SUBLOCALITY_LEVEL_1 = "sublocality_level_1"
    /**
     * SUBLOCALITY_LEVEL_2
     */
    public static var SUBLOCALITY_LEVEL_2 = "sublocality_level_2"
    /**
     * SUBLOCALITY_LEVEL_3
     */
    public static var SUBLOCALITY_LEVEL_3 = "sublocality_level_3"
    /**
     * SUBLOCALITY_LEVEL_4
     */
    public static var SUBLOCALITY_LEVEL_4 = "sublocality_level_4"
    /**
     * SUBLOCALITY_LEVEL_5
     */
    public static var SUBLOCALITY_LEVEL_5 = "sublocality_level_5"
    /**
     * SUBPREMISE
     */
    public static var SUBPREMISE = "subpremise"
    /**
     * SUBWAY_STATION
     */
    public static var SUBWAY_STATION = "subway_station"
    /**
     * SUPERMARKET
     */
    public static var SUPERMARKET = "supermarket"
    /**
     * SYNAGOGUE
     */
    public static var SYNAGOGUE = "synagogue"
    /**
     * TAXI_STAND
     */
    public static var TAXI_STAND = "taxi_stand"
    /**
     * TOURIST_ATTRACTION
     */
    public static var TOURIST_ATTRACTION = "tourist_attraction"
    /**
     * TOWN
     */
    public static var TOWN = "town"
    /**
     * TOWN_SQUARE
     */
    public static var TOWN_SQUARE = "town_square"
    /**
     * TRAIN_STATION
     */
    public static var TRAIN_STATION = "train_station"
    /**
     * TRANSIT_STATION
     */
    public static var TRANSIT_STATION = "transit_station"
    /**
     * TRAVEL_AGENCY
     */
    public static var TRAVEL_AGENCY = "travel_agency"
    /**
     * UNIVERSITY
     */
    public static var UNIVERSITY = "university"
    /**
     * VETERINARY_CARE
     */
    public static var VETERINARY_CARE = "veterinary_care"
    /**
     * ZOO
     */
    public static var ZOO = "zoo"
}
