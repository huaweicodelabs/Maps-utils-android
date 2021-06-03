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

class DetailSearchTest: XCTestCase {
    //MARK: - Variables
    fileprivate let siteID = "EB731B7298F1E2EEDC42532CFD3B8E32"
    fileprivate lazy var requestWithSiteId = DetailSearchRequest(siteId: siteID)
    
    fileprivate let language = "en"
    fileprivate let children = true
    fileprivate lazy var requestWithAllParams = DetailSearchRequest(siteId: siteID, language: language, children: children)
    
    fileprivate let requestMode = RequestMode.post
    fileprivate let paramLink = "searchById"
}

//MARK: - Model Tests
extension DetailSearchTest{
    
    func testDetailSearchRequestModel_WhenOnlySiteIdProvided_IdsMustMatch() {
        XCTAssertEqual(requestWithSiteId.siteId, siteID)
    }
    
    func testDetailSearchRequestModel_WhenAllParamsProvided_ParamsMustMatch() {
        XCTAssertEqual(requestWithAllParams.siteId, siteID)
        XCTAssertEqual(requestWithAllParams.language, language)
        XCTAssertEqual(requestWithAllParams.children, children)
        
    }
}

//MARK: - Body Parameter Tests
extension DetailSearchTest{
    
    func testDetailSearchRequestParam_WhenOnlySiteIdProvided_ParametersMustMatch() {
        let client = DetailSearchRequestClient.shared
        client.request = requestWithSiteId
        XCTAssertTrue(client.bodyParameters().contains(siteID))
    }
    
    func testDetailSearchRequestParam_WhenAllParamsProvided_ParametersMustMatch() {
        let client = DetailSearchRequestClient.shared
        client.request = requestWithAllParams
        XCTAssertTrue(client.bodyParameters().contains(siteID))
        XCTAssertTrue(client.bodyParameters().contains(language))
        XCTAssertTrue(client.bodyParameters().contains("\(children)"))
    }
}

//MARK: - Request Mode Test
extension DetailSearchTest{
    func testDetailSearchRequestMode_WhenClientHasBeenCreated_ModesMustMatch() {
        let mode = ApiInfoConstants.ApiCall.detailSearch.requestMode
        XCTAssertEqual(requestMode, mode)
    }
}

//MARK: - Path Test
extension DetailSearchTest{
    func testDetailSearchLink_WhenClientHasBeenCreated_LinksMustContain() {
        let link = ApiInfoConstants.ApiCall.detailSearch.link
        XCTAssertTrue(link.contains(self.paramLink))
    }
    
    func testDetailSearchUrl_WhenAllParamsIncluded_LinksMustContain() {
        let client = DetailSearchRequestClient.shared
        client.request = requestWithAllParams
        XCTAssertTrue(client.url().contains(self.paramLink))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.apiPath))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.apiScheme))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.baseUrl))
    }
}

//MARK: - Json Model Test
extension DetailSearchTest{
    func testDetailSearch_WhenAllParamsProvidedAsJson_MustConvertToObject(){
        let expectation = self.expectation(description: #function)

        MockSiteClientApi().detailSearch(with: requestWithSiteId){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                print(error)
                return
            }
            if let result = result {
                print(result)
                expectation.fulfill()
                XCTAssertEqual(result.returnCode, "0")
                XCTAssertEqual(result.site!.formatAddress,  "Accés A L' Aeroport, 08820 El Prat De Llobregat, Catalonia, Spain")
                XCTAssertEqual(result.site!.address?.country,  "Spain")
                XCTAssertEqual(result.site!.address?.countryCode,  "ES")
                XCTAssertEqual(result.site!.poi?.rating,  0.0)
                XCTAssertEqual(result.site!.poi?.internationalPhone, "+34 902 404704")
                XCTAssertEqual(result.site!.poi?.childrenNodes?.first?.hwPoiTypes?.first, "PARKING_LOT_SUB")
                XCTAssertEqual(result.site!.poi?.childrenNodes?.first?.hwPoiTypes?.first, "PARKING_LOT_SUB")
                XCTAssertEqual(result.site!.poi?.childrenNodes?.first?.formatAddress, "08820 El Prat de Llobregat, Catalonia, Spain")
                XCTAssertEqual(result.site!.poi?.childrenNodes?.first?.name, "Parking Empeados")
                XCTAssertEqual(result.site!.poi?.childrenNodes?.first?.siteId, "B45ABF9C6672A468F5FF6E98FB77D385")
                XCTAssertEqual(result.site!.poi?.childrenNodes?.first?.location?.lat, 41.3072408)
                XCTAssertEqual(result.site!.poi?.childrenNodes?.first?.location?.lng, 2.0809846)
                XCTAssertEqual(result.site?.utcOffset, 60)
                XCTAssertEqual(result.returnDesc, "OK")
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
