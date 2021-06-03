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

#import <XCTest/XCTest.h>
#import "SiteClient.h"

@interface ClientTests : XCTestCase

@end

@implementation ClientTests

//MARK: - Model Test

- (void) testTextSearchRequestModel_WhenAllParamsProvided_ParamsMustMatch{
    NSNumber *radius = [NSNumber numberWithInteger:10000];
    NSNumber *lat = [NSNumber numberWithDouble:48.8815];
    NSNumber *lng = [NSNumber numberWithDouble:2.4444];
    BOOL children = YES;
    NSNumber *pageSize = [NSNumber numberWithInt:1];
    NSNumber *pageIndex = [NSNumber numberWithInt:3];
    TextSearchRequest *request = [[TextSearchRequest alloc] initWith:@"Hotel" location:[[Coordinate alloc] initWithLat:lat lng:lng] radius:radius poiType:@"POI_TYPE" hwPoiType:@"HW_TYPE" countryCode:@"TR" language:@"TR" pageSize:pageSize pageIndex:pageIndex children:&children];
    
    XCTAssertEqual(request.query, @"Hotel");
    XCTAssertEqual(request.location.lat, lat);
    XCTAssertEqual(request.location.lng, lng);
    XCTAssertEqual(request.radius, radius);
    XCTAssertEqual(request.poiType, @"POI_TYPE");
    XCTAssertEqual(request.hwPoiType, @"HW_TYPE");
    XCTAssertEqual(request.countryCode, @"TR");
    XCTAssertEqual(request.pageSize, pageSize);
    XCTAssertEqual(request.pageIndex, pageIndex);
    XCTAssertTrue(request.children);
}

- (void) testNearbySearchRequestModel_WhenAllParamsProvided_ParamsMustMatch{
    NSNumber *radius = [NSNumber numberWithInteger:10000];
    NSNumber *lat = [NSNumber numberWithDouble:48.8815];
    NSNumber *lng = [NSNumber numberWithDouble:2.4444];
    NSNumber *pageSize = [NSNumber numberWithInt:1];
    NSNumber *pageIndex = [NSNumber numberWithInt:3];
    NearbySearchRequest *request = [[NearbySearchRequest alloc] initWithLocation:[[Coordinate alloc] initWithLat:lat lng:lng] radius:radius query:@"Hotel" pageSize:pageSize pageIndex:pageIndex poiType:@"POI_TYPE" hwPoiType:@"HW_TYPE" language:@"en"];
    
    XCTAssertEqual(request.query, @"Hotel");
    XCTAssertEqual(request.location.lat, lat);
    XCTAssertEqual(request.location.lng, lng);
    XCTAssertEqual(request.radius, radius);
    XCTAssertEqual(request.poiType, @"POI_TYPE");
    XCTAssertEqual(request.hwPoiType, @"HW_TYPE");
    XCTAssertEqual(request.language, @"en");
    XCTAssertEqual(request.pageSize, pageSize);
    XCTAssertEqual(request.pageIndex, pageIndex);
}

- (void) testDetailSearchRequestModel_WhenAllParamsProvided_ParamsMustMatch{
    BOOL children = YES;
    DetailSearchRequest *request = [[DetailSearchRequest alloc] initWithSiteId:@"siteID" language:@"en" children:&children];
    
    XCTAssertEqual(request.siteId, @"siteID");
    XCTAssertEqual(request.language, @"en");
    XCTAssertTrue(request.children);
}

- (void) testQuerySuggestionRequestModel_WhenAllParamsProvided_ParamsMustMatch{
    NSNumber *radius = [NSNumber numberWithInteger:10000];
    NSNumber *lat = [NSNumber numberWithDouble:41.300621];
    NSNumber *lng = [NSNumber numberWithDouble:2.0797638];
    NSNumber *nlat = [NSNumber numberWithDouble:41.50];
    NSNumber *nlng = [NSNumber numberWithDouble:2.181];
    NSNumber *slat = [NSNumber numberWithDouble:41.099];
    NSNumber *slng = [NSNumber numberWithDouble:2.0080];
    CoordinateBounds *bounds = [[CoordinateBounds alloc] initWith:[[Coordinate alloc] initWithLat:nlat lng:nlng] southwest:[[Coordinate alloc] initWithLat:slat lng:slng]];
    BOOL children = YES;
    NSMutableArray <NSString *> *poiTypes = [NSMutableArray arrayWithObjects:kLT_GEOCODE,kLT_ESTABLISHMENT, nil];
    QuerySuggestionRequest *request = [[QuerySuggestionRequest alloc] initWith:@"Accés a l' Aeroport" location:[[Coordinate alloc] initWithLat:lat lng:lng] radius:radius bounds:bounds poiTypes:poiTypes countryCode:@"ES" language:@"en" children:&children];
    
    XCTAssertEqual(request.bounds.northeast.lat, nlat);
    XCTAssertEqual(request.bounds.northeast.lng, nlng);
    XCTAssertEqual(request.bounds.southwest.lat, slat);
    XCTAssertEqual(request.bounds.southwest.lng, slng);
    XCTAssertEqual(request.query, @"Accés a l' Aeroport");
    XCTAssertEqual(request.location.lat, lat);
    XCTAssertEqual(request.location.lng, lng);
    XCTAssertEqual(request.radius, radius);
    XCTAssertEqual(request.language, @"en");
    XCTAssertEqual(request.countryCode, @"ES");
    XCTAssertTrue(request.children);

}

- (void) testQueryAutocompleteRequestModel_WhenAllParamsProvided_ParamsMustMatch{
    NSNumber *radius = [NSNumber numberWithInteger:10000];
    NSNumber *lat = [NSNumber numberWithDouble:41.300621];
    NSNumber *lng = [NSNumber numberWithDouble:2.0797638];
    BOOL children = YES;
    QueryAutocompleteRequest *request = [[QueryAutocompleteRequest alloc] initWith:@"Accés a l' Aeroport" location:[[Coordinate alloc] initWithLat:lat lng:lng]  radius:radius language:@"en" children:&children];
    
    XCTAssertEqual(request.query, @"Accés a l' Aeroport");
    XCTAssertEqual(request.location.lat, lat);
    XCTAssertEqual(request.location.lng, lng);
    XCTAssertEqual(request.radius, radius);
    XCTAssertEqual(request.language, @"en");
    XCTAssertTrue(request.children);
}

- (void) testGeocodeRequestModel_WhenAllParamsProvided_ParamsMustMatch{
    NSNumber *nlat = [NSNumber numberWithDouble:51.512];
    NSNumber *nlng = [NSNumber numberWithDouble:-0.0953];
    NSNumber *slat = [NSNumber numberWithDouble:50.512];
    NSNumber *slng = [NSNumber numberWithDouble:-1.0953];
    CoordinateBounds *bounds = [[CoordinateBounds alloc] initWith:[[Coordinate alloc] initWithLat:nlat lng:nlng] southwest:[[Coordinate alloc] initWithLat:slat lng:slng]];
    GeocodeRequest *request = [[GeocodeRequest alloc] initWith:@"Cleary Garden,Queen Victoria St,London" bounds:bounds language:@"en"];
    
    XCTAssertEqual(request.bounds.northeast.lat, nlat);
    XCTAssertEqual(request.bounds.northeast.lng, nlng);
    XCTAssertEqual(request.bounds.southwest.lat, slat);
    XCTAssertEqual(request.bounds.southwest.lng, slng);
    XCTAssertEqual(request.address, @"Cleary Garden,Queen Victoria St,London");
    XCTAssertEqual(request.language, @"en");
}

- (void) testReverseGeocodeRequestModel_WhenAllParamsProvided_ParamsMustMatch{
    NSNumber *lat = [NSNumber numberWithDouble:18.0527];
    NSNumber *lng = [NSNumber numberWithDouble:77.2155];
    BOOL returnPoi = YES;
    ReverseGeocodeRequest *request = [[ReverseGeocodeRequest alloc] initWith:[[Coordinate alloc] initWithLat:lat lng:lng] language:@"en" returnPoi:&returnPoi];
    
    XCTAssertEqual(request.location.lat, lat);
    XCTAssertEqual(request.location.lng, lng);
    XCTAssertEqual(request.language, @"en");
    XCTAssertTrue(request.returnPoi);
}

- (void) testTimezoneRequestModel_WhenAllParamsProvided_ParamsMustMatch{
    NSNumber *lat = [NSNumber numberWithDouble:12.242585];
    NSNumber *lng = [NSNumber numberWithDouble:30.23235];
    NSNumber *timeStampObj = [NSNumber numberWithDouble: 1577435043];
    TimezoneRequest *request = [[TimezoneRequest alloc] initWith:[[Coordinate alloc] initWithLat:lat lng:lng] timestamp:timeStampObj language:@"en"];
    
    XCTAssertEqual(request.location.lat, lat);
    XCTAssertEqual(request.location.lng, lng);
    XCTAssertEqual(request.language, @"en");
    XCTAssertEqual(timeStampObj, request.timestamp);
}

@end
