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

import XCTest
@testable import HuaweiSite

class NearbySearchTest: XCTestCase {
    //MARK: - Variables
    fileprivate let location = Coordinate(lat: 48.8815, lng: 2.4444)
    fileprivate lazy var requestWithLocation: NearbySearchRequest = NearbySearchRequest(location: location)
    
    fileprivate let query = "hotel"
    fileprivate let radius = 5000
    fileprivate let poiType = LocationType.HOSPITAL
    fileprivate let hwPoiType = HwLocationType.HOTEL
    fileprivate let language = "en"
    fileprivate let pageSize = 1
    fileprivate let pageIndex = 3
    fileprivate lazy var requestWithAllParams: NearbySearchRequest = NearbySearchRequest(location: location, radius: radius, query: query, poiType: poiType, hwPoiType: hwPoiType, language: language, pageSize: pageSize, pageIndex: pageIndex)
    
    fileprivate let requestMode = RequestMode.post
    fileprivate let paramLink = "nearbySearch"
}

//MARK: - Model Tests
extension NearbySearchTest{
    
    func testNearbySearchRequestModel_WhenOnlyLocationProvided_ParamsMustMatch() {
        XCTAssertEqual(requestWithLocation.location.lat, location.lat)
        XCTAssertEqual(requestWithLocation.location.lng, location.lng)
    }
    
    func testNearbySearchRequestModel_WhenAllParamsProvided_ParamsMustMatch() {
        XCTAssertEqual(requestWithAllParams.query, query)
        XCTAssertEqual(requestWithAllParams.location.lat, location.lat)
        XCTAssertEqual(requestWithAllParams.location.lng, location.lng)
        XCTAssertEqual(requestWithAllParams.radius, radius)
        XCTAssertEqual(requestWithAllParams.poiType, poiType)
        XCTAssertEqual(requestWithAllParams.hwPoiType, hwPoiType)
        XCTAssertEqual(requestWithAllParams.language, language)
        XCTAssertEqual(requestWithAllParams.pageSize, pageSize)
        XCTAssertEqual(requestWithAllParams.pageIndex, pageIndex)
    }
}

//MARK: - Body Parameter Tests
extension NearbySearchTest{

    func testNearbySearchRequestParam_WhenOnlyLocationProvided_ParametersMustMatch() {
        let client = NearbySearchRequestClient.shared
        client.request = requestWithLocation
        XCTAssertTrue(client.bodyParameters().contains("\(location.lat)"))
        XCTAssertTrue(client.bodyParameters().contains("\(location.lng)"))
    }

    func testNearbySearchRequestParam_WhenAllParamsProvided_ParametersMustMatch() {
        let client = NearbySearchRequestClient.shared
        client.request = requestWithAllParams
        XCTAssertTrue(client.bodyParameters().contains(query))
        XCTAssertTrue(client.bodyParameters().contains("\(location.lat)"))
        XCTAssertTrue(client.bodyParameters().contains("\(location.lng)"))
        XCTAssertTrue(client.bodyParameters().contains("\(radius)"))
        XCTAssertTrue(client.bodyParameters().contains(poiType.uppercased()))
        XCTAssertTrue(client.bodyParameters().contains(hwPoiType.uppercased()))
        XCTAssertTrue(client.bodyParameters().contains(language))
        XCTAssertTrue(client.bodyParameters().contains("\(pageSize)"))
        XCTAssertTrue(client.bodyParameters().contains("\(pageIndex)"))
    }
}

//MARK: - Request Mode Test
extension NearbySearchTest{
    func testNearbySearchRequestMode_WhenClientHasBeenCreated_ModesMustMatch() {
        let mode = ApiInfoConstants.ApiCall.nearby.requestMode
        XCTAssertEqual(requestMode, mode)
    }
}

//MARK: - Path Test
extension NearbySearchTest{
    func testNearbySearchLink_WhenClientHasBeenCreated_LinksMustContain() {
        let link = ApiInfoConstants.ApiCall.nearby.link
        XCTAssertTrue(link.contains(self.paramLink))
    }

    func testNearbySearchUrl_WhenAllParamsIncluded_LinksMustContain() {
        let client = NearbySearchRequestClient.shared
        client.request = requestWithAllParams
        XCTAssertTrue(client.url().contains(self.paramLink))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.apiPath))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.apiScheme))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.baseUrl))
    }
}

//MARK: - Json Model Test
extension NearbySearchTest{
    func testNearby_WhenAllParamsProvidedAsJson_MustConvertToObject(){
        let expectation = self.expectation(description: #function)

        MockSiteClientApi().nearbySearch(with: requestWithLocation){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                print(error)
                return
            }
            if let result = result {
                print(result)
                expectation.fulfill()
                XCTAssertEqual(result.returnCode, "0")
                XCTAssertEqual(result.sites?.first?.formatAddress,  "10 Rue de la Fraternité, 93230 Romainville, France")
                XCTAssertEqual(result.totalCount, 60)
                XCTAssertEqual(result.returnDesc, "OK")
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
