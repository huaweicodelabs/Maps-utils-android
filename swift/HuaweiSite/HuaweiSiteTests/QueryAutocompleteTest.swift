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

class QueryAutocompleteTest: XCTestCase {
    //MARK: - Variables
    fileprivate let query = "Accés a l' Aeroport"
    fileprivate lazy var requestWithQuery = QueryAutocompleteRequest(query: query)
    
    
    fileprivate let location = Coordinate(lat: 41.300621, lng: 2.0797638)
    fileprivate let radius = 10000
    fileprivate let language = "en"
    fileprivate let children = true
    fileprivate lazy var requestWithAllParams = QueryAutocompleteRequest(query: query, location: location, radius: radius, language: language, children: children)
    
    fileprivate let requestMode = RequestMode.post
    fileprivate let paramLink = "queryAutoComplete"
}

//MARK: - Model Tests
extension QueryAutocompleteTest{
    
    func testQueryAutocompleteRequestModel_WhenOnlyQueryProvided_QueriesMustMatch() {
        XCTAssertEqual(requestWithQuery.query, query)
    }
    
    func testQueryAutocompleteRequestModel_WhenAllParamsProvided_ParamsMustMatch() {
        XCTAssertEqual(requestWithAllParams.query, query)
        XCTAssertEqual(requestWithAllParams.location!.lat, location.lat)
        XCTAssertEqual(requestWithAllParams.location!.lng, location.lng)
        XCTAssertEqual(requestWithAllParams.radius, radius)
        XCTAssertEqual(requestWithAllParams.language, language)
        XCTAssertEqual(requestWithAllParams.children, children)
    }
}

//MARK: - Body Parameter Tests
extension QueryAutocompleteTest{
    
    func testQueryAutocompleteRequestParam_WhenOnlyQueryProvided_ParametersMustMatch() {
        let client = QueryAutocompleteRequestClient.shared
        client.request = requestWithQuery
        XCTAssertTrue(client.bodyParameters().contains("Accés"))
    }
    
    func testQueryAutocompleteRequestParam_WhenAllParamsProvided_ParametersMustMatch() {
        let client = QueryAutocompleteRequestClient.shared
        client.request = requestWithAllParams
        XCTAssertTrue(client.bodyParameters().contains("Accés"))
        XCTAssertTrue(client.bodyParameters().contains("\(location.lat)"))
        XCTAssertTrue(client.bodyParameters().contains("\(location.lng)"))
        XCTAssertTrue(client.bodyParameters().contains("\(radius)"))
        XCTAssertTrue(client.bodyParameters().contains(language))
        XCTAssertTrue(client.bodyParameters().contains("\(children)"))
    }
}

//MARK: - Request Mode Test
extension QueryAutocompleteTest{
    func testQueryAutocompleteRequestMode_WhenClientHasBeenCreated_ModesMustMatch() {
        let mode = ApiInfoConstants.ApiCall.queryAutocomplete.requestMode
        XCTAssertEqual(requestMode, mode)
    }
}

//MARK: - Path Test
extension QueryAutocompleteTest{
    func testQueryAutocompleteLink_WhenClientHasBeenCreated_LinksMustContain() {
        let link = ApiInfoConstants.ApiCall.queryAutocomplete.link
        XCTAssertTrue(link.contains(self.paramLink))
    }
    
    func testQueryAutocompleteUrl_WhenAllParamsIncluded_LinksMustContain() {
        let client = QueryAutocompleteRequestClient.shared
        client.request = requestWithAllParams
        XCTAssertTrue(client.url().contains(self.paramLink))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.apiPath))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.apiScheme))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.baseUrl))
    }
}

//MARK: - Json Model Test
extension QueryAutocompleteTest{
    func testQueryAutocomplete_WhenAllParamsProvidedAsJson_MustConvertToObject(){
        let expectation = self.expectation(description: #function)

        MockSiteClientApi().queryAutocomplete(with: requestWithAllParams){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                print(error)
                return
            }
            if let result = result {
                print(result)
                expectation.fulfill()
                XCTAssertEqual(result.returnCode, "0")
                XCTAssertEqual(result.predictions?.first?.description, "hotel")
                XCTAssertEqual(result.predictions?.first?.matchedKeywords.first?.offset, 0)
                XCTAssertEqual(result.predictions?.first?.matchedKeywords.first?.value, "hotel")
                XCTAssertEqual(result.predictions?.first?.matchedWords.first?.offset, 0)
                XCTAssertEqual(result.predictions?.first?.matchedWords.first?.value, "hotel")
                XCTAssertEqual(result.sites?.first?.formatAddress,  "Kemalpaşa, Çukur Çeşme Sokak Türkiye")
                XCTAssertEqual(result.returnDesc, "OK")
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
