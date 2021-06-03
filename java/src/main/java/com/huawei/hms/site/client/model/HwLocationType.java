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
 * Hw Location Type Enum
 *
 * @since 2021-01-21
 */
public enum HwLocationType {
    /**
     * EATING_DRINKING
     */
    EATING_DRINKING("eating_drinking"),
    /**
     * RESTAURANT
     **/
    RESTAURANT("restaurant"),
    /**
     * AFRICAN_RESTAURANT
     **/
    AFRICAN_RESTAURANT("african_restaurant"),
    /**
     * AMERICAN_RESTAURANT
     **/
    AMERICAN_RESTAURANT("american_restaurant"),
    /**
     * AUSTRIAN_RESTAURANT
     **/
    AUSTRIAN_RESTAURANT("austrian_restaurant"),
    /**
     * BARBECUE_RESTAURANT
     **/
    BARBECUE_RESTAURANT("barbecue_restaurant"),
    /**
     * BELGIAN_RESTAURANT
     **/
    BELGIAN_RESTAURANT("belgian_restaurant"),
    /**
     * BISTRO
     **/
    BISTRO("bistro"),
    /**
     * BRITISH_RESTAURANT
     **/
    BRITISH_RESTAURANT("british_restaurant"),
    /**
     * CALIFORNIAN_RESTAURANT
     **/
    CALIFORNIAN_RESTAURANT("californian_restaurant"),
    /**
     * CANADIAN_RESTAURANT
     **/
    CANADIAN_RESTAURANT("canadian_restaurant"),
    /**
     * CARIBBEAN_RESTAURANT
     **/
    CARIBBEAN_RESTAURANT("caribbean_restaurant"),
    /**
     * CHINESE_RESTAURANT
     **/
    CHINESE_RESTAURANT("chinese_restaurant"),
    /**
     * CREPERIE
     **/
    CREPERIE("creperie"),
    /**
     * DUTCH_RESTAURANT
     **/
    DUTCH_RESTAURANT("dutch_restaurant"),
    /**
     * FAST_FOOD_RESTAURANT
     **/
    FAST_FOOD_RESTAURANT("fast_food_restaurant"),
    /**
     * FILIPINO_RESTAURANT
     **/
    FILIPINO_RESTAURANT("filipino_restaurant"),
    /**
     * FRENCH_RESTAURANT
     **/
    FRENCH_RESTAURANT("french_restaurant"),
    /**
     * GERMAN_RESTAURANT
     **/
    GERMAN_RESTAURANT("german_restaurant"),
    /**
     * GREEK_RESTAURANT
     **/
    GREEK_RESTAURANT("greek_restaurant"),
    /**
     * GRILL
     **/
    GRILL("grill"),
    /**
     * HUNGARIAN_RESTAURANT
     **/
    HUNGARIAN_RESTAURANT("hungarian_restaurant"),
    /**
     * INDIAN_RESTAURANT
     **/
    INDIAN_RESTAURANT("indian_restaurant"),
    /**
     * INDONESIAN_RESTAURANT
     **/
    INDONESIAN_RESTAURANT("indonesian_restaurant"),
    /**
     * ITALIAN_RESTAURANT
     **/
    ITALIAN_RESTAURANT("italian_restaurant"),
    /**
     * JAPANESE_RESTAURANT
     **/
    JAPANESE_RESTAURANT("japanese_restaurant"),
    /**
     * JEWISH_RESTAURANT
     **/
    JEWISH_RESTAURANT("jewish_restaurant"),
    /**
     * KOREAN_RESTAURANT
     **/
    KOREAN_RESTAURANT("korean_restaurant"),
    /**
     * LATIN_AMERICAN_RESTAURANT
     **/
    LATIN_AMERICAN_RESTAURANT("latin_american_restaurant"),
    /**
     * LEBANESE_RESTAURANT
     **/
    LEBANESE_RESTAURANT("lebanese_restaurant"),
    /**
     * MALTESE_RESTAURANT
     **/
    MALTESE_RESTAURANT("maltese_restaurant"),
    /**
     * MEDITERRANEAN_RESTAURANT
     **/
    MEDITERRANEAN_RESTAURANT("mediterranean_restaurant"),
    /**
     * MEXICAN_RESTAURANT
     **/
    MEXICAN_RESTAURANT("mexican_restaurant"),
    /**
     * MIDDLE_EASTERN_RESTAURANT
     **/
    MIDDLE_EASTERN_RESTAURANT("middle_eastern_restaurant"),
    /**
     * ORIENTAL_RESTAURANT
     **/
    ORIENTAL_RESTAURANT("oriental_restaurant"),
    /**
     * PIZZA_RESTAURANT
     **/
    PIZZA_RESTAURANT("pizza_restaurant"),
    /**
     * POLISH_RESTAURANT
     **/
    POLISH_RESTAURANT("polish_restaurant"),
    /**
     * PORTUGUESE_RESTAURANT
     **/
    PORTUGUESE_RESTAURANT("portuguese_restaurant"),
    /**
     * PUB_FOOD
     **/
    PUB_FOOD("pub_food"),
    /**
     * RUSSIAN_RESTAURANT
     **/
    RUSSIAN_RESTAURANT("russian_restaurant"),
    /**
     * ROADSIDE
     **/
    ROADSIDE("roadside"),
    /**
     * SANDWICH_RESTAURANT
     **/
    SANDWICH_RESTAURANT("sandwich_restaurant"),
    /**
     * SEAFOOD_RESTAURANT
     **/
    SEAFOOD_RESTAURANT("seafood_restaurant"),
    /**
     * SPANISH_RESTAURANT
     **/
    SPANISH_RESTAURANT("spanish_restaurant"),
    /**
     * STEAK_HOUSE
     **/
    STEAK_HOUSE("steak_house"),
    /**
     * SURINAMESE_RESTAURANT
     **/
    SURINAMESE_RESTAURANT("surinamese_restaurant"),
    /**
     * SWISS_RESTAURANT
     **/
    SWISS_RESTAURANT("swiss_restaurant"),
    /**
     * THAI_RESTAURANT
     **/
    THAI_RESTAURANT("thai_restaurant"),
    /**
     * TURKISH_RESTAURANT
     **/
    TURKISH_RESTAURANT("turkish_restaurant"),
    /**
     * VEGETARIAN_RESTAURANT
     **/
    VEGETARIAN_RESTAURANT("vegetarian_restaurant"),
    /**
     * VIETNAMESE_RESTAURANT
     **/
    VIETNAMESE_RESTAURANT("vietnamese_restaurant"),
    /**
     * HUNAN_RESTAURANT
     **/
    HUNAN_RESTAURANT("hunan_restaurant"),
    /**
     * SHANDONG_RESTAURANT
     **/
    SHANDONG_RESTAURANT("shandong_restaurant"),
    /**
     * GUANGDONG_RESTAURANT
     **/
    GUANGDONG_RESTAURANT("guangdong_restaurant"),
    /**
     * SHANGHAI_RESTAURANT
     **/
    SHANGHAI_RESTAURANT("shanghai_restaurant"),
    /**
     * SICHUAN_RESTAURANT
     **/
    SICHUAN_RESTAURANT("sichuan_restaurant"),
    /**
     * DONGBEI_RESTAURANT
     **/
    DONGBEI_RESTAURANT("dongbei_restaurant"),
    /**
     * HOT_POT_RESTAURANT
     **/
    HOT_POT_RESTAURANT("hot_pot_restaurant"),
    /**
     * TAIWANESE_RESTAURANT
     **/
    TAIWANESE_RESTAURANT("taiwanese_restaurant"),
    /**
     * WESTERN_RESTAURANT
     **/
    WESTERN_RESTAURANT("western_restaurant"),
    /**
     * PERUVIAN_RESTAURANT
     **/
    PERUVIAN_RESTAURANT("peruvian_restaurant"),
    /**
     * ASIAN_RESTAURANT
     **/
    ASIAN_RESTAURANT("asian_restaurant"),
    /**
     * CREOLE_CAJUN_RESTAURANT
     **/
    CREOLE_CAJUN_RESTAURANT("creole_cajun_restaurant"),
    /**
     * SOUL_FOOD_RESTAURANT
     **/
    SOUL_FOOD_RESTAURANT("soul_food_restaurant"),
    /**
     * IRISH_RESTAURANT
     **/
    IRISH_RESTAURANT("irish_restaurant"),
    /**
     * JAMAICAN_RESTAURANT
     **/
    JAMAICAN_RESTAURANT("jamaican_restaurant"),
    /**
     * KOSHER_RESTAURANT
     **/
    KOSHER_RESTAURANT("kosher_restaurant"),
    /**
     * CZECH_RESTAURANT
     **/
    CZECH_RESTAURANT("czech_restaurant"),
    /**
     * HAMBURGER_RESTAURANT
     **/
    HAMBURGER_RESTAURANT("hamburger_restaurant"),
    /**
     * CHICKEN_RESTAURANT
     **/
    CHICKEN_RESTAURANT("chicken_restaurant"),
    /**
     * FUSION_RESTAURANT
     **/
    FUSION_RESTAURANT("fusion_restaurant"),
    /**
     * BRAZILIAN_RESTAURANT
     **/
    BRAZILIAN_RESTAURANT("brazilian_restaurant"),
    /**
     * INTERNATIONAL_RESTAURANT
     **/
    INTERNATIONAL_RESTAURANT("international_restaurant"),
    /**
     * MOROCCAN_RESTAURANT
     **/
    MOROCCAN_RESTAURANT("moroccan_restaurant"),
    /**
     * ORGANIC_RESTAURANT
     **/
    ORGANIC_RESTAURANT("organic_restaurant"),
    /**
     * TAPAS_RESTAURANT
     **/
    TAPAS_RESTAURANT("tapas_restaurant"),
    /**
     * ICE_CREAM_PARLOR
     **/
    ICE_CREAM_PARLOR("ice_cream_parlor"),
    /**
     * DOUGHNUT_SHOP
     **/
    DOUGHNUT_SHOP("doughnut_shop"),
    /**
     * SLOVAK_RESTAURANT
     **/
    SLOVAK_RESTAURANT("slovak_restaurant"),
    /**
     * AFGHAN_RESTAURANT
     **/
    AFGHAN_RESTAURANT("afghan_restaurant"),
    /**
     * ALGERIAN_RESTAURANT
     **/
    ALGERIAN_RESTAURANT("algerian_restaurant"),
    /**
     * ARABIAN_RESTAURANT
     **/
    ARABIAN_RESTAURANT("arabian_restaurant"),
    /**
     * ARGENTINEAN_RESTAURANT
     **/
    ARGENTINEAN_RESTAURANT("argentinean_restaurant"),
    /**
     * ARMENIAN_RESTAURANT
     **/
    ARMENIAN_RESTAURANT("armenian_restaurant"),
    /**
     * AUSTRALIAN_RESTAURANT
     **/
    AUSTRALIAN_RESTAURANT("australian_restaurant"),
    /**
     * BASQUE_RESTAURANT
     **/
    BASQUE_RESTAURANT("basque_restaurant"),
    /**
     * BOLIVIAN_RESTAURANT
     **/
    BOLIVIAN_RESTAURANT("bolivian_restaurant"),
    /**
     * BOSNIAN_RESTAURANT
     **/
    BOSNIAN_RESTAURANT("bosnian_restaurant"),
    /**
     * BULGARIAN_RESTAURANT
     **/
    BULGARIAN_RESTAURANT("bulgarian_restaurant"),
    /**
     * BURMESE_RESTAURANT
     **/
    BURMESE_RESTAURANT("burmese_restaurant"),
    /**
     * CAMBODIAN_RESTAURANT
     **/
    CAMBODIAN_RESTAURANT("cambodian_restaurant"),
    /**
     * CHILEAN_RESTAURANT
     **/
    CHILEAN_RESTAURANT("chilean_restaurant"),
    /**
     * COLOMBIAN_RESTAURANT
     **/
    COLOMBIAN_RESTAURANT("colombian_restaurant"),
    /**
     * CORSICAN_RESTAURANT
     **/
    CORSICAN_RESTAURANT("corsican_restaurant"),
    /**
     * CUBAN_RESTAURANT
     **/
    CUBAN_RESTAURANT("cuban_restaurant"),
    /**
     * CYPRIOT_RESTAURANT
     **/
    CYPRIOT_RESTAURANT("cypriot_restaurant"),
    /**
     * DANISH_RESTAURANT
     **/
    DANISH_RESTAURANT("danish_restaurant"),
    /**
     * DOMINICAN_RESTAURANT
     **/
    DOMINICAN_RESTAURANT("dominican_restaurant"),
    /**
     * EGYPTIAN_RESTAURANT
     **/
    EGYPTIAN_RESTAURANT("egyptian_restaurant"),
    /**
     * ENGLISH_RESTAURANT
     **/
    ENGLISH_RESTAURANT("english_restaurant"),
    /**
     * ETHIOPIAN_RESTAURANT
     **/
    ETHIOPIAN_RESTAURANT("ethiopian_restaurant"),
    /**
     * FINNISH_RESTAURANT
     **/
    FINNISH_RESTAURANT("finnish_restaurant"),
    /**
     * IRANIAN_RESTAURANT
     **/
    IRANIAN_RESTAURANT("iranian_restaurant"),
    /**
     * ISRAELI_RESTAURANT
     **/
    ISRAELI_RESTAURANT("israeli_restaurant"),
    /**
     * LUXEMBOURGIAN_RESTAURANT
     **/
    LUXEMBOURGIAN_RESTAURANT("luxembourgian_restaurant"),
    /**
     * MAGHRIB_RESTAURANT
     **/
    MAGHRIB_RESTAURANT("maghrib_restaurant"),
    /**
     * MAURITIAN_RESTAURANT
     **/
    MAURITIAN_RESTAURANT("mauritian_restaurant"),
    /**
     * MONGOLIAN_RESTAURANT
     **/
    MONGOLIAN_RESTAURANT("mongolian_restaurant"),
    /**
     * NEPALESE_RESTAURANT
     **/
    NEPALESE_RESTAURANT("nepalese_restaurant"),
    /**
     * NORWEGIAN_RESTAURANT
     **/
    NORWEGIAN_RESTAURANT("norwegian_restaurant"),
    /**
     * SAVOYAN_RESTAURANT
     **/
    SAVOYAN_RESTAURANT("savoyan_restaurant"),
    /**
     * SCANDINAVIAN_RESTAURANT
     **/
    SCANDINAVIAN_RESTAURANT("scandinavian_restaurant"),
    /**
     * SCOTTISH_RESTAURANT
     **/
    SCOTTISH_RESTAURANT("scottish_restaurant"),
    /**
     * SICILIAN_RESTAURANT
     **/
    SICILIAN_RESTAURANT("sicilian_restaurant"),
    /**
     * SLAVIC_RESTAURANT
     **/
    SLAVIC_RESTAURANT("slavic_restaurant"),
    /**
     * SUDANESE_RESTAURANT
     **/
    SUDANESE_RESTAURANT("sudanese_restaurant"),
    /**
     * SWEDISH_RESTAURANT
     **/
    SWEDISH_RESTAURANT("swedish_restaurant"),
    /**
     * SYRIAN_RESTAURANT
     **/
    SYRIAN_RESTAURANT("syrian_restaurant"),
    /**
     * TEPPANYAKKI_RESTAURANT
     **/
    TEPPANYAKKI_RESTAURANT("teppanyakki_restaurant"),
    /**
     * TIBETAN_RESTAURANT
     **/
    TIBETAN_RESTAURANT("tibetan_restaurant"),
    /**
     * TUNISIAN_RESTAURANT
     **/
    TUNISIAN_RESTAURANT("tunisian_restaurant"),
    /**
     * URUGUAYAN_RESTAURANT
     **/
    URUGUAYAN_RESTAURANT("uruguayan_restaurant"),
    /**
     * VENEZUELAN_RESTAURANT
     **/
    VENEZUELAN_RESTAURANT("venezuelan_restaurant"),
    /**
     * WELSH_RESTAURANT
     **/
    WELSH_RESTAURANT("welsh_restaurant"),
    /**
     * PAKISTANI_RESTAURANT
     **/
    PAKISTANI_RESTAURANT("pakistani_restaurant"),
    /**
     * POLYNESIAN_RESTAURANT
     **/
    POLYNESIAN_RESTAURANT("polynesian_restaurant"),
    /**
     * PROVENÇAL_RESTAURANT
     **/
    PROVENÇAL_RESTAURANT("provençal_restaurant"),
    /**
     * ROMANIAN_RESTAURANT
     **/
    ROMANIAN_RESTAURANT("romanian_restaurant"),
    /**
     * EROTIC_RESTAURANT
     **/
    EROTIC_RESTAURANT("erotic_restaurant"),
    /**
     * EXOTIC_RESTAURANT
     **/
    EXOTIC_RESTAURANT("exotic_restaurant"),
    /**
     * FONDUE_RESTAURANT
     **/
    FONDUE_RESTAURANT("fondue_restaurant"),
    /**
     * MACROBIOTIC_RESTAURANT
     **/
    MACROBIOTIC_RESTAURANT("macrobiotic_restaurant"),
    /**
     * MUSSEL_RESTAURANT
     **/
    MUSSEL_RESTAURANT("mussel_restaurant"),
    /**
     * SNACKS
     **/
    SNACKS("snacks"),
    /**
     * SOUP_RESTAURANT
     **/
    SOUP_RESTAURANT("soup_restaurant"),
    /**
     * BUFFET
     **/
    BUFFET("buffet"),
    /**
     * SALAD_BAR
     **/
    SALAD_BAR("salad_bar"),
    /**
     * TAKE_AWAY_RESTAURANT
     **/
    TAKE_AWAY_RESTAURANT("take_away_restaurant"),
    /**
     * BANQUET_ROOM
     **/
    BANQUET_ROOM("banquet_room"),
    /**
     * CAFETERIA
     **/
    CAFETERIA("cafeteria"),
    /**
     * SUSHI_RESTAURANT
     **/
    SUSHI_RESTAURANT("sushi_restaurant"),
    /**
     * YOGURT_JUICE_BAR
     **/
    YOGURT_JUICE_BAR("yogurt_juice_bar"),
    /**
     * CAFE_PUB
     **/
    CAFE_PUB("cafe_pub"),
    /**
     * CAFE
     **/
    CAFE("cafe"),
    /**
     * PUB
     **/
    PUB("pub"),
    /**
     * INTERNET_CAFE
     **/
    INTERNET_CAFE("internet_cafe"),
    /**
     * TEA_HOUSE
     **/
    TEA_HOUSE("tea_house"),
    /**
     * COFFEE_SHOP
     **/
    COFFEE_SHOP("coffee_shop"),
    /**
     * MICROBREWERY_BEER_GARDEN
     **/
    MICROBREWERY_BEER_GARDEN("microbrewery_beer_garden"),
    /**
     * RESTAURANT_AREA
     **/
    RESTAURANT_AREA("restaurant_area"),
    /**
     * SHOPPING
     **/
    SHOPPING("shopping"),
    /**
     * DEPARTMENT_STORE
     **/
    DEPARTMENT_STORE("department_store"),
    /**
     * SHOPPING_CENTER
     **/
    SHOPPING_CENTER("shopping_center"),
    /**
     * MARKET
     **/
    MARKET("market"),
    /**
     * INFORMAL_MARKET
     **/
    INFORMAL_MARKET("informal_market"),
    /**
     * PUBLIC_MARKET
     **/
    PUBLIC_MARKET("public_market"),
    /**
     * FARMER_MARKET
     **/
    FARMER_MARKET("farmer_market"),
    /**
     * SUPERMARKET_HYPERMARKET
     **/
    SUPERMARKET_HYPERMARKET("supermarket_hypermarket"),
    /**
     * FOOD_MARKET
     **/
    FOOD_MARKET("food_market"),
    /**
     * CONVENIENCE_STORE
     **/
    CONVENIENCE_STORE("convenience_store"),
    /**
     * GROCERY
     **/
    GROCERY("grocery"),
    /**
     * GREENGROCERY
     **/
    GREENGROCERY("greengrocery"),
    /**
     * SHOP
     **/
    SHOP("shop"),
    /**
     * BOOKSTORE
     **/
    BOOKSTORE("bookstore"),
    /**
     * CD_DVD_VIDEO_STORE
     **/
    CD_DVD_VIDEO_STORE("cd_dvd_video_store"),
    /**
     * CD_DVD_VIDEO_STORE_SUB
     **/
    CD_DVD_VIDEO_STORE_SUB("cd_dvd_video_store_sub"),
    /**
     * CD_DVD_VIDEO_RENTAL_STORE
     **/
    CD_DVD_VIDEO_RENTAL_STORE("cd_dvd_video_rental_store"),
    /**
     * CLOTHING_ACCESSORIES_STORE
     **/
    CLOTHING_ACCESSORIES_STORE("clothing_accessories_store"),
    /**
     * DRY_CLEANERS
     **/
    DRY_CLEANERS("dry_cleaners"),
    /**
     * ELECTRICAL_APPLIANCE_STORE
     **/
    ELECTRICAL_APPLIANCE_STORE("electrical_appliance_store"),
    /**
     * PHOTOGRAPHIC_EQUIPMENT_STORE
     **/
    PHOTOGRAPHIC_EQUIPMENT_STORE("photographic_equipment_store"),
    /**
     * CONSUMER_ELECTRONICS_STORE
     **/
    CONSUMER_ELECTRONICS_STORE("consumer_electronics_store"),
    /**
     * COMPUTER_STORE
     **/
    COMPUTER_STORE("computer_store"),
    /**
     * OFFICE_EQUIPMENT_STORE
     **/
    OFFICE_EQUIPMENT_STORE("office_equipment_store"),
    /**
     * ELECTRICAL_APPLIANCE_STORE_SUB
     **/
    ELECTRICAL_APPLIANCE_STORE_SUB("electrical_appliance_store_sub"),
    /**
     * MARINE_ELECTRONIC_EQUIPMENT_STORE
     **/
    MARINE_ELECTRONIC_EQUIPMENT_STORE("marine_electronic_equipment_store"),
    /**
     * MOBILE_PHONE_STORE
     **/
    MOBILE_PHONE_STORE("mobile_phone_store"),
    /**
     * REAL_ESTATE_AGENCY_SHOP
     **/
    REAL_ESTATE_AGENCY_SHOP("real_estate_agency_shop"),
    /**
     * OUTLETS
     **/
    OUTLETS("outlets"),
    /**
     * FACTORY_OUTLETS
     **/
    FACTORY_OUTLETS("factory_outlets"),
    /**
     * RETAIL_OUTLETS
     **/
    RETAIL_OUTLETS("retail_outlets"),
    /**
     * FLORISTS
     **/
    FLORISTS("florists"),
    /**
     * FOOD_DRINK_SHOP
     **/
    FOOD_DRINK_SHOP("food_drink_shop"),
    /**
     * BAKERY
     **/
    BAKERY("bakery"),
    /**
     * MEAT_STORE
     **/
    MEAT_STORE("meat_store"),
    /**
     * FISH_STORE
     **/
    FISH_STORE("fish_store"),
    /**
     * WINE_SPIRITS_STORE
     **/
    WINE_SPIRITS_STORE("wine_spirits_store"),
    /**
     * DELICATESSEN_STORE
     **/
    DELICATESSEN_STORE("delicatessen_store"),
    /**
     * SPECIALTY_FOOD_STORE
     **/
    SPECIALTY_FOOD_STORE("specialty_food_store"),
    /**
     * GIFT_STORE
     **/
    GIFT_STORE("gift_store"),
    /**
     * HAIR_SALON_BARBERSHOP
     **/
    HAIR_SALON_BARBERSHOP("hair_salon_barbershop"),
    /**
     * HOUSEHOLD_APPLIANCE_STORE
     **/
    HOUSEHOLD_APPLIANCE_STORE("household_appliance_store"),
    /**
     * CARPET_FLOOR_COVERING_STORE
     **/
    CARPET_FLOOR_COVERING_STORE("carpet_floor_covering_store"),
    /**
     * CURTAIN_TEXTILE_STORE
     **/
    CURTAIN_TEXTILE_STORE("curtain_textile_store"),
    /**
     * DO_IT_YOURSELF_CENTERS
     **/
    DO_IT_YOURSELF_CENTERS("do_it_yourself_centers"),
    /**
     * FURNITURE_ACCESSORIES_STORE
     **/
    FURNITURE_ACCESSORIES_STORE("furniture_accessories_store"),
    /**
     * GARDENING_CERVICE_CENTER
     **/
    GARDENING_CERVICE_CENTER("gardening_cervice_center"),
    /**
     * KITCHEN_AND_SANITATION_STORE
     **/
    KITCHEN_AND_SANITATION_STORE("kitchen_and_sanitation_store"),
    /**
     * LIGHTING_STORE
     **/
    LIGHTING_STORE("lighting_store"),
    /**
     * PAINTING_DECORATING_STORE
     **/
    PAINTING_DECORATING_STORE("painting_decorating_store"),
    /**
     * GLASS_WINDOW_STORE
     **/
    GLASS_WINDOW_STORE("glass_window_store"),
    /**
     * JEWELRY_CLOCK_AND_WATCH_SHOP
     **/
    JEWELRY_CLOCK_AND_WATCH_SHOP("jewelry_clock_and_watch_shop"),
    /**
     * NEWSAGENTS_AND_TOBACCONISTS
     **/
    NEWSAGENTS_AND_TOBACCONISTS("newsagents_and_tobacconists"),
    /**
     * OPTICIANS
     **/
    OPTICIANS("opticians"),
    /**
     * SPORTS_STORE
     **/
    SPORTS_STORE("sports_store"),
    /**
     * TOYS_AND_GAMES_STORE
     **/
    TOYS_AND_GAMES_STORE("toys_and_games_store"),
    /**
     * TRAVEL_AGENCY
     **/
    TRAVEL_AGENCY("travel_agency"),
    /**
     * CONSTRUCTION_MATERIAL_EQUIPMENT_SHOP
     **/
    CONSTRUCTION_MATERIAL_EQUIPMENT_SHOP("construction_material_equipment_shop"),
    /**
     * MEDICAL_SUPPLIES_EQUIPMENT_STORE
     **/
    MEDICAL_SUPPLIES_EQUIPMENT_STORE("medical_supplies_equipment_store"),
    /**
     * LAUNDRY
     **/
    LAUNDRY("laundry"),
    /**
     * PHOTO_SHOP
     **/
    PHOTO_SHOP("photo_shop"),
    /**
     * PHOTOCOPY_SHOP
     **/
    PHOTOCOPY_SHOP("photocopy_shop"),
    /**
     * PET_STORE
     **/
    PET_STORE("pet_store"),
    /**
     * ANIMAL_SERVICE_STORE
     **/
    ANIMAL_SERVICE_STORE("animal_service_store"),
    /**
     * PET_SUPPLY_STORE
     **/
    PET_SUPPLY_STORE("pet_supply_store"),
    /**
     * ANTIQUE_ART_STORE
     **/
    ANTIQUE_ART_STORE("antique_art_store"),
    /**
     * BEAUTY_SUPPLY_SHOP
     **/
    BEAUTY_SUPPLY_SHOP("beauty_supply_shop"),
    /**
     * DRUGSTORE
     **/
    DRUGSTORE("drugstore"),
    /**
     * HOBBY_SHOP
     **/
    HOBBY_SHOP("hobby_shop"),
    /**
     * FURNITURE_STORE
     **/
    FURNITURE_STORE("furniture_store"),
    /**
     * GLASSWARE_CERAMIC_SHOP
     **/
    GLASSWARE_CERAMIC_SHOP("glassware_ceramic_shop"),
    /**
     * LOCAL_SPECIALTY_STORE
     **/
    LOCAL_SPECIALTY_STORE("local_specialty_store"),
    /**
     * RECYCLING_SHOP
     **/
    RECYCLING_SHOP("recycling_shop"),
    /**
     * BAGS_LEATHERWEAR_SHOP
     **/
    BAGS_LEATHERWEAR_SHOP("bags_leatherwear_shop"),
    /**
     * MUSICAL_INSTRUMENT_STORE
     **/
    MUSICAL_INSTRUMENT_STORE("musical_instrument_store"),
    /**
     * SHOPPING_SERVICE_CENTER
     **/
    SHOPPING_SERVICE_CENTER("shopping_service_center"),
    /**
     * WAREHOUSE_SUPERMARKET
     **/
    WAREHOUSE_SUPERMARKET("warehouse_supermarket"),
    /**
     * BEAUTY_SALON
     **/
    BEAUTY_SALON("beauty_salon"),
    /**
     * NAIL_SALON
     **/
    NAIL_SALON("nail_salon"),
    /**
     * HARDWARE_STORE
     **/
    HARDWARE_STORE("hardware_store"),
    /**
     * PAWN_SHOP
     **/
    PAWN_SHOP("pawn_shop"),
    /**
     * LOTTERY_SHOP
     **/
    LOTTERY_SHOP("lottery_shop"),
    /**
     * BETTING_STATION
     **/
    BETTING_STATION("betting_station"),
    /**
     * AGRICULTURAL_SUPPLY_STORE
     **/
    AGRICULTURAL_SUPPLY_STORE("agricultural_supply_store"),
    /**
     * STAMP_SHOP
     **/
    STAMP_SHOP("stamp_shop"),
    /**
     * DRIVE_THROUGH_BOTTLE_SHOP
     **/
    DRIVE_THROUGH_BOTTLE_SHOP("drive_through_bottle_shop"),
    /**
     * TAILOR_SHOP
     **/
    TAILOR_SHOP("tailor_shop"),
    /**
     * SECURITY_STORE
     **/
    SECURITY_STORE("security_store"),
    /**
     * VARIETY_STORE
     **/
    VARIETY_STORE("variety_store"),
    /**
     * CHRISTMAS_HOLIDAY_STORE
     **/
    CHRISTMAS_HOLIDAY_STORE("christmas_holiday_store"),
    /**
     * BOATING_EQUIPMENT_ACCESSORIES_STORE
     **/
    BOATING_EQUIPMENT_ACCESSORIES_STORE("boating_equipment_accessories_store"),
    /**
     * SPECIALTY_STORE
     **/
    SPECIALTY_STORE("specialty_store"),
    /**
     * OFFICE_SUPPLY_SERVICES_STORE
     **/
    OFFICE_SUPPLY_SERVICES_STORE("office_supply_services_store"),
    /**
     * LEISURE
     **/
    LEISURE("leisure"),
    /**
     * ENTERTAINMENT_PLACE
     **/
    ENTERTAINMENT_PLACE("entertainment_place"),
    /**
     * AMUSEMENT_PARK
     **/
    AMUSEMENT_PARK("amusement_park"),
    /**
     * AMUSEMENT_ARCADE
     **/
    AMUSEMENT_ARCADE("amusement_arcade"),
    /**
     * AMUSEMENT_PLACE
     **/
    AMUSEMENT_PLACE("amusement_place"),
    /**
     * PARK_AND_RECREATION_AREA
     **/
    PARK_AND_RECREATION_AREA("park_and_recreation_area"),
    /**
     * PARK
     **/
    PARK("park"),
    /**
     * RECREATION_AREA
     **/
    RECREATION_AREA("recreation_area"),
    /**
     * BATTLEFIELD
     **/
    BATTLEFIELD("battlefield"),
    /**
     * CEMETERY
     **/
    CEMETERY("cemetery"),
    /**
     * HISTORIC_SITE
     **/
    HISTORIC_SITE("historic_site"),
    /**
     * HISTORICAL_PARK
     **/
    HISTORICAL_PARK("historical_park"),
    /**
     * LAKESHORE
     **/
    LAKESHORE("lakeshore"),
    /**
     * MEMORIAL
     **/
    MEMORIAL("memorial"),
    /**
     * PARKWAY
     **/
    PARKWAY("parkway"),
    /**
     * PRESERVED_AREA
     **/
    PRESERVED_AREA("preserved_area"),
    /**
     * SEASHORE
     **/
    SEASHORE("seashore"),
    /**
     * WILDERNESS_AREA
     **/
    WILDERNESS_AREA("wilderness_area"),
    /**
     * FOREST_AREA
     **/
    FOREST_AREA("forest_area"),
    /**
     * FISHING_HUNTING_AREA
     **/
    FISHING_HUNTING_AREA("fishing_hunting_area"),
    /**
     * FAIRGROUND
     **/
    FAIRGROUND("fairground"),
    /**
     * WINTER_SPORT_AREA
     **/
    WINTER_SPORT_AREA("winter_sport_area"),
    /**
     * SKI_RESORT
     **/
    SKI_RESORT("ski_resort"),
    /**
     * NATURAL_ATTRACTION
     **/
    NATURAL_ATTRACTION("natural_attraction"),
    /**
     * BOAT_LAUNCHING_RAMP
     **/
    BOAT_LAUNCHING_RAMP("boat_launching_ramp"),
    /**
     * PICNIC_AREA
     **/
    PICNIC_AREA("picnic_area"),
    /**
     * SCENIC_RIVER_AREA
     **/
    SCENIC_RIVER_AREA("scenic_river_area"),
    /**
     * PROTECTED_AREA
     **/
    PROTECTED_AREA("protected_area"),
    /**
     * ZOO_ARBORETA_BOTANICAL_GARDEN
     **/
    ZOO_ARBORETA_BOTANICAL_GARDEN("zoo_arboreta_botanical_garden"),
    /**
     * ARBORETA_BOTANICAL_GARDENS
     **/
    ARBORETA_BOTANICAL_GARDENS("arboreta_botanical_gardens"),
    /**
     * ZOO
     **/
    ZOO("zoo"),
    /**
     * AQUATIC_ZOO_MARINE_PARK
     **/
    AQUATIC_ZOO_MARINE_PARK("aquatic_zoo_marine_park"),
    /**
     * WILDLIFE_PARK
     **/
    WILDLIFE_PARK("wildlife_park"),
    /**
     * LEISURE_CENTER
     **/
    LEISURE_CENTER("leisure_center"),
    /**
     * SAUNA_SOLARIUM_MASSAGE_CENTER
     **/
    SAUNA_SOLARIUM_MASSAGE_CENTER("sauna_solarium_massage_center"),
    /**
     * SNOOKER_POOL_BILLIARD_HALL
     **/
    SNOOKER_POOL_BILLIARD_HALL("snooker_pool_billiard_hall"),
    /**
     * SPA
     **/
    SPA("spa"),
    /**
     * FLYING_CLUB
     **/
    FLYING_CLUB("flying_club"),
    /**
     * NIGHTLIFE
     **/
    NIGHTLIFE("nightlife"),
    /**
     * NIGHT_CLUB
     **/
    NIGHT_CLUB("night_club"),
    /**
     * PRIVATE_CLUB
     **/
    PRIVATE_CLUB("private_club"),
    /**
     * JAZZ_CLUB
     **/
    JAZZ_CLUB("jazz_club"),
    /**
     * COMEDY_CLUB
     **/
    COMEDY_CLUB("comedy_club"),
    /**
     * KARAOKE_CLUB
     **/
    KARAOKE_CLUB("karaoke_club"),
    /**
     * BAR
     **/
    BAR("bar"),
    /**
     * COCKTAIL_BAR
     **/
    COCKTAIL_BAR("cocktail_bar"),
    /**
     * WINE_BAR
     **/
    WINE_BAR("wine_bar"),
    /**
     * ENTERTAINMENT_CABARET_LIVE
     **/
    ENTERTAINMENT_CABARET_LIVE("entertainment_cabaret_live"),
    /**
     * DISCOTHEQUE
     **/
    DISCOTHEQUE("discotheque"),
    /**
     * DANCING_CLUB
     **/
    DANCING_CLUB("dancing_club"),
    /**
     * BILLIARDS_POOL_HALL
     **/
    BILLIARDS_POOL_HALL("billiards_pool_hall"),
    /**
     * VIDEO_ARCADE_GAMING_ROOM
     **/
    VIDEO_ARCADE_GAMING_ROOM("video_arcade_gaming_room"),
    /**
     * MUSEUM
     **/
    MUSEUM("museum"),
    /**
     * SCIENCE_MUSEUM
     **/
    SCIENCE_MUSEUM("science_museum"),
    /**
     * CHILDRENS_MUSEUM
     **/
    CHILDRENS_MUSEUM("childrens_museum"),
    /**
     * HISTORY_MUSEUM
     **/
    HISTORY_MUSEUM("history_museum"),
    /**
     * ART_MUSEUM
     **/
    ART_MUSEUM("art_museum"),
    /**
     * LIBRARY
     **/
    LIBRARY("library"),
    /**
     * THEATER
     **/
    THEATER("theater"),
    /**
     * THEATER_SUB
     **/
    THEATER_SUB("theater_sub"),
    /**
     * CONCERT_HALL
     **/
    CONCERT_HALL("concert_hall"),
    /**
     * MUSIC_CENTER
     **/
    MUSIC_CENTER("music_center"),
    /**
     * OPERA
     **/
    OPERA("opera"),
    /**
     * CABARET
     **/
    CABARET("cabaret"),
    /**
     * AMPHITHEATER
     **/
    AMPHITHEATER("amphitheater"),
    /**
     * DINNER_THEATER
     **/
    DINNER_THEATER("dinner_theater"),
    /**
     * CINEMA
     **/
    CINEMA("cinema"),
    /**
     * CINEMA_SUB
     **/
    CINEMA_SUB("cinema_sub"),
    /**
     * DRIVE_IN_CINEMA
     **/
    DRIVE_IN_CINEMA("drive_in_cinema"),
    /**
     * CASINO
     **/
    CASINO("casino"),
    /**
     * CLUB_ASSOCIATION
     **/
    CLUB_ASSOCIATION("club_association"),
    /**
     * BEACH_CLUB
     **/
    BEACH_CLUB("beach_club"),
    /**
     * HOCKEY_CLUB
     **/
    HOCKEY_CLUB("hockey_club"),
    /**
     * CAR_CLUB
     **/
    CAR_CLUB("car_club"),
    /**
     * TRAIL_SYSTEM
     **/
    TRAIL_SYSTEM("trail_system"),
    /**
     * MOUNTAIN_BIKE_TRAIL
     **/
    MOUNTAIN_BIKE_TRAIL("mountain_bike_trail"),
    /**
     * ADVENTURE_VEHICLE_TRAIL
     **/
    ADVENTURE_VEHICLE_TRAIL("adventure_vehicle_trail"),
    /**
     * HIKING_TRAIL
     **/
    HIKING_TRAIL("hiking_trail"),
    /**
     * HORSE_RIDING_TRAIL
     **/
    HORSE_RIDING_TRAIL("horse_riding_trail"),
    /**
     * ROCK_CLIMBING_TRAIL
     **/
    ROCK_CLIMBING_TRAIL("rock_climbing_trail"),
    /**
     * SKI_LIFT
     **/
    SKI_LIFT("ski_lift"),
    /**
     * COMMUNITY_CENTER
     **/
    COMMUNITY_CENTER("community_center"),
    /**
     * CULTURAL_CENTER
     **/
    CULTURAL_CENTER("cultural_center"),
    /**
     * GALLERY
     **/
    GALLERY("gallery"),
    /**
     * MARINA
     **/
    MARINA("marina"),
    /**
     * MARINA_SUB
     **/
    MARINA_SUB("marina_sub"),
    /**
     * YACHT_BASIN
     **/
    YACHT_BASIN("yacht_basin"),
    /**
     * WINERY
     **/
    WINERY("winery"),
    /**
     * SPORT
     **/
    SPORT("sport"),
    /**
     * SPORTS_CENTER
     **/
    SPORTS_CENTER("sports_center"),
    /**
     * SPORTS_CENTER_SUB
     **/
    SPORTS_CENTER_SUB("sports_center_sub"),
    /**
     * FITNESS_CLUB_CENTER
     **/
    FITNESS_CLUB_CENTER("fitness_club_center"),
    /**
     * HORSE_RIDING_FIELD
     **/
    HORSE_RIDING_FIELD("horse_riding_field"),
    /**
     * THEMED_SPORTS_HALL
     **/
    THEMED_SPORTS_HALL("themed_sports_hall"),
    /**
     * SQUASH_COURT
     **/
    SQUASH_COURT("squash_court"),
    /**
     * BOWLING_FIELD
     **/
    BOWLING_FIELD("bowling_field"),
    /**
     * SHOOTING_RANGE
     **/
    SHOOTING_RANGE("shooting_range"),
    /**
     * STADIUM
     **/
    STADIUM("stadium"),
    /**
     * ATHLETIC_STADIUM
     **/
    ATHLETIC_STADIUM("athletic_stadium"),
    /**
     * CRICKET_GROUND
     **/
    CRICKET_GROUND("cricket_ground"),
    /**
     * SOCCER_FIELD
     **/
    SOCCER_FIELD("soccer_field"),
    /**
     * HORSE_RACING_TRACK
     **/
    HORSE_RACING_TRACK("horse_racing_track"),
    /**
     * MULTIPURPOSE_STADIUM
     **/
    MULTIPURPOSE_STADIUM("multipurpose_stadium"),
    /**
     * RUGBY_GROUND
     **/
    RUGBY_GROUND("rugby_ground"),
    /**
     * ICE_HOCKEY_RINK
     **/
    ICE_HOCKEY_RINK("ice_hockey_rink"),
    /**
     * BASEBALL_FIELD
     **/
    BASEBALL_FIELD("baseball_field"),
    /**
     * FOOTBALL_FIELD
     **/
    FOOTBALL_FIELD("football_field"),
    /**
     * MOTORSPORT_VENUE
     **/
    MOTORSPORT_VENUE("motorsport_venue"),
    /**
     * BASKETBALL_COURT
     **/
    BASKETBALL_COURT("basketball_court"),
    /**
     * RACE_TRACK
     **/
    RACE_TRACK("race_track"),
    /**
     * NETBALL_COURT
     **/
    NETBALL_COURT("netball_court"),
    /**
     * HOCKEY_FIELD
     **/
    HOCKEY_FIELD("hockey_field"),
    /**
     * BADMINTON_COURT
     **/
    BADMINTON_COURT("badminton_court"),
    /**
     * TABLE_TENNIS_HALL
     **/
    TABLE_TENNIS_HALL("table_tennis_hall"),
    /**
     * GOLF_COURSE
     **/
    GOLF_COURSE("golf_course"),
    /**
     * ICE_SKATING_RINK
     **/
    ICE_SKATING_RINK("ice_skating_rink"),
    /**
     * SWIMMING_POOL
     **/
    SWIMMING_POOL("swimming_pool"),
    /**
     * TENNIS_COURT
     **/
    TENNIS_COURT("tennis_court"),
    /**
     * WATER_SPORTS_CENTER
     **/
    WATER_SPORTS_CENTER("water_sports_center"),
    /**
     * DIVING_CENTER
     **/
    DIVING_CENTER("diving_center"),
    /**
     * TOURISM
     **/
    TOURISM("tourism"),
    /**
     * TOURIST_INFORMATION_OFFICE
     **/
    TOURIST_INFORMATION_OFFICE("tourist_information_office"),
    /**
     * IMPORTANT_TOURIST_ATTRACTION
     **/
    IMPORTANT_TOURIST_ATTRACTION("important_tourist_attraction"),
    /**
     * BUILDING
     **/
    BUILDING("building"),
    /**
     * MONUMENT
     **/
    MONUMENT("monument"),
    /**
     * NATURAL_ATTRACTION_TOURIST
     **/
    NATURAL_ATTRACTION_TOURIST("natural_attraction_tourist"),
    /**
     * OBSERVATORY
     **/
    OBSERVATORY("observatory"),
    /**
     * PLANETARIUM
     **/
    PLANETARIUM("planetarium"),
    /**
     * DAM
     **/
    DAM("dam"),
    /**
     * TUNNEL
     **/
    TUNNEL("tunnel"),
    /**
     * TOWER
     **/
    TOWER("tower"),
    /**
     * BRIDGE
     **/
    BRIDGE("bridge"),
    /**
     * MAUSOLEUM_GRAVE
     **/
    MAUSOLEUM_GRAVE("mausoleum_grave"),
    /**
     * ARCH
     **/
    ARCH("arch"),
    /**
     * STATUE
     **/
    STATUE("statue"),
    /**
     * WATER_HOLE
     **/
    WATER_HOLE("water_hole"),
    /**
     * WINERY_TOURIST
     **/
    WINERY_TOURIST("winery_tourist"),
    /**
     * PLACE_OF_WORSHIP
     **/
    PLACE_OF_WORSHIP("place_of_worship"),
    /**
     * CHURCH
     **/
    CHURCH("church"),
    /**
     * MOSQUE
     **/
    MOSQUE("mosque"),
    /**
     * SYNAGOGUE
     **/
    SYNAGOGUE("synagogue"),
    /**
     * TEMPLE
     **/
    TEMPLE("temple"),
    /**
     * GURUDWARA
     **/
    GURUDWARA("gurudwara"),
    /**
     * ASHRAM
     **/
    ASHRAM("ashram"),
    /**
     * PAGODA
     **/
    PAGODA("pagoda"),
    /**
     * SHINTO_SHRINE
     **/
    SHINTO_SHRINE("shinto_shrine"),
    /**
     * HINDU_TEMPLE
     **/
    HINDU_TEMPLE("hindu_temple"),
    /**
     * BUDDHIST_TEMPLE
     **/
    BUDDHIST_TEMPLE("buddhist_temple"),
    /**
     * JAIN_TEMPLE
     **/
    JAIN_TEMPLE("jain_temple"),
    /**
     * MORMON_CHURCH
     **/
    MORMON_CHURCH("mormon_church"),
    /**
     * DHARMA_TEMPLE
     **/
    DHARMA_TEMPLE("dharma_temple"),
    /**
     * BEACH
     **/
    BEACH("beach"),
    /**
     * ADVENTURE_SPORTS_VENUE
     **/
    ADVENTURE_SPORTS_VENUE("adventure_sports_venue"),
    /**
     * OBSERVATION_DECK
     **/
    OBSERVATION_DECK("observation_deck"),
    /**
     * HEALTH_CARE
     **/
    HEALTH_CARE("health_care"),
    /**
     * HOSPITAL_POLYCLINIC
     **/
    HOSPITAL_POLYCLINIC("hospital_polyclinic"),
    /**
     * GENERAL_HOSPITAL
     **/
    GENERAL_HOSPITAL("general_hospital"),
    /**
     * SPECIALIZED_HOSPITAL
     **/
    SPECIALIZED_HOSPITAL("specialized_hospital"),
    /**
     * CHINESE_MEDICINE_HOSPITAL
     **/
    CHINESE_MEDICINE_HOSPITAL("chinese_medicine_hospital"),
    /**
     * HOSPITAL_FOR_WOMEN_AND_CHILDREN
     **/
    HOSPITAL_FOR_WOMEN_AND_CHILDREN("hospital_for_women_and_children"),
    /**
     * HEALTHCARE_SERVICE_CENTER
     **/
    HEALTHCARE_SERVICE_CENTER("healthcare_service_center"),
    /**
     * PERSONAL_SERVICE_CENTER
     **/
    PERSONAL_SERVICE_CENTER("personal_service_center"),
    /**
     * PERSONAL_CARE_INSTITUTION
     **/
    PERSONAL_CARE_INSTITUTION("personal_care_institution"),
    /**
     * BLOOD_BANK
     **/
    BLOOD_BANK("blood_bank"),
    /**
     * AMBULANCE_UNIT
     **/
    AMBULANCE_UNIT("ambulance_unit"),
    /**
     * NURSING_HOME
     **/
    NURSING_HOME("nursing_home"),
    /**
     * PHARMACY
     **/
    PHARMACY("pharmacy"),
    /**
     * DENTAL_CLINIC
     **/
    DENTAL_CLINIC("dental_clinic"),
    /**
     * EMERGENCY_ROOM
     **/
    EMERGENCY_ROOM("emergency_room"),
    /**
     * MEDICAL_CLINIC
     **/
    MEDICAL_CLINIC("medical_clinic"),
    /**
     * PHYSIOTHERAPY_CLINIC
     **/
    PHYSIOTHERAPY_CLINIC("physiotherapy_clinic"),
    /**
     * GENERAL_CLINIC
     **/
    GENERAL_CLINIC("general_clinic"),
    /**
     * SPECIALIST_CLINIC
     **/
    SPECIALIST_CLINIC("specialist_clinic"),
    /**
     * VETERINARY_CLINIC
     **/
    VETERINARY_CLINIC("veterinary_clinic"),
    /**
     * LODGING_LIVING_ACCOMMODATION
     **/
    LODGING_LIVING_ACCOMMODATION("lodging_living_accommodation"),
    /**
     * RESIDENTIAL_ACCOMMODATION
     **/
    RESIDENTIAL_ACCOMMODATION("residential_accommodation"),
    /**
     * RESIDENTIAL_ESTATE
     **/
    RESIDENTIAL_ESTATE("residential_estate"),
    /**
     * FLATS_APARTMENT_COMPLEX
     **/
    FLATS_APARTMENT_COMPLEX("flats_apartment_complex"),
    /**
     * TOWNHOUSE_COMPLEX
     **/
    TOWNHOUSE_COMPLEX("townhouse_complex"),
    /**
     * RETIREMENT_COMMUNITY
     **/
    RETIREMENT_COMMUNITY("retirement_community"),
    /**
     * CONDOMINIUM_COMPLEX
     **/
    CONDOMINIUM_COMPLEX("condominium_complex"),
    /**
     * HOTEL_MOTEL
     **/
    HOTEL_MOTEL("hotel_motel"),
    /**
     * BED_BREAKFAST_GUEST_HOUSES
     **/
    BED_BREAKFAST_GUEST_HOUSES("bed_breakfast_guest_houses"),
    /**
     * HOTEL
     **/
    HOTEL("hotel"),
    /**
     * UNRATED_HOTEL
     **/
    UNRATED_HOTEL("unrated_hotel"),
    /**
     * HOTELS_WITH_LESS_THAN_TWO_STARS
     **/
    HOTELS_WITH_LESS_THAN_TWO_STARS("hotels_with_less_than_two_stars"),
    /**
     * THREE_STAR_HOTEL
     **/
    THREE_STAR_HOTEL("three_star_hotel"),
    /**
     * FOUR_STAR_HOTEL
     **/
    FOUR_STAR_HOTEL("four_star_hotel"),
    /**
     * FIVE_STAR_HOTEL
     **/
    FIVE_STAR_HOTEL("five_star_hotel"),
    /**
     * HOSTEL
     **/
    HOSTEL("hostel"),
    /**
     * RESORT
     **/
    RESORT("resort"),
    /**
     * MOTEL
     **/
    MOTEL("motel"),
    /**
     * CABINS_LODGES
     **/
    CABINS_LODGES("cabins_lodges"),
    /**
     * REST_CAMPS
     **/
    REST_CAMPS("rest_camps"),
    /**
     * HOLIDAY_HOUSE_RENTAL
     **/
    HOLIDAY_HOUSE_RENTAL("holiday_house_rental"),
    /**
     * COTTAGE
     **/
    COTTAGE("cottage"),
    /**
     * VILLA
     **/
    VILLA("villa"),
    /**
     * BUNGALOW
     **/
    BUNGALOW("bungalow"),
    /**
     * CHALET
     **/
    CHALET("chalet"),
    /**
     * APARTMENT
     **/
    APARTMENT("apartment"),
    /**
     * CAMPING_GROUND
     **/
    CAMPING_GROUND("camping_ground"),
    /**
     * RECREATIONAL_SITE
     **/
    RECREATIONAL_SITE("recreational_site"),
    /**
     * CARAVAN_SITE
     **/
    CARAVAN_SITE("caravan_site"),
    /**
     * TRANSPORT
     **/
    TRANSPORT("transport"),
    /**
     * AIRPORT
     **/
    AIRPORT("airport"),
    /**
     * PUBLIC_AUTHORITY
     **/
    PUBLIC_AUTHORITY("public_authority"),
    /**
     * PRIVATE_AUTHORITY
     **/
    PRIVATE_AUTHORITY("private_authority"),
    /**
     * MILITARY_AUTHORITY
     **/
    MILITARY_AUTHORITY("military_authority"),
    /**
     * AIRFIELD
     **/
    AIRFIELD("airfield"),
    /**
     * TERMINAL
     **/
    TERMINAL("terminal"),
    /**
     * RAILWAY_STATION
     **/
    RAILWAY_STATION("railway_station"),
    /**
     * INTERNATIONAL_RAILWAY_STATION
     **/
    INTERNATIONAL_RAILWAY_STATION("international_railway_station"),
    /**
     * NATIONAL_RAILWAY_STATION
     **/
    NATIONAL_RAILWAY_STATION("national_railway_station"),
    /**
     * INTERCITY_RAILWAY_STATION
     **/
    INTERCITY_RAILWAY_STATION("intercity_railway_station"),
    /**
     * METRO
     **/
    METRO("metro"),
    /**
     * RAILWAY_SIDING
     **/
    RAILWAY_SIDING("railway_siding"),
    /**
     * PUBLIC_TRANSPORT_STOP
     **/
    PUBLIC_TRANSPORT_STOP("public_transport_stop"),
    /**
     * BUS_STOP
     **/
    BUS_STOP("bus_stop"),
    /**
     * TAXI_STAND
     **/
    TAXI_STAND("taxi_stand"),
    /**
     * TRAM_STOP
     **/
    TRAM_STOP("tram_stop"),
    /**
     * COACH_STATION
     **/
    COACH_STATION("coach_station"),
    /**
     * FERRY_TERMINAL
     **/
    FERRY_TERMINAL("ferry_terminal"),
    /**
     * BOAT_FERRY
     **/
    BOAT_FERRY("boat_ferry"),
    /**
     * RAIL_FERRY
     **/
    RAIL_FERRY("rail_ferry"),
    /**
     * DOCK
     **/
    DOCK("dock"),
    /**
     * PORT_WAREHOUSE
     **/
    PORT_WAREHOUSE("port_warehouse"),
    /**
     * HELIPAD_HELICOPTER_LANDING
     **/
    HELIPAD_HELICOPTER_LANDING("helipad_helicopter_landing"),
    /**
     * ACCESS_GATEWAY
     **/
    ACCESS_GATEWAY("access_gateway"),
    /**
     * AIRLINE_ACCESS
     **/
    AIRLINE_ACCESS("airline_access"),
    /**
     * STATION_ACCESS
     **/
    STATION_ACCESS("station_access"),
    /**
     * SECURITY_GATE
     **/
    SECURITY_GATE("security_gate"),
    /**
     * HIGHWAY_EXIT
     **/
    HIGHWAY_EXIT("highway_exit"),
    /**
     * DELIVERY_ENTRANCE
     **/
    DELIVERY_ENTRANCE("delivery_entrance"),
    /**
     * HIGHWAY__ENTRANCE
     **/
    HIGHWAY__ENTRANCE("highway__entrance"),
    /**
     * BORDER_POST
     **/
    BORDER_POST("border_post"),
    /**
     * MOUNTAIN_PASS
     **/
    MOUNTAIN_PASS("mountain_pass"),
    /**
     * TRANSPORT__CENTER
     **/
    TRANSPORT__CENTER("transport__center"),
    /**
     * CARGO_CENTER
     **/
    CARGO_CENTER("cargo_center"),
    /**
     * LOADING_ZONE
     **/
    LOADING_ZONE("loading_zone"),
    /**
     * NAMED_INTERSECTION
     **/
    NAMED_INTERSECTION("named_intersection"),
    /**
     * TRAFFIC
     **/
    TRAFFIC("traffic"),
    /**
     * TRAFFIC_SIGNAL
     **/
    TRAFFIC_SIGNAL("traffic_signal"),
    /**
     * TRAFFIC_LIGHT
     **/
    TRAFFIC_LIGHT("traffic_light"),
    /**
     * TRAFFIC_SIGN
     **/
    TRAFFIC_SIGN("traffic_sign"),
    /**
     * GOVERNMENT_PUBLIC_SERVICE
     **/
    GOVERNMENT_PUBLIC_SERVICE("government_public_service"),
    /**
     * CITY_CENTER
     **/
    CITY_CENTER("city_center"),
    /**
     * GOVERNMENT_OFFICE
     **/
    GOVERNMENT_OFFICE("government_office"),
    /**
     * ORDER_9_AREA_GOVERNMENT_OFFICE
     **/
    ORDER_9_AREA_GOVERNMENT_OFFICE("order_9_area_government_office"),
    /**
     * ORDER_8_AREA_GOVERNMENT_OFFICE
     **/
    ORDER_8_AREA_GOVERNMENT_OFFICE("order_8_area_government_office"),
    /**
     * ORDER_7_AREA_GOVERNMENT_OFFICE
     **/
    ORDER_7_AREA_GOVERNMENT_OFFICE("order_7_area_government_office"),
    /**
     * ORDER_6_AREA_GOVERNMENT_OFFICE
     **/
    ORDER_6_AREA_GOVERNMENT_OFFICE("order_6_area_government_office"),
    /**
     * ORDER_5_AREA_GOVERNMENT_OFFICE
     **/
    ORDER_5_AREA_GOVERNMENT_OFFICE("order_5_area_government_office"),
    /**
     * ORDER_4_AREA_GOVERNMENT_OFFICE
     **/
    ORDER_4_AREA_GOVERNMENT_OFFICE("order_4_area_government_office"),
    /**
     * ORDER_3_AREA_GOVERNMENT_OFFICE
     **/
    ORDER_3_AREA_GOVERNMENT_OFFICE("order_3_area_government_office"),
    /**
     * ORDER_2_AREA_GOVERNMENT_OFFICE
     **/
    ORDER_2_AREA_GOVERNMENT_OFFICE("order_2_area_government_office"),
    /**
     * ORDER_1_AREA
     **/
    ORDER_1_AREA_GOVERNMENT_OFFICE("order_1_area_government_office"),
    /**
     * NATIONAL_ORGANIZATION
     **/
    NATIONAL_ORGANIZATION("national_organization"),
    /**
     * INTERNATIONAL_ORGANIZATION
     **/
    INTERNATIONAL_ORGANIZATION("international_organization"),
    /**
     * CITY_HALL
     **/
    CITY_HALL("city_hall"),
    /**
     * COUNTY_COUNCIL
     **/
    COUNTY_COUNCIL("county_council"),
    /**
     * CIVIC_COMMUNITY_CENTER
     **/
    CIVIC_COMMUNITY_CENTER("civic_community_center"),
    /**
     * TOWN_GOVERNMENT
     **/
    TOWN_GOVERNMENT("town_government"),
    /**
     * FIRE_STATION_BRIGADE
     **/
    FIRE_STATION_BRIGADE("fire_station_brigade"),
    /**
     * POLICE_STATION
     **/
    POLICE_STATION("police_station"),
    /**
     * ORDER_9_AREA_POLICE_STATION
     **/
    ORDER_9_AREA_POLICE_STATION("order_9_area_police_station"),
    /**
     * ORDER_8_AREA_POLICE_STATION
     **/
    ORDER_8_AREA_POLICE_STATION("order_8_area_police_station"),
    /**
     * ORDER_1_AREA
     **/
    ORDER_1_AREA_POLICE_STATION("order_1_area_police_station"),
    /**
     * POST_OFFICE
     **/
    POST_OFFICE("post_office"),
    /**
     * GENERAL_POST_OFFICE
     **/
    GENERAL_POST_OFFICE("general_post_office"),
    /**
     * LOCAL_POST_OFFICE
     **/
    LOCAL_POST_OFFICE("local_post_office"),
    /**
     * COURTHOUSE
     **/
    COURTHOUSE("courthouse"),
    /**
     * EMBASSY
     **/
    EMBASSY("embassy"),
    /**
     * TRAFFIC_CONTROL_DEPARTMENT
     **/
    TRAFFIC_CONTROL_DEPARTMENT("traffic_control_department"),
    /**
     * TRAFFIC_MANAGEMENT_BUREAU
     **/
    TRAFFIC_MANAGEMENT_BUREAU("traffic_management_bureau"),
    /**
     * MILITARY_BASE
     **/
    MILITARY_BASE("military_base"),
    /**
     * EDUCATION_INSTITUTION
     **/
    EDUCATION_INSTITUTION("education_institution"),
    /**
     * COLLEGE_UNIVERSITY
     **/
    COLLEGE_UNIVERSITY("college_university"),
    /**
     * JUNIOR_COLLEGE_COMMUNITY_COLLEGE
     **/
    JUNIOR_COLLEGE_COMMUNITY_COLLEGE("junior_college_community_college"),
    /**
     * CHILD_CARE_FACILITY
     **/
    CHILD_CARE_FACILITY("child_care_facility"),
    /**
     * PRESCHOOL
     **/
    PRESCHOOL("preschool"),
    /**
     * PRIMARY_SCHOOL
     **/
    PRIMARY_SCHOOL("primary_school"),
    /**
     * HIGH_SCHOOL
     **/
    HIGH_SCHOOL("high_school"),
    /**
     * SENIOR_HIGH_SCHOOL
     **/
    SENIOR_HIGH_SCHOOL("senior_high_school"),
    /**
     * VOCATIONAL_TRAINING_SCHOOL
     **/
    VOCATIONAL_TRAINING_SCHOOL("vocational_training_school"),
    /**
     * TECHNICAL_SCHOOL
     **/
    TECHNICAL_SCHOOL("technical_school"),
    /**
     * LANGUAGE_SCHOOL
     **/
    LANGUAGE_SCHOOL("language_school"),
    /**
     * SPORTS_SCHOOL
     **/
    SPORTS_SCHOOL("sports_school"),
    /**
     * ART_SCHOOL
     **/
    ART_SCHOOL("art_school"),
    /**
     * SPECIAL_SCHOOL
     **/
    SPECIAL_SCHOOL("special_school"),
    /**
     * MIDDLE_SCHOOL
     **/
    MIDDLE_SCHOOL("middle_school"),
    /**
     * CULINARY_SCHOOL
     **/
    CULINARY_SCHOOL("culinary_school"),
    /**
     * DRIVING_SCHOOL
     **/
    DRIVING_SCHOOL("driving_school"),
    /**
     * DANCE_STUDIO_SCHOOL
     **/
    DANCE_STUDIO_SCHOOL("dance_studio_school"),
    /**
     * SCHOOL
     **/
    SCHOOL("school"),
    /**
     * PUBLIC_AMENITY
     **/
    PUBLIC_AMENITY("public_amenity"),
    /**
     * PASSENGER_TRANSPORT_TICKET_OFFICE
     **/
    PASSENGER_TRANSPORT_TICKET_OFFICE("passenger_transport_ticket_office"),
    /**
     * PEDESTRIAN_SUBWAY
     **/
    PEDESTRIAN_SUBWAY("pedestrian_subway"),
    /**
     * PUBLIC_CALL_BOX
     **/
    PUBLIC_CALL_BOX("public_call_box"),
    /**
     * TOILET
     **/
    TOILET("toilet"),
    /**
     * ROAD_RESCUE_POINT
     **/
    ROAD_RESCUE_POINT("road_rescue_point"),
    /**
     * PUBLIC_RESTROOM
     **/
    PUBLIC_RESTROOM("public_restroom"),
    /**
     * ORGANIZATION
     **/
    ORGANIZATION("organization"),
    /**
     * WELFARE_ORGANIZATION
     **/
    WELFARE_ORGANIZATION("welfare_organization"),
    /**
     * NON_GOVERNMENTAL_ORGANIZATION
     **/
    NON_GOVERNMENTAL_ORGANIZATION("non_governmental_organization"),
    /**
     * NATIVE_RESERVATION
     **/
    NATIVE_RESERVATION("native_reservation"),
    /**
     * PRISON
     **/
    PRISON("prison"),
    /**
     * EMERGENCY_ASSEMBLY_POINT
     **/
    EMERGENCY_ASSEMBLY_POINT("emergency_assembly_point"),
    /**
     * TSUNAMI_ASSEMBLY_POINT
     **/
    TSUNAMI_ASSEMBLY_POINT("tsunami_assembly_point"),
    /**
     * FIRE_ASSEMBLY_POINT
     **/
    FIRE_ASSEMBLY_POINT("fire_assembly_point"),
    /**
     * EARTHQUAKE_ASSEMBLY_POINT_
     **/
    EARTHQUAKE_ASSEMBLY_POINT_("earthquake_assembly_point_"),
    /**
     * VOLCANIC_ERUPTION_ASSEMBLY_POINT
     **/
    VOLCANIC_ERUPTION_ASSEMBLY_POINT("volcanic_eruption_assembly_point"),
    /**
     * FLOOD_ASSEMBLY_POINT
     **/
    FLOOD_ASSEMBLY_POINT("flood_assembly_point"),
    /**
     * BUSINESS
     **/
    BUSINESS("business"),
    /**
     * BANK
     **/
    BANK("bank"),
    /**
     * AUTOMATIC_TELLER_MACHINE
     **/
    AUTOMATIC_TELLER_MACHINE("automatic_teller_machine"),
    /**
     * COMMERCIAL_BUILDING
     **/
    COMMERCIAL_BUILDING("commercial_building"),
    /**
     * BUSINESS_PARK
     **/
    BUSINESS_PARK("business_park"),
    /**
     * EXHIBITION_CONVENTION_CENTER
     **/
    EXHIBITION_CONVENTION_CENTER("exhibition_convention_center"),
    /**
     * INDUSTRIAL_BUILDING
     **/
    INDUSTRIAL_BUILDING("industrial_building"),
    /**
     * MANUFACTURING_FACTORY
     **/
    MANUFACTURING_FACTORY("manufacturing_factory"),
    /**
     * MEDIA_COMPANY
     **/
    MEDIA_COMPANY("media_company"),
    /**
     * RESEARCH_INSTITUTE
     **/
    RESEARCH_INSTITUTE("research_institute"),
    /**
     * EXCHANGE
     **/
    EXCHANGE("exchange"),
    /**
     * STOCK_EXCHANGE
     **/
    STOCK_EXCHANGE("stock_exchange"),
    /**
     * GOLD_EXCHANGE
     **/
    GOLD_EXCHANGE("gold_exchange"),
    /**
     * CURRENCY_EXCHANGE
     **/
    CURRENCY_EXCHANGE("currency_exchange"),
    /**
     * COURIER_DROP_BOX
     **/
    COURIER_DROP_BOX("courier_drop_box"),
    /**
     * AGRICULTURE_BUSINESS
     **/
    AGRICULTURE_BUSINESS("agriculture_business"),
    /**
     * HORTICULTURE_COMPANY
     **/
    HORTICULTURE_COMPANY("horticulture_company"),
    /**
     * PRODUCER_COMPANY
     **/
    PRODUCER_COMPANY("producer_company"),
    /**
     * FARM
     **/
    FARM("farm"),
    /**
     * EMERGENCY_MEDICAL_SERVICE_CENTER
     **/
    EMERGENCY_MEDICAL_SERVICE_CENTER("emergency_medical_service_center"),
    /**
     * COMPANY
     **/
    COMPANY("company"),
    /**
     * SERVICE_COMPANY
     **/
    SERVICE_COMPANY("service_company"),
    /**
     * ADVERTISING_AND_MARKETING_COMPANY
     **/
    ADVERTISING_AND_MARKETING_COMPANY("advertising_and_marketing_company"),
    /**
     * COMPUTER_AND_DATA_SERVICES_CORPORATION
     **/
    COMPUTER_AND_DATA_SERVICES_CORPORATION("computer_and_data_services_corporation"),
    /**
     * COMPUTER_SOFTWARE_COMPANY
     **/
    COMPUTER_SOFTWARE_COMPANY("computer_software_company"),
    /**
     * DIVERSIFIED_FINANCIAL_SERVICE_COMPANY
     **/
    DIVERSIFIED_FINANCIAL_SERVICE_COMPANY("diversified_financial_service_company"),
    /**
     * INSURANCE_COMPANY
     **/
    INSURANCE_COMPANY("insurance_company"),
    /**
     * MAIL_PACKAGE_FREIGHT_DELIVERY_COMPANY
     **/
    MAIL_PACKAGE_FREIGHT_DELIVERY_COMPANY("mail_package_freight_delivery_company"),
    /**
     * REAL_ESTATE_AGENCY_COMPANY
     **/
    REAL_ESTATE_AGENCY_COMPANY("real_estate_agency_company"),
    /**
     * SAVINGS_INSTITUTION
     **/
    SAVINGS_INSTITUTION("savings_institution"),
    /**
     * MANUFACTURING_COMPANY
     **/
    MANUFACTURING_COMPANY("manufacturing_company"),
    /**
     * AGRICULTURAL_TECHNOLOGY_COMPANY
     **/
    AGRICULTURAL_TECHNOLOGY_COMPANY("agricultural_technology_company"),
    /**
     * AUTOMOBILE_COMPANY
     **/
    AUTOMOBILE_COMPANY("automobile_company"),
    /**
     * CHEMICAL_COMPANY
     **/
    CHEMICAL_COMPANY("chemical_company"),
    /**
     * ELECTRONICS_COMPANY
     **/
    ELECTRONICS_COMPANY("electronics_company"),
    /**
     * MECHANICAL_ENGINEERING_COMPANY
     **/
    MECHANICAL_ENGINEERING_COMPANY("mechanical_engineering_company"),
    /**
     * PUBLIC_HEALTH_TECHNOLOGY_COMPANY
     **/
    PUBLIC_HEALTH_TECHNOLOGY_COMPANY("public_health_technology_company"),
    /**
     * PHARMACEUTICAL_COMPANY
     **/
    PHARMACEUTICAL_COMPANY("pharmaceutical_company"),
    /**
     * PUBLISHING_TECHNOLOGY_COMPANY
     **/
    PUBLISHING_TECHNOLOGY_COMPANY("publishing_technology_company"),
    /**
     * TELECOMMUNICATIONS_COMPANY
     **/
    TELECOMMUNICATIONS_COMPANY("telecommunications_company"),
    /**
     * OEM
     **/
    OEM("oem"),
    /**
     * TAX_SERVICE_COMPANY
     **/
    TAX_SERVICE_COMPANY("tax_service_company"),
    /**
     * LEGAL_SERVICE_COMPANY
     **/
    LEGAL_SERVICE_COMPANY("legal_service_company"),
    /**
     * TRANSPORTATION_COMPANY
     **/
    TRANSPORTATION_COMPANY("transportation_company"),
    /**
     * BUS_CHARTER_RENTAL_COMPANY
     **/
    BUS_CHARTER_RENTAL_COMPANY("bus_charter_rental_company"),
    /**
     * TAXI_LIMOUSINE_SHUTTLE_SERVICE_COMPANY
     **/
    TAXI_LIMOUSINE_SHUTTLE_SERVICE_COMPANY("taxi_limousine_shuttle_service_company"),
    /**
     * BUS_COMPANY
     **/
    BUS_COMPANY("bus_company"),
    /**
     * SCHOOL_BUS_SERVICE_COMPANY
     **/
    SCHOOL_BUS_SERVICE_COMPANY("school_bus_service_company"),
    /**
     * CLEANING_SERVICE_COMPANY
     **/
    CLEANING_SERVICE_COMPANY("cleaning_service_company"),
    /**
     * OIL_NATURAL_GAS_COMPANY
     **/
    OIL_NATURAL_GAS_COMPANY("oil_natural_gas_company"),
    /**
     * MINERAL_COMPANY
     **/
    MINERAL_COMPANY("mineral_company"),
    /**
     * CONSTRUCTION_COMPANY
     **/
    CONSTRUCTION_COMPANY("construction_company"),
    /**
     * MOVING_STORAGE_COMPANY
     **/
    MOVING_STORAGE_COMPANY("moving_storage_company"),
    /**
     * AIRLINE
     **/
    AIRLINE("airline"),
    /**
     * BRIDGE_TUNNEL_ENGINEERING_COMPANY
     **/
    BRIDGE_TUNNEL_ENGINEERING_COMPANY("bridge_tunnel_engineering_company"),
    /**
     * FUNERAL_SERVICE_COMPANY
     **/
    FUNERAL_SERVICE_COMPANY("funeral_service_company"),
    /**
     * INVESTMENT_CONSULTING_FIRM
     **/
    INVESTMENT_CONSULTING_FIRM("investment_consulting_firm"),
    /**
     * EQUIPMENT_RENTAL_COMPANY
     **/
    EQUIPMENT_RENTAL_COMPANY("equipment_rental_company"),
    /**
     * BUSINESS_SERVICES_COMPANY
     **/
    BUSINESS_SERVICES_COMPANY("business_services_company"),
    /**
     * CABLE_TELEPHONE_COMPANY
     **/
    CABLE_TELEPHONE_COMPANY("cable_telephone_company"),
    /**
     * AUTOMOBILE_MANUFACTURING_COMPANY
     **/
    AUTOMOBILE_MANUFACTURING_COMPANY("automobile_manufacturing_company"),
    /**
     * IMPORT_AND_EXPORT_DISTRIBUTION_COMPANY
     **/
    IMPORT_AND_EXPORT_DISTRIBUTION_COMPANY("import_and_export_distribution_company"),
    /**
     * CATERING_COMPANY
     **/
    CATERING_COMPANY("catering_company"),
    /**
     * HOME_APPLIANCE_REPAIR_COMPANY
     **/
    HOME_APPLIANCE_REPAIR_COMPANY("home_appliance_repair_company"),
    /**
     * ANIMAL_SHELTER
     **/
    ANIMAL_SHELTER("animal_shelter"),
    /**
     * WEDDING_SERVICE_COMPANY
     **/
    WEDDING_SERVICE_COMPANY("wedding_service_company"),
    /**
     * AUTOMOTIVE
     **/
    AUTOMOTIVE("automotive"),
    /**
     * PETROL_STATION
     **/
    PETROL_STATION("petrol_station"),
    /**
     * ELECTRIC_VEHICLE_CHARGING_STATION
     **/
    ELECTRIC_VEHICLE_CHARGING_STATION("electric_vehicle_charging_station"),
    /**
     * TOLL_GATE
     **/
    TOLL_GATE("toll_gate"),
    /**
     * WEIGH_STATION
     **/
    WEIGH_STATION("weigh_station"),
    /**
     * WEIGH_STATION_SUB
     **/
    WEIGH_STATION_SUB("weigh_station_sub"),
    /**
     * WEIGH_SCALES
     **/
    WEIGH_SCALES("weigh_scales"),
    /**
     * REST_AREA
     **/
    REST_AREA("rest_area"),
    /**
     * PARKING_LOT
     **/
    PARKING_LOT("parking_lot"),
    /**
     * PARKING_LOT_SUB
     **/
    PARKING_LOT_SUB("parking_lot_sub"),
    /**
     * COACH_PARKING_AREA
     **/
    COACH_PARKING_AREA("coach_parking_area"),
    /**
     * TRUCK_PARKING_AREA
     **/
    TRUCK_PARKING_AREA("truck_parking_area"),
    /**
     * PARKING_GARAGE
     **/
    PARKING_GARAGE("parking_garage"),
    /**
     * PARK_RIDE
     **/
    PARK_RIDE("park_ride"),
    /**
     * BICYCLE_SHARING_LOCATION
     **/
    BICYCLE_SHARING_LOCATION("bicycle_sharing_location"),
    /**
     * BICYCLE_PARKING_PLACE
     **/
    BICYCLE_PARKING_PLACE("bicycle_parking_place"),
    /**
     * TRAILHEAD
     **/
    TRAILHEAD("trailhead"),
    /**
     * CAR_WASH
     **/
    CAR_WASH("car_wash"),
    /**
     * CAR_WASH_SUB
     **/
    CAR_WASH_SUB("car_wash_sub"),
    /**
     * TRUCK_WASH
     **/
    TRUCK_WASH("truck_wash"),
    /**
     * CAR_RENTAL_COMPANY
     **/
    CAR_RENTAL_COMPANY("car_rental_company"),
    /**
     * CAR_RENTAL
     **/
    CAR_RENTAL("car_rental"),
    /**
     * PICK_UP_AND_RETURN_POINT
     **/
    PICK_UP_AND_RETURN_POINT("pick_up_and_return_point"),
    /**
     * AUTOMOTIVE_DEALER
     **/
    AUTOMOTIVE_DEALER("automotive_dealer"),
    /**
     * CAR_DEALER
     **/
    CAR_DEALER("car_dealer"),
    /**
     * MOTORCYCLE_DEALER
     **/
    MOTORCYCLE_DEALER("motorcycle_dealer"),
    /**
     * BOAT_DEALER
     **/
    BOAT_DEALER("boat_dealer"),
    /**
     * RECREATIONAL_VEHICLE_DEALER
     **/
    RECREATIONAL_VEHICLE_DEALER("recreational_vehicle_dealer"),
    /**
     * TRUCK_DEALER
     **/
    TRUCK_DEALER("truck_dealer"),
    /**
     * VAN_DEALER
     **/
    VAN_DEALER("van_dealer"),
    /**
     * BUS_DEALER
     **/
    BUS_DEALER("bus_dealer"),
    /**
     * ATV_SNOWMOBILE_DEALER
     **/
    ATV_SNOWMOBILE_DEALER("atv_snowmobile_dealer"),
    /**
     * USED_CAR_DEALER
     **/
    USED_CAR_DEALER("used_car_dealer"),
    /**
     * AUTOMOTIVE REPAIR_SHOP
     **/
    AUTOMOTIVE_REPAIR_SHOP("automotive repair_shop"),
    /**
     * BODYSHOPS
     **/
    BODYSHOPS("bodyshops"),
    /**
     * AUTOMOTIVE_GLASS_REPLACEMENT_SHOP
     **/
    AUTOMOTIVE_GLASS_REPLACEMENT_SHOP("automotive_glass_replacement_shop"),
    /**
     * GENERAL_AUTO_REPAIR_SERVICE_CENTER
     **/
    GENERAL_AUTO_REPAIR_SERVICE_CENTER("general_auto_repair_service_center"),
    /**
     * REPAIR_SHOP
     **/
    REPAIR_SHOP("repair_shop"),
    /**
     * AUTOMOBILE_ACCESSORIES_SHOP
     **/
    AUTOMOBILE_ACCESSORIES_SHOP("automobile_accessories_shop"),
    /**
     * TIRE_REPAIR_SHOP
     **/
    TIRE_REPAIR_SHOP("tire_repair_shop"),
    /**
     * MOTORCYCLE_REPAIR_SHOP
     **/
    MOTORCYCLE_REPAIR_SHOP("motorcycle_repair_shop"),
    /**
     * TRUCK_REPAIR_SHOP
     **/
    TRUCK_REPAIR_SHOP("truck_repair_shop"),
    /**
     * TRUCK_STOP
     **/
    TRUCK_STOP("truck_stop"),
    /**
     * MOTORING_ORGANIZATION_OFFICE
     **/
    MOTORING_ORGANIZATION_OFFICE("motoring_organization_office"),
    /**
     * MISCELLANEOUS
     **/
    MISCELLANEOUS("miscellaneous"),
    /**
     * GEOGRAPHIC_FEATURE
     **/
    GEOGRAPHIC_FEATURE("geographic_feature"),
    /**
     * MOUNTAIN_PEAK
     **/
    MOUNTAIN_PEAK("mountain_peak"),
    /**
     * CAVE
     **/
    CAVE("cave"),
    /**
     * RIDGE
     **/
    RIDGE("ridge"),
    /**
     * DUNE
     **/
    DUNE("dune"),
    /**
     * VALLEY
     **/
    VALLEY("valley"),
    /**
     * PLAIN_FLAT
     **/
    PLAIN_FLAT("plain_flat"),
    /**
     * PLATEAU
     **/
    PLATEAU("plateau"),
    /**
     * PAN
     **/
    PAN("pan"),
    /**
     * WELL
     **/
    WELL("well"),
    /**
     * OASIS
     **/
    OASIS("oasis"),
    /**
     * ROCKS
     **/
    ROCKS("rocks"),
    /**
     * RESERVOIR
     **/
    RESERVOIR("reservoir"),
    /**
     * REEF
     **/
    REEF("reef"),
    /**
     * RAPIDS
     **/
    RAPIDS("rapids"),
    /**
     * BAY
     **/
    BAY("bay"),
    /**
     * COVE
     **/
    COVE("cove"),
    /**
     * HARBOR
     **/
    HARBOR("harbor"),
    /**
     * LAGOON
     **/
    LAGOON("lagoon"),
    /**
     * CAPE
     **/
    CAPE("cape"),
    /**
     * MINERAL_HOT_SPRINGS
     **/
    MINERAL_HOT_SPRINGS("mineral_hot_springs"),
    /**
     * ISLAND
     **/
    ISLAND("island"),
    /**
     * MARSH_SWAMP_VLEI
     **/
    MARSH_SWAMP_VLEI("marsh_swamp_vlei"),
    /**
     * RIVER_CROSSING
     **/
    RIVER_CROSSING("river_crossing"),
    /**
     * HILL
     **/
    HILL("hill"),
    /**
     * QUARRY
     **/
    QUARRY("quarry"),
    /**
     * MEMORIAL_PLACE
     **/
    MEMORIAL_PLACE("memorial_place"),
    /**
     * ADMIN_FEATURE
     **/
    ADMIN_FEATURE("admin_feature"),
    /**
     * CONTINENT
     **/
    CONTINENT("continent"),
    /**
     * COUNTRY
     **/
    COUNTRY("country"),
    /**
     * CAPITAL
     **/
    CAPITAL("capital"),
    /**
     * CAPITAL_CITY
     **/
    CAPITAL_CITY("capital_city"),
    /**
     * GENERAL_CITY
     **/
    GENERAL_CITY("general_city"),
    /**
     * COUNTY
     **/
    COUNTY("county"),
    /**
     * TOWN
     **/
    TOWN("town"),
    /**
     * HAMLET
     **/
    HAMLET("hamlet"),
    /**
     * NEIGHBORHOOD
     **/
    NEIGHBORHOOD("neighborhood"),
    /**
     * POSTAL_CODE
     **/
    POSTAL_CODE("postal_code"),
    /**
     * ROUTE
     **/
    ROUTE("route"),
    /**
     * STREET_ADDRESS
     **/
    STREET_ADDRESS("street_address"),
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
     * ELECTRONICS_STORE
     */
    ELECTRONICS_STORE("electronics_store"),
    /**
     * HOME_GOODS_STORE
     */
    HOME_GOODS_STORE("home_goods_store"),
    /**
     * STORE
     */
    STORE("store"),
    /**
     * GEOCODE, only used for site autocomplete
     */
    GEOCODE("geocode"),
    /**
     * ADDRESS, only used for site autocomplete
     */
    ADDRESS("address"),
    /**
     * ESTABLISHMENT, only used for site autocomplete
     */
    ESTABLISHMENT("establishment"),
    /**
     * REGIONS, only used for site autocomplete
     */
    REGIONS("regions"),
    /**
     * CITIES, only used for site autocomplete
     */
    CITIES("cities");

    private String locType;

    HwLocationType(String locType) {
        this.locType = locType;
    }

    /**
     * returen value
     *
     * @return responding value
     */
    public String value() {
        return locType;
    }

    public String getLocType() {
        return locType;
    }
}
