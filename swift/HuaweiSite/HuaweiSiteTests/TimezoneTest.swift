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

class TimezoneTest: XCTestCase {
    //MARK: - Variables
    fileprivate let location = Coordinate(lat: 50.705084999999997, lng: 3.159491)
    fileprivate let timestamp: Int64 = 1577435043
    fileprivate lazy var requestWithlocationAndTimeStamp = TimezoneRequest(location: location, timestamp: timestamp)
    
    fileprivate let language = "en"
    fileprivate lazy var requestWithLanguage = TimezoneRequest(location: location,timestamp: timestamp, language: language)
    
    fileprivate let requestMode = RequestMode.post
    fileprivate let paramLink = "getTimezone"
}

//MARK: - Model Tests
extension TimezoneTest{
    
    func testTimezoneRequestModel_WhenOnlylocationProvided_QueriesMustMatch() {
        XCTAssertEqual(requestWithlocationAndTimeStamp.location.lat, location.lat)
        XCTAssertEqual(requestWithlocationAndTimeStamp.location.lng, location.lng)
        XCTAssertEqual(requestWithlocationAndTimeStamp.timestamp, timestamp)

    }
    
    func testTimezoneRequestModel_WhenAllParamsProvided_ParamsMustMatch() {
        XCTAssertEqual(requestWithLanguage.location.lat, location.lat)
        XCTAssertEqual(requestWithLanguage.location.lng, location.lng)
        XCTAssertEqual(requestWithLanguage.language, language)
        XCTAssertEqual(requestWithLanguage.timestamp, timestamp)
    }
}

//MARK: - Body Parameter Tests
extension TimezoneTest{
    
    func testTimezoneTestRequestParam_WhenOnlylocationProvided_ParametersMustMatch() {
        let client = TimezoneRequestClient.shared
        client.request = requestWithlocationAndTimeStamp
        XCTAssertTrue(client.bodyParameters().contains("\(location.lat)"))
        XCTAssertTrue(client.bodyParameters().contains("\(location.lng)"))
    }
    
    func testTimezoneTestRequestParam_WhenAllParamsProvided_ParametersMustMatch() {
        let client = TimezoneRequestClient.shared
        client.request = requestWithLanguage
        XCTAssertTrue(client.bodyParameters().contains("\(location.lat)"))
        XCTAssertTrue(client.bodyParameters().contains("\(location.lng)"))
        XCTAssertTrue(client.bodyParameters().contains(language))
    }
}

//MARK: - Request Mode Test
extension TimezoneTest{
    func testTimezoneTestRequestMode_WhenClientHasBeenCreated_ModesMustMatch() {
        let mode = ApiInfoConstants.ApiCall.getTimezone.requestMode
        XCTAssertEqual(requestMode, mode)
    }
}

//MARK: - Path Test
extension TimezoneTest{
    func testTimezoneTestLink_WhenClientHasBeenCreated_LinksMustContain() {
        let link = ApiInfoConstants.ApiCall.getTimezone.link
        XCTAssertTrue(link.contains(self.paramLink))
    }
    
    func testTimezoneTestUrl_WhenAllParamsIncluded_LinksMustContain() {
        let client = TimezoneRequestClient.shared
        client.request = requestWithLanguage
        XCTAssertTrue(client.url().contains(self.paramLink))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.apiScheme))
        XCTAssertTrue(client.url().contains(ContextDataCache.shared.baseUrl))
    }
}

//MARK: - Json Model Test
extension TimezoneTest{
    func testTimezone_WhenAllParamsProvidedAsJson_MustConvertToObject(){
        let expectation = self.expectation(description: #function)

        MockSiteClientApi().timezone(with: requestWithLanguage){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                print(error)
                return
            }
            if let result = result{
                print(result)
                expectation.fulfill()
                XCTAssertEqual(result.returnCode, "0")
                XCTAssertEqual(result.timeZoneName, "Central African Time")
                XCTAssertEqual(result.timeZoneId, "Africa/Khartoum")
                XCTAssertEqual(result.rawOffset, 7200)
                XCTAssertEqual(result.dstOffset, 0)
                XCTAssertEqual(result.returnDesc, "OK")

            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
