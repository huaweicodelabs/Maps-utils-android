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

class QuerySuggestionTest: XCTestCase {
    //MARK: - Variables
    fileprivate let query = "Accés a l' Aeroport"
    fileprivate lazy var requestWithQuery = QuerySuggestionRequest(query: query)
    
    
    fileprivate let location = Coordinate(lat: 41.300621, lng: 2.0797638)
    fileprivate let coordinateBounds = CoordinateBounds(northeast: Coordinate(lat: 41.50, lng: 2.181), southwest: Coordinate(lat: 41.099, lng: 2.0080))
    fileprivate let radius = 10000
    fileprivate let poiTypes = [LocationType.GEOCODE, LocationType.ESTABLISHMENT]
    fileprivate let countryCode = "ES"
    fileprivate let language = "en"
    fileprivate let children = true
    fileprivate lazy var requestWithAllParams = QuerySuggestionRequest(query: query, location: location, radius: radius, bounds: coordinateBounds, poiTypes: poiTypes, countryCode: countryCode, language: language, children: children)
    
    fileprivate let requestMode = RequestMode.post
    fileprivate let paramLink = "querySuggestion"
}

//MARK: - Model Tests
extension QuerySuggestionTest{
    
    func testQuerySuggestionRequestModel_WhenOnlyQueryProvided_QueriesMustMatch() {
        XCTAssertEqual(requestWithQuery.query, query)
    }
    
    func testQuerySuggestionRequestModel_WhenAllParamsProvided_ParamsMustMatch() {
        XCTAssertEqual(requestWithAllParams.query, query)
        XCTAssertEqual(requestWithAllParams.location!.lat, location.lat)
        XCTAssertEqual(requestWithAllParams.location!.lng, location.lng)
        XCTAssertEqual(requestWithAllParams.radius, radius)
        XCTAssertEqual(requestWithAllParams.poiTypes, poiTypes)
        XCTAssertEqual(requestWithAllParams.countryCode, countryCode)
        XCTAssertEqual(requestWithAllParams.language, language)
        XCTAssertEqual(requestWithAllParams.children, children)
        XCTAssertEqual(requestWithAllParams.bounds?.northeast.lat, coordinateBounds.northeast.lat)
        XCTAssertEqual(requestWithAllParams.bounds?.northeast.lng, coordinateBounds.northeast.lng)
        XCTAssertEqual(requestWithAllParams.bounds?.southwest.lat, coordinateBounds.southwest.lat)
        XCTAssertEqual(requestWithAllParams.bounds?.southwest.lng, coordinateBounds.southwest.lng)
    }
}

//MARK: - Body Parameter Tests
extension QuerySuggestionTest{
    
    func testQuerySuggestionRequestParam_WhenOnlyQueryProvided_ParametersMustMatch() {
        let client = QuerySuggestionRequestClient.shared
        client.request = requestWithQuery
        XCTAssertTrue(client.bodyParameters().contains("Accés"))
    }
    
    func testQuerySuggestionRequestParam_WhenAllParamsProvided_ParametersMustMatch() {
        let client = QuerySuggestionRequestClient.shared
        client.request = requestWithAllParams
        XCTAssertTrue(client.bodyParameters().contains("Accés"))
        XCTAssertTrue(client.bodyParameters().contains("\(location.lat)"))
        XCTAssertTrue(client.bodyParameters().contains("\(location.lng)"))
        XCTAssertTrue(client.bodyParameters().contains("\(radius)"))
        XCTAssertTrue(client.bodyParameters().contains(countryCode))
        XCTAssertTrue(client.bodyParameters().contains(language))
        XCTAssertTrue(client.bodyParameters().contains("\(children)"))
    }
}

//MARK: - Request Mode Test
extension QuerySuggestionTest{
    func testQuerySuggestionRequestMode_WhenClientHasBeenCreated_ModesMustMatch() {
        let mode = ApiInfoConstants.ApiCall.querySuggestion.requestMode
        XCTAssertEqual(requestMode, mode)
    }
}

//MARK: - Path Test
extension QuerySuggestionTest{
    func testQuerySuggestionLink_WhenClientHasBeenCreated_LinksMustContain() {
        let link = ApiInfoConstants.ApiCall.querySuggestion.link
        XCTAssertTrue(link.contains(self.paramLink))
    }
    
    func testQuerySuggestionUrl_WhenAllParamsIncluded_LinksMustContain() {
        let client = QuerySuggestionRequestClient.shared
        client.request = requestWithAllParams
        XCTAssertTrue(client.url().contains(self.paramLink))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.apiPath))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.apiScheme))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.baseUrl))
    }
}

//MARK: - Json Model Test
extension QuerySuggestionTest{
    func testQuerySuggestion_WhenAllParamsProvidedAsJson_MustConvertToObject(){
        let expectation = self.expectation(description: #function)

        MockSiteClientApi().querySuggestion(with: requestWithAllParams){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                print(error)
                return
            }
            if let result = result {
                print(result)
                expectation.fulfill()
                XCTAssertEqual(result.returnCode, "0")
                XCTAssertEqual(result.sites?.first?.formatAddress,  "el Prat de Llobregat, Spain")
                XCTAssertEqual(result.returnDesc, "OK")
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
