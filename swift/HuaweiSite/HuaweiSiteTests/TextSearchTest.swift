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

class TextSearchTest: XCTestCase {
    //MARK: - Variables
    fileprivate let query = "query"
    fileprivate lazy var requestWithQuery = TextSearchRequest(query: query)
    
    
    fileprivate let location = Coordinate(lat: 50.705084999999997, lng: 3.159491)
    fileprivate let radius = 500
    fileprivate let poiType = LocationType.HOSPITAL
    fileprivate let hwPoiType = HwLocationType.HOTEL
    fileprivate let countryCode = "FR"
    fileprivate let language = "en"
    fileprivate let pageSize = 1
    fileprivate let pageIndex = 3
    fileprivate let children = true
    fileprivate lazy var requestWithAllParams = TextSearchRequest(query: query, location: location, radius: radius, poiType: poiType, hwPoiType: hwPoiType, countryCode: countryCode, language: language, pageSize: pageSize, pageIndex: pageIndex, children:children)
    
    fileprivate let requestMode = RequestMode.post
    fileprivate let paramLink = "searchByText"
}

//MARK: - Model Tests
extension TextSearchTest{
    
    func testTextSearchRequestModel_WhenOnlyQueryProvided_QueriesMustMatch() {
        XCTAssertEqual(requestWithQuery.query, query)
    }
    
    func testTextSearchRequestModel_WhenAllParamsProvided_ParamsMustMatch() {
        XCTAssertEqual(requestWithAllParams.query, query)
        XCTAssertEqual(requestWithAllParams.location!.lat, location.lat)
        XCTAssertEqual(requestWithAllParams.location!.lng, location.lng)
        XCTAssertEqual(requestWithAllParams.radius, radius)
        XCTAssertEqual(requestWithAllParams.poiType, poiType)
        XCTAssertEqual(requestWithAllParams.hwPoiType, hwPoiType)
        XCTAssertEqual(requestWithAllParams.countryCode, countryCode)
        XCTAssertEqual(requestWithAllParams.language, language)
        XCTAssertEqual(requestWithAllParams.pageSize, pageSize)
        XCTAssertEqual(requestWithAllParams.pageIndex, pageIndex)
        XCTAssertEqual(requestWithAllParams.children, children)
        
    }
}

//MARK: - Body Parameter Tests
extension TextSearchTest{
    
    func testTextSearchRequestParam_WhenOnlyQueryProvided_ParametersMustMatch() {
        let client = TextSearchRequestClient.shared
        client.request = requestWithQuery
        XCTAssertTrue(client.bodyParameters().contains(query))
    }
    
    func testTextSearchRequestParam_WhenAllParamsProvided_ParametersMustMatch() {
        let client = TextSearchRequestClient.shared
        client.request = requestWithAllParams
        XCTAssertTrue(client.bodyParameters().contains(query))
        XCTAssertTrue(client.bodyParameters().contains("\(location.lat)"))
        XCTAssertTrue(client.bodyParameters().contains("\(location.lng)"))
        XCTAssertTrue(client.bodyParameters().contains("\(radius)"))
        XCTAssertTrue(client.bodyParameters().contains(poiType.uppercased()))
        XCTAssertTrue(client.bodyParameters().contains(hwPoiType.uppercased()))
        XCTAssertTrue(client.bodyParameters().contains(countryCode))
        XCTAssertTrue(client.bodyParameters().contains(language))
        XCTAssertTrue(client.bodyParameters().contains("\(pageSize)"))
        XCTAssertTrue(client.bodyParameters().contains("\(pageIndex)"))
        XCTAssertTrue(client.bodyParameters().contains("\(children)"))
    }
}

//MARK: - Request Mode Test
extension TextSearchTest{
    func testTextSearchRequestMode_WhenClientHasBeenCreated_ModesMustMatch() {
        let mode = ApiInfoConstants.ApiCall.textSearch.requestMode
        XCTAssertEqual(requestMode, mode)
    }
}

//MARK: - Path Test
extension TextSearchTest{
    func testTextSearchLink_WhenClientHasBeenCreated_LinksMustContain() {
        let link = ApiInfoConstants.ApiCall.textSearch.link
        XCTAssertTrue(link.contains(self.paramLink))
    }
    
    func testTextSearchUrl_WhenAllParamsIncluded_LinksMustContain() {
        let client = TextSearchRequestClient.shared
        client.request = requestWithAllParams
        XCTAssertTrue(client.url().contains(self.paramLink))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.apiPath))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.apiScheme))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.baseUrl))
    }
}

//MARK: - Json Model Test
extension TextSearchTest{
    func testTextSearch_WhenAllParamsProvidedAsJson_MustConvertToObject(){
        let expectation = self.expectation(description: #function)

        MockSiteClientApi().textSearch(with: requestWithQuery){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                print(error)
                return
            }
            if let result = result {
                print(result)
                expectation.fulfill()
                XCTAssertEqual(result.returnCode, "0")
                XCTAssertEqual(result.sites?.first?.formatAddress, "320 Boulevard Gambetta, 59200 Tourcoing, France")
                XCTAssertEqual(result.totalCount, 6)
                XCTAssertEqual(result.returnDesc, "OK")
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
