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

class ApiContextTest: XCTestCase {
    func testSetApiKey_WhenApiKeyProvided_KeysMustMatch() {
        let apiKey = "EXAMPLE_API_KEY"
        if let encodedKey = apiKey.addingPercentEncoding(withAllowedCharacters: .alphanumerics){
            let apiContext: ApiContext = ApiContext().set(apiKey: encodedKey).build()
            SiteClient.provideApiContext(with: apiContext)
            XCTAssertEqual(ContextDataCache.shared.apiKey, encodedKey)
        }
    }
    
    func testSetApiKey_WhenApiKeyIsEmptyString_KeysMustMatch() {
        let apiKey = ""
        if let encodedKey = apiKey.addingPercentEncoding(withAllowedCharacters: .alphanumerics){
            let apiContext: ApiContext = ApiContext().set(apiKey: encodedKey).build()
            SiteClient.provideApiContext(with: apiContext)
            XCTAssertEqual(ContextDataCache.shared.apiKey, encodedKey)
        }
    }
    
    func testSetApiKey_WhenConsecutiveKeysProvided_KeysMustMatch(){
        let apiKey1 = "EXAMPLE_API_KEY"
        if let encodedKey1 = apiKey1.addingPercentEncoding(withAllowedCharacters: .alphanumerics){
            let apiContext: ApiContext = ApiContext().set(apiKey: encodedKey1).build()
            SiteClient.provideApiContext(with: apiContext)
            XCTAssertEqual(ContextDataCache.shared.apiKey, encodedKey1)
        }
        
        let apiKey2 = "SOME_OTHER_API_KEY"
        if let encodedKey2 = apiKey2.addingPercentEncoding(withAllowedCharacters: .alphanumerics){
            let apiContext: ApiContext = ApiContext().set(apiKey: encodedKey2).build()
            SiteClient.provideApiContext(with: apiContext)
            XCTAssertEqual(ContextDataCache.shared.apiKey, encodedKey2)
        }
    }
    
    func testSetApiScheme_WhenApiSchemeProvided_SchemesMustMatch() {
        let apiScheme = "http"
        let apiContext: ApiContext = ApiContext().set(apiScheme: apiScheme).build()
        SiteClient.provideApiContext(with: apiContext)
        XCTAssertEqual(ContextDataCache.shared.apiScheme, apiScheme)
    }
    
    func testSetBaseURL_WhenURLProvided_UrlsMustMatch() {
        let baseURL = "EXAMPLE_BASE_URL"
        let apiContext: ApiContext = ApiContext().set(baseUrl: baseURL).build()
        SiteClient.provideApiContext(with: apiContext)
        XCTAssertEqual(ContextDataCache.shared.baseUrl, baseURL)
    }
    
    func testSetBaseURL_WhenConsecutiveURLSProvided_UrlsMustMatch() {
        let baseURL = "EXAMPLE_BASE_URL"
        let apiContext: ApiContext = ApiContext().set(baseUrl: baseURL).build()
        SiteClient.provideApiContext(with: apiContext)
        XCTAssertEqual(ContextDataCache.shared.baseUrl, baseURL)
        
        let baseURL2 = "SOME_OTHER_BASE_URL"
        let apiContext2: ApiContext = ApiContext().set(baseUrl: baseURL2).build()
        SiteClient.provideApiContext(with: apiContext2)
        XCTAssertEqual(ContextDataCache.shared.baseUrl, baseURL2)
    }
    
    
    func testSetBaseURL_WhenURLProvidedFirstThenAnotherUrlProvidedViaParameter_UrlsMustMatchWithParameter(){
        let baseURL = "EXAMPLE_BASE_URL"
        let apiContext: ApiContext = ApiContext().set(baseUrl: baseURL).build()
        SiteClient.provideApiContext(with: apiContext)
        XCTAssertEqual(ContextDataCache.shared.baseUrl, baseURL)
        
        let baseURL2 = "SOME_OTHER_BASE_URL"
        let apiContext2: ApiContext = ApiContext().set(baseUrl: baseURL2).build()
        SiteClient.provideApiContext(with: apiContext)
        XCTAssertEqual(ContextDataCache.shared.baseUrl, baseURL2)
        
        let request: TextSearchRequest = TextSearchRequest(query: "ssss")
        
        let client = TextSearchRequestClient.shared
        client.request = request
        client.apiContext = apiContext2
        
        XCTAssertTrue(client.url().contains(baseURL2))
        XCTAssertFalse(client.url().contains(baseURL))
    }
    
    func testSetBaseURL_WhenURLProvidedFirstThenAnotherUrlProvidedViaParameter_UrlsMatchWithBase(){
        let baseURL = "EXAMPLE_BASE_URL"
        let apiContext: ApiContext = ApiContext().set(baseUrl: baseURL).build()
        SiteClient.provideApiContext(with: apiContext)
        XCTAssertEqual(ContextDataCache.shared.baseUrl, baseURL)
        
        let baseURL2 = "SOME_OTHER_BASE_URL_FOR_ONE_TIME_ONLY"
        
        let request: TextSearchRequest = TextSearchRequest(query: "ssss")
        
        let clientWithOnlyRequest = TextSearchRequestClient.shared
        clientWithOnlyRequest.request = request
        let calledUrl = "\(clientWithOnlyRequest.url())"
        XCTAssertTrue(calledUrl.contains(baseURL))
        XCTAssertFalse(calledUrl.contains(baseURL2))
    }
    
    func testSetApiKey_WhenApiKeyProvidedFirstThenAnotherApiKeyProvidedViaParameter_UrlsMustMatchWithParameter(){
        let apiKey = "EXAMPLE_API_KEY"
        let apiContext: ApiContext = ApiContext().set(apiKey: apiKey).build()
        SiteClient.provideApiContext(with: apiContext)
        XCTAssertEqual(ContextDataCache.shared.apiKey, apiKey)
        
        let apiKey2 = "SOME_OTHER_API_KEY"
        let apiContext2: ApiContext = ApiContext().set(apiKey: apiKey2).build()
        SiteClient.provideApiContext(with: apiContext)
        XCTAssertEqual(ContextDataCache.shared.apiKey, apiKey2)
        
        let request: TextSearchRequest = TextSearchRequest(query: "ssss")
        
        let client = TextSearchRequestClient.shared
        client.request = request
        client.apiContext = apiContext2
        
        XCTAssertTrue(client.apiKey().contains(apiKey2))
        XCTAssertFalse(client.apiKey().contains(apiKey))
    }
    
    func testSetApiKey_WhenApiKeyProvidedFirstThenAnotherApiKeyProvidedViaParameter_KeysMatchWithBase(){
        let apiKey = "EXAMPLE_API_KEY"
        let apiContext: ApiContext = ApiContext().set(apiKey: apiKey).build()
        SiteClient.provideApiContext(with: apiContext)
        XCTAssertEqual(ContextDataCache.shared.apiKey, apiKey)
        
        let apiKeyForOneTimeOnly = "SOME_OTHER_API_KEY_FOR_ONE_TIME_ONLY"
        
        let request: TextSearchRequest = TextSearchRequest(query: "ssss")
        
        let clientWithOnlyRequest = TextSearchRequestClient.shared
        clientWithOnlyRequest.request = request
        let calledApi = "\(clientWithOnlyRequest.apiKey())"
        XCTAssertTrue(calledApi.contains(apiKey))
        XCTAssertFalse(calledApi.contains(apiKeyForOneTimeOnly))
    }
}

