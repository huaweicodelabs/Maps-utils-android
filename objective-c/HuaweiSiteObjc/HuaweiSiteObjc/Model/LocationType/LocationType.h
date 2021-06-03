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
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Location Type Constants
@interface LocationType : NSObject
/**
 * ACCOUNTING
 */
extern NSString * const kLT_ACCOUNTING;
/**
 * ADDRESS only used for site autocomplete
 */
extern NSString * const kLT_ADDRESS;
/**
 * ADMINISTRATIVE_AREA_LEVEL_1
 */
extern NSString * const kLT_ADMINISTRATIVE_AREA_LEVEL_1;
/**
 * ADMINISTRATIVE_AREA_LEVEL_2
 */
extern NSString * const kLT_ADMINISTRATIVE_AREA_LEVEL_2;
/**
 * ADMINISTRATIVE_AREA_LEVEL_3
 */
extern NSString * const kLT_ADMINISTRATIVE_AREA_LEVEL_3;
/**
 * ADMINISTRATIVE_AREA_LEVEL_4
 */
extern NSString * const kLT_ADMINISTRATIVE_AREA_LEVEL_4;
/**
 * ADMINISTRATIVE_AREA_LEVEL_5
 */
extern NSString * const kLT_ADMINISTRATIVE_AREA_LEVEL_5;
/**
 * AIRPORT
 */
extern NSString * const kLT_AIRPORT;
/**
 * AMUSEMENT_PARK
 */
extern NSString * const kLT_AMUSEMENT_PARK;
/**
 * AQUARIUM
 */
extern NSString * const kLT_AQUARIUM;
/**
 * ARCHIPELAGO
 */
extern NSString * const kLT_ARCHIPELAGO;
/**
 * ART_GALLERY
 */
extern NSString * const kLT_ART_GALLERY;
/**
 * ATM
 */
extern NSString * const kLT_ATM;
/**
 * BAKERY
 */
extern NSString * const kLT_BAKERY;
/**
 * BANK
 */
extern NSString * const kLT_BANK;
/**
 * BAR
 */
extern NSString * const kLT_BAR;
/**
 * BEAUTY_SALON
 */
extern NSString * const kLT_BEAUTY_SALON;
/**
 * BICYCLE_STORE
 */
extern NSString * const kLT_BICYCLE_STORE;
/**
 * BOOK_STORE
 */
extern NSString * const kLT_BOOK_STORE;
/**
 * BOWLING_ALLEY
 */
extern NSString * const kLT_BOWLING_ALLEY;
/**
 * BUS_STATION
 */
extern NSString * const kLT_BUS_STATION;
/**
 * CAFE
 */
extern NSString * const kLT_CAFE;
/**
 * CAMPGROUND
 */
extern NSString * const kLT_CAMPGROUND;
/**
 * CAPITAL
 */
extern NSString * const kLT_CAPITAL;
/**
 * CAPITAL_CITY
 */
extern NSString * const kLT_CAPITAL_CITY;
/**
 * CAR_DEALER
 */
extern NSString * const kLT_CAR_DEALER;
/**
 * CAR_RENTAL
 */
extern NSString * const kLT_CAR_RENTAL;
/**
 * CAR_REPAIR
 */
extern NSString * const kLT_CAR_REPAIR;
/**
 * CAR_WASH
 */
extern NSString * const kLT_CAR_WASH;
/**
 * CASINO
 */
extern NSString * const kLT_CASINO;
/**
 * CEMETERY
 */
extern NSString * const kLT_CEMETERY;
/**
 * CHURCH
 */
extern NSString * const kLT_CHURCH;
/**
 * CITIES
 */
extern NSString * const kLT_CITIES;
/**
 * CITY_HALL
 */
extern NSString * const kLT_CITY_HALL;
/**
 * CLOTHING_STORE
 */
extern NSString * const kLT_CLOTHING_STORE;
/**
 * COLLOQUIAL_AREA
 */
extern NSString * const kLT_COLLOQUIAL_AREA;
/**
 * CONTINENT
 */
extern NSString * const kLT_CONTINENT;
/**
 * CONVENIENCE_STORE
 */
extern NSString * const kLT_CONVENIENCE_STORE;
/**
 * COUNTRY
 */
extern NSString * const kLT_COUNTRY;
/**
 * COURTHOUSE
 */
extern NSString * const kLT_COURTHOUSE;
/**
 * DENTIST
 */
extern NSString * const kLT_DENTIST;
/**
 * DEPARTMENT_STORE
 */
extern NSString * const kLT_DEPARTMENT_STORE;
/**
 * DOCTOR
 */
extern NSString * const kLT_DOCTOR;
/**
 * DRUGSTORE
 */
extern NSString * const kLT_DRUGSTORE;
/**
 * ELECTRICIAN
 */
extern NSString * const kLT_ELECTRICIAN;
/**
 * ELECTRONICS_STORE
 */
extern NSString * const kLT_ELECTRONICS_STORE;
/**
 * EMBASSY
 */
extern NSString * const kLT_EMBASSY;
/**
 * ESTABLISHMENT
 */
extern NSString * const kLT_ESTABLISHMENT;
/**
 * FINANCE
 */
extern NSString * const kLT_FINANCE;
/**
 * FIRE_STATION
 */
extern NSString * const kLT_FIRE_STATION;
/**
 * FLOOR
 */
extern NSString * const kLT_FLOOR;
/**
 * FLORIST
 */
extern NSString * const kLT_FLORIST;
/**
 * FOOD
 */
extern NSString * const kLT_FOOD;
/**
 * FUNERAL_HOME
 */
extern NSString * const kLT_FUNERAL_HOME;
/**
 * FURNITURE_STORE
 */
extern NSString * const kLT_FURNITURE_STORE;
/**
 * GAS_STATION
 */
extern NSString * const kLT_GAS_STATION;
/**
 * GENERAL_CITY
 */
extern NSString * const kLT_GENERAL_CITY;
/**
 * GENERAL_CONTRACTOR
 */
extern NSString * const kLT_GENERAL_CONTRACTOR;
/**
 * GEOCODE
 */
extern NSString * const kLT_GEOCODE;
/**
 * GROCERY_OR_SUPERMARKET
 */
extern NSString * const kLT_GROCERY_OR_SUPERMARKET;
/**
 * GYM
 */
extern NSString * const kLT_GYM;
/**
 * HAIR_CARE
 */
extern NSString * const kLT_HAIR_CARE;
/**
 * HAMLET
 */
extern NSString * const kLT_HAMLET;
/**
 * HARDWARE_STORE
 */
extern NSString * const kLT_HARDWARE_STORE;
/**
 * HEALTH
 */
extern NSString * const kLT_HEALTH;
/**
 * HINDU_TEMPLE
 */
extern NSString * const kLT_HINDU_TEMPLE;
/**
 * HOME_GOODS_STORE
 */
extern NSString * const kLT_HOME_GOODS_STORE;
/**
 * HOSPITAL
 */
extern NSString * const kLT_HOSPITAL;
/**
 * INSURANCE_AGENCY
 */
extern NSString * const kLT_INSURANCE_AGENCY;
/**
 * INTERSECTION
 */
extern NSString * const kLT_INTERSECTION;
/**
 * JEWELRY_STORE
 */
extern NSString * const kLT_JEWELRY_STORE;
/**
 * LAUNDRY
 */
extern NSString * const kLT_LAUNDRY;
/**
 * LAWYER
 */
extern NSString * const kLT_LAWYER;
/**
 * LIBRARY
 */
extern NSString * const kLT_LIBRARY;
/**
 * LIGHT_RAIL_STATION
 */
extern NSString * const kLT_LIGHT_RAIL_STATION;
/**
 * LIQUOR_STORE
 */
extern NSString * const kLT_LIQUOR_STORE;
/**
 * LOCALITY
 */
extern NSString * const kLT_LOCALITY;
/**
 * LOCAL_GOVERNMENT_OFFICE
 */
extern NSString * const kLT_LOCAL_GOVERNMENT_OFFICE;
/**
 * LOCKSMITH
 */
extern NSString * const kLT_LOCKSMITH;
/**
 * LODGING
 */
extern NSString * const kLT_LODGING;
/**
 * MEAL_DELIVERY
 */
extern NSString * const kLT_MEAL_DELIVERY;
/**
 * MEAL_TAKEAWAY
 */
extern NSString * const kLT_MEAL_TAKEAWAY;
/**
 * MOSQUE
 */
extern NSString * const kLT_MOSQUE;
/**
 * MOVIE_RENTAL
 */
extern NSString * const kLT_MOVIE_RENTAL;
/**
 * MOVIE_THEATER
 */
extern NSString * const kLT_MOVIE_THEATER;
/**
 * MOVING_COMPANY
 */
extern NSString * const kLT_MOVING_COMPANY;
/**
 * MUSEUM
 */
extern NSString * const kLT_MUSEUM;
/**
 * NATURAL_FEATURE
 */
extern NSString * const kLT_NATURAL_FEATURE;
/**
 * NEIGHBORHOOD
 */
extern NSString * const kLT_NEIGHBORHOOD;
/**
 * NIGHT_CLUB
 */
extern NSString * const kLT_NIGHT_CLUB;
/**
 * OTHER
 */
extern NSString * const kLT_OTHER;
/**
 * PAINTER
 */
extern NSString * const kLT_PAINTER;
/**
 * PARK
 */
extern NSString * const kLT_PARK;
/**
 * PARKING
 */
extern NSString * const kLT_PARKING;
/**
 * PET_STORE
 */
extern NSString * const kLT_PET_STORE;
/**
 * PHARMACY
 */
extern NSString * const kLT_PHARMACY;
/**
 * PHYSIOTHERAPIST
 */
extern NSString * const kLT_PHYSIOTHERAPIST;
/**
 * PLACE_OF_WORSHIP
 */
extern NSString * const kLT_PLACE_OF_WORSHIP;
/**
 * PLUMBER
 */
extern NSString * const kLT_PLUMBER;
/**
 * POINT_OF_INTEREST
 */
extern NSString * const kLT_POINT_OF_INTEREST;
/**
 * POLICE
 */
extern NSString * const kLT_POLICE;
/**
 * POLITICAL
 */
extern NSString * const kLT_POLITICAL;
/**
 * POSTAL_CODE
 */
extern NSString * const kLT_POSTAL_CODE;
/**
 * POSTAL_CODE_PREFIX
 */
extern NSString * const kLT_POSTAL_CODE_PREFIX;
/**
 * POSTAL_CODE_SUFFIX
 */
extern NSString * const kLT_POSTAL_CODE_SUFFIX;
/**
 * POSTAL_TOWN
 */
extern NSString * const kLT_POSTAL_TOWN;
/**
 * POST_BOX
 */
extern NSString * const kLT_POST_BOX;
/**
 * POST_OFFICE
 */
extern NSString * const kLT_POST_OFFICE;
/**
 * PREMISE
 */
extern NSString * const kLT_PREMISE;
/**
 * primary_school
 */
extern NSString * const kLT_PRIMARY_SCHOOL;
/**
 * REAL_ESTATE_AGENCY
 */
extern NSString * const kLT_REAL_ESTATE_AGENCY;
/**
 * REGION only used for site autocomplete
 */
extern NSString * const kLT_REGION;
/**
 * REGIONS
 */
extern NSString * const kLT_REGIONS;
/**
 * RESTAURANT
 */
extern NSString * const kLT_RESTAURANT;
/**
 * ROOFING_CONTRACTOR
 */
extern NSString * const kLT_ROOFING_CONTRACTOR;
/**
 * ROOM
 */
extern NSString * const kLT_ROOM;
/**
 * ROUTE
 */
extern NSString * const kLT_ROUTE;
/**
 * RV_PARK
 */
extern NSString * const kLT_RV_PARK;
/**
 * SCHOOL
 */
extern NSString * const kLT_SCHOOL;
/**
 * SECONDARY_SCHOOL
 */
extern NSString * const kLT_SECONDARY_SCHOOL;
/**
 * SHOE_STORE
 */
extern NSString * const kLT_SHOE_STORE;
/**
 * SHOPPING_MALL
 */
extern NSString * const kLT_SHOPPING_MALL;
/**
 * SPA
 */
extern NSString * const kLT_SPA;
/**
 * STADIUM
 */
extern NSString * const kLT_STADIUM;
/**
 * STORAGE
 */
extern NSString * const kLT_STORAGE;
/**
 * STORE
 */
extern NSString * const kLT_STORE;
/**
 * STREET_ADDRESS
 */
extern NSString * const kLT_STREET_ADDRESS;
/**
 * STREET_NUMBER
 */
extern NSString * const kLT_STREET_NUMBER;
/**
 * SUBLOCALITY
 */
extern NSString * const kLT_SUBLOCALITY;
/**
 * SUBLOCALITY_LEVEL_1
 */
extern NSString * const kLT_SUBLOCALITY_LEVEL_1;
/**
 * SUBLOCALITY_LEVEL_2
 */
extern NSString * const kLT_SUBLOCALITY_LEVEL_2;
/**
 * SUBLOCALITY_LEVEL_3
 */
extern NSString * const kLT_SUBLOCALITY_LEVEL_3;
/**
 * SUBLOCALITY_LEVEL_4
 */
extern NSString * const kLT_SUBLOCALITY_LEVEL_4;
/**
 * SUBLOCALITY_LEVEL_5
 */
extern NSString * const kLT_SUBLOCALITY_LEVEL_5;
/**
 * SUBPREMISE
 */
extern NSString * const kLT_SUBPREMISE;
/**
 * SUBWAY_STATION
 */
extern NSString * const kLT_SUBWAY_STATION;
/**
 * SUPERMARKET
 */
extern NSString * const kLT_SUPERMARKET;
/**
 * SYNAGOGUE
 */
extern NSString * const kLT_SYNAGOGUE;
/**
 * TAXI_STAND
 */
extern NSString * const kLT_TAXI_STAND;
/**
 * TOURIST_ATTRACTION
 */
extern NSString * const kLT_TOURIST_ATTRACTION;
/**
 * TOWN
 */
extern NSString * const kLT_TOWN;
/**
 * TOWN_SQUARE
 */
extern NSString * const kLT_TOWN_SQUARE;
/**
 * TRAIN_STATION
 */
extern NSString * const kLT_TRAIN_STATION;
/**
 * TRANSIT_STATION
 */
extern NSString * const kLT_TRANSIT_STATION;
/**
 * TRAVEL_AGENCY
 */
extern NSString * const kLT_TRAVEL_AGENCY;
/**
 * UNIVERSITY
 */
extern NSString * const kLT_UNIVERSITY;
/**
 * VETERINARY_CARE
 */
extern NSString * const kLT_VETERINARY_CARE;
/**
 * ZOO
 */
extern NSString * const kLT_ZOO;

@end

NS_ASSUME_NONNULL_END
