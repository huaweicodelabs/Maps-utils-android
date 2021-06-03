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

#import "LocationType.h"

@implementation LocationType
/**
 * ACCOUNTING
 */
NSString * const kLT_ACCOUNTING = @"accounting";
/**
 * ADDRESS only used for site autocomplete
 */
NSString * const kLT_ADDRESS = @"address";
/**
 * ADMINISTRATIVE_AREA_LEVEL_1
 */
NSString * const kLT_ADMINISTRATIVE_AREA_LEVEL_1 = @"administrative_area_level_1";
/**
 * ADMINISTRATIVE_AREA_LEVEL_2
 */
NSString * const kLT_ADMINISTRATIVE_AREA_LEVEL_2 = @"administrative_area_level_2";
/**
 * ADMINISTRATIVE_AREA_LEVEL_3
 */
NSString * const kLT_ADMINISTRATIVE_AREA_LEVEL_3 = @"administrative_area_level_3";
/**
 * ADMINISTRATIVE_AREA_LEVEL_4
 */
NSString * const kLT_ADMINISTRATIVE_AREA_LEVEL_4 = @"administrative_area_level_4";
/**
 * ADMINISTRATIVE_AREA_LEVEL_5
 */
NSString * const kLT_ADMINISTRATIVE_AREA_LEVEL_5 = @"administrative_area_level_5";
/**
 * AIRPORT
 */
NSString * const kLT_AIRPORT = @"airport";
/**
 * AMUSEMENT_PARK
 */
NSString * const kLT_AMUSEMENT_PARK = @"amusement_park";
/**
 * AQUARIUM
 */
NSString * const kLT_AQUARIUM = @"aquarium";
/**
 * ARCHIPELAGO
 */
NSString * const kLT_ARCHIPELAGO = @"archipelago";
/**
 * ART_GALLERY
 */
NSString * const kLT_ART_GALLERY = @"art_gallery";
/**
 * ATM
 */
NSString * const kLT_ATM = @"atm";
/**
 * BAKERY
 */
NSString * const kLT_BAKERY = @"bakery";
/**
 * BANK
 */
NSString * const kLT_BANK = @"bank";
/**
 * BAR
 */
NSString * const kLT_BAR = @"bar";
/**
 * BEAUTY_SALON
 */
NSString * const kLT_BEAUTY_SALON = @"beauty_salon";
/**
 * BICYCLE_STORE
 */
NSString * const kLT_BICYCLE_STORE = @"bicycle_store";
/**
 * BOOK_STORE
 */
NSString * const kLT_BOOK_STORE = @"book_store";
/**
 * BOWLING_ALLEY
 */
NSString * const kLT_BOWLING_ALLEY = @"bowling_alley";
/**
 * BUS_STATION
 */
NSString * const kLT_BUS_STATION = @"bus_station";
/**
 * CAFE
 */
NSString * const kLT_CAFE = @"cafe";
/**
 * CAMPGROUND
 */
NSString * const kLT_CAMPGROUND = @"campground";
/**
 * CAPITAL
 */
NSString * const kLT_CAPITAL = @"capital";
/**
 * CAPITAL_CITY
 */
NSString * const kLT_CAPITAL_CITY = @"capital_city";
/**
 * CAR_DEALER
 */
NSString * const kLT_CAR_DEALER = @"car_dealer";
/**
 * CAR_RENTAL
 */
NSString * const kLT_CAR_RENTAL = @"car_rental";
/**
 * CAR_REPAIR
 */
NSString * const kLT_CAR_REPAIR = @"car_repair";
/**
 * CAR_WASH
 */
NSString * const kLT_CAR_WASH = @"car_wash";
/**
 * CASINO
 */
NSString * const kLT_CASINO = @"casino";
/**
 * CEMETERY
 */
NSString * const kLT_CEMETERY = @"cemetery";
/**
 * CHURCH
 */
NSString * const kLT_CHURCH = @"church";
/**
 * CITIES
 */
NSString * const kLT_CITIES = @"cities";
/**
 * CITY_HALL
 */
NSString * const kLT_CITY_HALL = @"city_hall";
/**
 * CLOTHING_STORE
 */
NSString * const kLT_CLOTHING_STORE = @"clothing_store";
/**
 * COLLOQUIAL_AREA
 */
NSString * const kLT_COLLOQUIAL_AREA = @"colloquial_area";
/**
 * CONTINENT
 */
NSString * const kLT_CONTINENT = @"continent";
/**
 * CONVENIENCE_STORE
 */
NSString * const kLT_CONVENIENCE_STORE = @"convenience_store";
/**
 * COUNTRY
 */
NSString * const kLT_COUNTRY = @"country";
/**
 * COURTHOUSE
 */
NSString * const kLT_COURTHOUSE = @"courthouse";
/**
 * DENTIST
 */
NSString * const kLT_DENTIST = @"dentist";
/**
 * DEPARTMENT_STORE
 */
NSString * const kLT_DEPARTMENT_STORE = @"department_store";
/**
 * DOCTOR
 */
NSString * const kLT_DOCTOR = @"doctor";
/**
 * DRUGSTORE
 */
NSString * const kLT_DRUGSTORE = @"drugstore";
/**
 * ELECTRICIAN
 */
NSString * const kLT_ELECTRICIAN = @"electrician";
/**
 * ELECTRONICS_STORE
 */
NSString * const kLT_ELECTRONICS_STORE = @"electronics_store";
/**
 * EMBASSY
 */
NSString * const kLT_EMBASSY = @"embassy";
/**
 * ESTABLISHMENT
 */
NSString * const kLT_ESTABLISHMENT = @"establishment";
/**
 * FINANCE
 */
NSString * const kLT_FINANCE = @"finance";
/**
 * FIRE_STATION
 */
NSString * const kLT_FIRE_STATION = @"fire_station";
/**
 * FLOOR
 */
NSString * const kLT_FLOOR = @"floor";
/**
 * FLORIST
 */
NSString * const kLT_FLORIST = @"florist";
/**
 * FOOD
 */
NSString * const kLT_FOOD = @"food";
/**
 * FUNERAL_HOME
 */
NSString * const kLT_FUNERAL_HOME = @"funeral_home";
/**
 * FURNITURE_STORE
 */
NSString * const kLT_FURNITURE_STORE = @"furniture_store";
/**
 * GAS_STATION
 */
NSString * const kLT_GAS_STATION = @"gas_station";
/**
 * GENERAL_CITY
 */
NSString * const kLT_GENERAL_CITY = @"general_city";
/**
 * GENERAL_CONTRACTOR
 */
NSString * const kLT_GENERAL_CONTRACTOR = @"general_contractor";
/**
 * GEOCODE
 */
NSString * const kLT_GEOCODE = @"geocode";
/**
 * GROCERY_OR_SUPERMARKET
 */
NSString * const kLT_GROCERY_OR_SUPERMARKET = @"grocery_or_supermarket";
/**
 * GYM
 */
NSString * const kLT_GYM = @"gym";
/**
 * HAIR_CARE
 */
NSString * const kLT_HAIR_CARE = @"hair_care";
/**
 * HAMLET
 */
NSString * const kLT_HAMLET = @"hamlet";
/**
 * HARDWARE_STORE
 */
NSString * const kLT_HARDWARE_STORE = @"hardware_store";
/**
 * HEALTH
 */
NSString * const kLT_HEALTH = @"health";
/**
 * HINDU_TEMPLE
 */
NSString * const kLT_HINDU_TEMPLE = @"hindu_temple";
/**
 * HOME_GOODS_STORE
 */
NSString * const kLT_HOME_GOODS_STORE = @"home_goods_store";
/**
 * HOSPITAL
 */
NSString * const kLT_HOSPITAL = @"hospital";
/**
 * INSURANCE_AGENCY
 */
NSString * const kLT_INSURANCE_AGENCY = @"insurance_agency";
/**
 * INTERSECTION
 */
NSString * const kLT_INTERSECTION = @"intersection";
/**
 * JEWELRY_STORE
 */
NSString * const kLT_JEWELRY_STORE = @"jewelry_store";
/**
 * LAUNDRY
 */
NSString * const kLT_LAUNDRY = @"laundry";
/**
 * LAWYER
 */
NSString * const kLT_LAWYER = @"lawyer";
/**
 * LIBRARY
 */
NSString * const kLT_LIBRARY = @"library";
/**
 * LIGHT_RAIL_STATION
 */
NSString * const kLT_LIGHT_RAIL_STATION = @"light_rail_station";
/**
 * LIQUOR_STORE
 */
NSString * const kLT_LIQUOR_STORE = @"liquor_store";
/**
 * LOCALITY
 */
NSString * const kLT_LOCALITY = @"locality";
/**
 * LOCAL_GOVERNMENT_OFFICE
 */
NSString * const kLT_LOCAL_GOVERNMENT_OFFICE = @"local_government_office";
/**
 * LOCKSMITH
 */
NSString * const kLT_LOCKSMITH = @"locksmith";
/**
 * LODGING
 */
NSString * const kLT_LODGING = @"lodging";
/**
 * MEAL_DELIVERY
 */
NSString * const kLT_MEAL_DELIVERY = @"meal_delivery";
/**
 * MEAL_TAKEAWAY
 */
NSString * const kLT_MEAL_TAKEAWAY = @"meal_takeaway";
/**
 * MOSQUE
 */
NSString * const kLT_MOSQUE = @"mosque";
/**
 * MOVIE_RENTAL
 */
NSString * const kLT_MOVIE_RENTAL = @"movie_rental";
/**
 * MOVIE_THEATER
 */
NSString * const kLT_MOVIE_THEATER = @"movie_theater";
/**
 * MOVING_COMPANY
 */
NSString * const kLT_MOVING_COMPANY = @"moving_company";
/**
 * MUSEUM
 */
NSString * const kLT_MUSEUM = @"museum";
/**
 * NATURAL_FEATURE
 */
NSString * const kLT_NATURAL_FEATURE = @"natural_feature";
/**
 * NEIGHBORHOOD
 */
NSString * const kLT_NEIGHBORHOOD = @"neighborhood";
/**
 * NIGHT_CLUB
 */
NSString * const kLT_NIGHT_CLUB = @"night_club";
/**
 * OTHER
 */
NSString * const kLT_OTHER = @"other";
/**
 * PAINTER
 */
NSString * const kLT_PAINTER = @"painter";
/**
 * PARK
 */
NSString * const kLT_PARK = @"park";
/**
 * PARKING
 */
NSString * const kLT_PARKING = @"parking";
/**
 * PET_STORE
 */
NSString * const kLT_PET_STORE = @"pet_store";
/**
 * PHARMACY
 */
NSString * const kLT_PHARMACY = @"pharmacy";
/**
 * PHYSIOTHERAPIST
 */
NSString * const kLT_PHYSIOTHERAPIST = @"physiotherapist";
/**
 * PLACE_OF_WORSHIP
 */
NSString * const kLT_PLACE_OF_WORSHIP = @"place_of_worship";
/**
 * PLUMBER
 */
NSString * const kLT_PLUMBER = @"plumber";
/**
 * POINT_OF_INTEREST
 */
NSString * const kLT_POINT_OF_INTEREST = @"point_of_interest";
/**
 * POLICE
 */
NSString * const kLT_POLICE = @"police";
/**
 * POLITICAL
 */
NSString * const kLT_POLITICAL = @"political";
/**
 * POSTAL_CODE
 */
NSString * const kLT_POSTAL_CODE = @"postal_code";
/**
 * POSTAL_CODE_PREFIX
 */
NSString * const kLT_POSTAL_CODE_PREFIX = @"postal_code_prefix";
/**
 * POSTAL_CODE_SUFFIX
 */
NSString * const kLT_POSTAL_CODE_SUFFIX = @"postal_code_suffix";
/**
 * POSTAL_TOWN
 */
NSString * const kLT_POSTAL_TOWN = @"postal_town";
/**
 * POST_BOX
 */
NSString * const kLT_POST_BOX = @"post_box";
/**
 * POST_OFFICE
 */
NSString * const kLT_POST_OFFICE = @"post_office";
/**
 * PREMISE
 */
NSString * const kLT_PREMISE = @"premise";
/**
 * primary_school
 */
NSString * const kLT_PRIMARY_SCHOOL = @"primary_school";
/**
 * REAL_ESTATE_AGENCY
 */
NSString * const kLT_REAL_ESTATE_AGENCY = @"real_estate_agency";
/**
 * REGION only used for site autocomplete
 */
NSString * const kLT_REGION = @"region";
/**
 * REGIONS
 */
NSString * const kLT_REGIONS = @"regions";
/**
 * RESTAURANT
 */
NSString * const kLT_RESTAURANT = @"restaurant";
/**
 * ROOFING_CONTRACTOR
 */
NSString * const kLT_ROOFING_CONTRACTOR = @"roofing_contractor";
/**
 * ROOM
 */
NSString * const kLT_ROOM = @"room";
/**
 * ROUTE
 */
NSString * const kLT_ROUTE = @"route";
/**
 * RV_PARK
 */
NSString * const kLT_RV_PARK = @"rv_park";
/**
 * SCHOOL
 */
NSString * const kLT_SCHOOL = @"school";
/**
 * SECONDARY_SCHOOL
 */
NSString * const kLT_SECONDARY_SCHOOL = @"secondary_school";
/**
 * SHOE_STORE
 */
NSString * const kLT_SHOE_STORE = @"shoe_store";
/**
 * SHOPPING_MALL
 */
NSString * const kLT_SHOPPING_MALL = @"shopping_mall";
/**
 * SPA
 */
NSString * const kLT_SPA = @"spa";
/**
 * STADIUM
 */
NSString * const kLT_STADIUM = @"stadium";
/**
 * STORAGE
 */
NSString * const kLT_STORAGE = @"storage";
/**
 * STORE
 */
NSString * const kLT_STORE = @"store";
/**
 * STREET_ADDRESS
 */
NSString * const kLT_STREET_ADDRESS = @"street_address";
/**
 * STREET_NUMBER
 */
NSString * const kLT_STREET_NUMBER = @"street_number";
/**
 * SUBLOCALITY
 */
NSString * const kLT_SUBLOCALITY = @"sublocality";
/**
 * SUBLOCALITY_LEVEL_1
 */
NSString * const kLT_SUBLOCALITY_LEVEL_1 = @"sublocality_level_1";
/**
 * SUBLOCALITY_LEVEL_2
 */
NSString * const kLT_SUBLOCALITY_LEVEL_2 = @"sublocality_level_2";
/**
 * SUBLOCALITY_LEVEL_3
 */
NSString * const kLT_SUBLOCALITY_LEVEL_3 = @"sublocality_level_3";
/**
 * SUBLOCALITY_LEVEL_4
 */
NSString * const kLT_SUBLOCALITY_LEVEL_4 = @"sublocality_level_4";
/**
 * SUBLOCALITY_LEVEL_5
 */
NSString * const kLT_SUBLOCALITY_LEVEL_5 = @"sublocality_level_5";
/**
 * SUBPREMISE
 */
NSString * const kLT_SUBPREMISE = @"subpremise";
/**
 * SUBWAY_STATION
 */
NSString * const kLT_SUBWAY_STATION = @"subway_station";
/**
 * SUPERMARKET
 */
NSString * const kLT_SUPERMARKET = @"supermarket";
/**
 * SYNAGOGUE
 */
NSString * const kLT_SYNAGOGUE = @"synagogue";
/**
 * TAXI_STAND
 */
NSString * const kLT_TAXI_STAND = @"taxi_stand";
/**
 * TOURIST_ATTRACTION
 */
NSString * const kLT_TOURIST_ATTRACTION = @"tourist_attraction";
/**
 * TOWN
 */
NSString * const kLT_TOWN = @"town";
/**
 * TOWN_SQUARE
 */
NSString * const kLT_TOWN_SQUARE = @"town_square";
/**
 * TRAIN_STATION
 */
NSString * const kLT_TRAIN_STATION = @"train_station";
/**
 * TRANSIT_STATION
 */
NSString * const kLT_TRANSIT_STATION = @"transit_station";
/**
 * TRAVEL_AGENCY
 */
NSString * const kLT_TRAVEL_AGENCY = @"travel_agency";
/**
 * UNIVERSITY
 */
NSString * const kLT_UNIVERSITY = @"university";
/**
 * VETERINARY_CARE
 */
NSString * const kLT_VETERINARY_CARE = @"veterinary_care";
/**
 * ZOO
 */
NSString * const kLT_ZOO = @"zoo";
@end
