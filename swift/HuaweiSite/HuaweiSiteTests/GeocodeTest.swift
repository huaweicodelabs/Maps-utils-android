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

import XCTest
@testable import HuaweiSite

class GeocodeTest: XCTestCase {
    //MARK: - Variables
    fileprivate let address = "Accés a l' Aeroport"
    fileprivate lazy var requestWithaddress = GeocodeRequest(address: address)
    
    
    fileprivate let coordinateBounds = CoordinateBounds(northeast: Coordinate(lat: 41.50, lng: 2.181), southwest: Coordinate(lat: 41.099, lng: 2.0080))
    fileprivate let language = "en"
    fileprivate lazy var requestWithAllParams = GeocodeRequest(address: address, bounds: coordinateBounds, language: language)
    
    fileprivate let requestMode = RequestMode.post
    fileprivate let paramLink = "geocode"
}

//MARK: - Model Tests
extension GeocodeTest{
    
    func testGeocodeRequestModel_WhenOnlyAddressProvided_QueriesMustMatch() {
        XCTAssertEqual(requestWithaddress.address, address)
    }
    
    func testGeocodeRequestModel_WhenAllParamsProvided_ParamsMustMatch() {
        XCTAssertEqual(requestWithAllParams.address, address)
        XCTAssertEqual(requestWithAllParams.language, language)
        XCTAssertEqual(requestWithAllParams.bounds?.northeast.lat, coordinateBounds.northeast.lat)
        XCTAssertEqual(requestWithAllParams.bounds?.northeast.lng, coordinateBounds.northeast.lng)
        XCTAssertEqual(requestWithAllParams.bounds?.southwest.lat, coordinateBounds.southwest.lat)
        XCTAssertEqual(requestWithAllParams.bounds?.southwest.lng, coordinateBounds.southwest.lng)
    }
}

//MARK: - Body Parameter Tests
extension GeocodeTest{
    
    func testGeocodeTestRequestParam_WhenOnlyaddressProvided_ParametersMustMatch() {
        let client = GeocodeRequestClient.shared
        client.request = requestWithaddress
        XCTAssertTrue(client.bodyParameters().contains("Accés"))
    }
    
    func testGeocodeTestRequestParam_WhenAllParamsProvided_ParametersMustMatch() {
        let client = GeocodeRequestClient.shared
        client.request = requestWithAllParams
        XCTAssertTrue(client.bodyParameters().contains("Accés"))
        XCTAssertTrue(client.bodyParameters().contains(language))
    }
}

//MARK: - Request Mode Test
extension GeocodeTest{
    func testGeocodeTestRequestMode_WhenClientHasBeenCreated_ModesMustMatch() {
        let mode = ApiInfoConstants.ApiCall.geocode.requestMode
        XCTAssertEqual(requestMode, mode)
    }
}

//MARK: - Path Test
extension GeocodeTest{
    func testGeocodeTestLink_WhenClientHasBeenCreated_LinksMustContain() {
        let link = ApiInfoConstants.ApiCall.geocode.link
        XCTAssertTrue(link.contains(self.paramLink))
    }
    
    func testGeocodeTestUrl_WhenAllParamsIncluded_LinksMustContain() {
        let client = GeocodeRequestClient.shared
        client.request = requestWithAllParams
        XCTAssertTrue(client.url().contains(self.paramLink))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.apiPath))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.apiScheme))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.baseUrl))
    }
}

//MARK: - Json Model Test
extension GeocodeTest{
    func testGeocode_WhenAllParamsProvidedAsJson_MustConvertToObject(){
        let expectation = self.expectation(description: #function)

        MockSiteClientApi().geocode(with: requestWithAllParams){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                print(error)
                return
            }
            if let result = result {
                print(result)
                expectation.fulfill()
                XCTAssertEqual(result.returnCode, "0")
                XCTAssertEqual(result.sites?.first?.formatAddress,  "London, England EC4M 6 the United Kingdom")
                XCTAssertEqual(result.sites?.first?.address?.country,  "the United Kingdom")
                XCTAssertEqual(result.sites?.first?.address?.countryCode,  "GB")
                
                XCTAssertEqual(result.sites?.first?.poi?.hwPoiTypes?.first, "HOUSEHOLD_APPLIANCE_STORE")
                XCTAssertEqual(result.sites?.first?.poi?.rating, 0.0)
                XCTAssertEqual(result.sites?.first?.poi?.poiTypes?.first, "POINT_OF_INTEREST")
                XCTAssertEqual(result.returnDesc, "OK")
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
