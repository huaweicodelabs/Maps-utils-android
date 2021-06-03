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

class ReverseGeocodeTest: XCTestCase {
    //MARK: - Variables
    fileprivate let location = Coordinate(lat: 50.705084999999997, lng: 3.159491)
    fileprivate lazy var requestWithlocation = ReverseGeocodeRequest(location: location)
    
    fileprivate let language = "en"
    fileprivate let returnPoi = true
    fileprivate lazy var requestWithAllParams = ReverseGeocodeRequest(location: location, language: language, returnPoi: returnPoi)
    
    fileprivate let requestMode = RequestMode.post
    fileprivate let paramLink = "reverseGeocode"
}

//MARK: - Model Tests
extension ReverseGeocodeTest{
    
    func testReverseGeocodeRequestModel_WhenOnlylocationProvided_QueriesMustMatch() {
        XCTAssertEqual(requestWithlocation.location.lat, location.lat)
        XCTAssertEqual(requestWithlocation.location.lng, location.lng)
    }
    
    func testReverseGeocodeRequestModel_WhenAllParamsProvided_ParamsMustMatch() {
        XCTAssertEqual(requestWithAllParams.location.lat, location.lat)
        XCTAssertEqual(requestWithAllParams.location.lng, location.lng)
        XCTAssertEqual(requestWithAllParams.language, language)
        XCTAssertEqual(requestWithAllParams.returnPoi, returnPoi)
    }
}

//MARK: - Body Parameter Tests
extension ReverseGeocodeTest{
    
    func testReverseGeocodeTestRequestParam_WhenOnlylocationProvided_ParametersMustMatch() {
        let client = ReverseGeocodeRequestClient.shared
        client.request = requestWithlocation
        XCTAssertTrue(client.bodyParameters().contains("\(location.lat)"))
        XCTAssertTrue(client.bodyParameters().contains("\(location.lng)"))
    }
    
    func testReverseGeocodeTestRequestParam_WhenAllParamsProvided_ParametersMustMatch() {
        let client = ReverseGeocodeRequestClient.shared
        client.request = requestWithAllParams
        XCTAssertTrue(client.bodyParameters().contains("\(location.lat)"))
        XCTAssertTrue(client.bodyParameters().contains("\(location.lng)"))
        XCTAssertTrue(client.bodyParameters().contains(language))
        XCTAssertTrue(client.bodyParameters().contains("\(returnPoi)"))
    }
}

//MARK: - Request Mode Test
extension ReverseGeocodeTest{
    func testReverseGeocodeTestRequestMode_WhenClientHasBeenCreated_ModesMustMatch() {
        let mode = ApiInfoConstants.ApiCall.reverseGeocode.requestMode
        XCTAssertEqual(requestMode, mode)
    }
}

//MARK: - Path Test
extension ReverseGeocodeTest{
    func testReverseGeocodeTestLink_WhenClientHasBeenCreated_LinksMustContain() {
        let link = ApiInfoConstants.ApiCall.reverseGeocode.link
        XCTAssertTrue(link.contains(self.paramLink))
    }
    
    func testReverseGeocodeTestUrl_WhenAllParamsIncluded_LinksMustContain() {
        let client = ReverseGeocodeRequestClient.shared
        client.request = requestWithAllParams
        XCTAssertTrue(client.url().contains(self.paramLink))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.apiPath))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.apiScheme))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.baseUrl))
    }
}

//MARK: - Json Model Test
extension ReverseGeocodeTest{
    func testReverseGeocode_WhenAllParamsProvidedAsJson_MustConvertToObject(){
        let expectation = self.expectation(description: #function)

        MockSiteClientApi().reverseGeocode(with: requestWithAllParams){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                print(error)
                return
            }
            if let result = result {
                print(result)
                expectation.fulfill()
                XCTAssertEqual(result.returnCode, "0")
                XCTAssertEqual(result.sites?.first?.formatAddress,  "Shri Ram Commericial Vehicle Finance, Bhalki 585328, India")
                XCTAssertEqual(result.sites?.first?.address?.country,  "India")
                XCTAssertEqual(result.sites?.first?.address?.countryCode,  "IN")
                
                XCTAssertEqual(result.sites?.first?.poi?.hwPoiTypes?.first, "DIVERSIFIED_FINANCIAL_SERVICE_COMPANY")
                XCTAssertEqual(result.sites?.first?.poi?.rating, 0.0)
                XCTAssertEqual(result.sites?.first?.poi?.poiTypes?.first, "ACCOUNTING")
                XCTAssertEqual(result.returnDesc, "OK")
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
