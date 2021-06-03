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

/// detailSearch request client.
public class DetailSearchRequestClient: BaseRequestClient {
    static let shared = DetailSearchRequestClient()
    /**
     * detailSearch
     */
    private var _request: DetailSearchRequest?
    
    private override init() {
        super.init()
    }
    
    var request: DetailSearchRequest? {
        get {
            return _request
        }
        
        set {
            _request = newValue
        }
    }
    
    var apiContext: ApiContext? {
        get {
            return _apiContext
        }
        
        set {
            _apiContext = newValue
        }
    }
    
    public override func requestMode() -> RequestMode {
        return ApiInfoConstants.ApiCall.detailSearch.requestMode
    }
    
    override public func createBodyParameters() -> [String: Any] {
        var params: [String: Any] = [:]
        guard let request = request else {
            return params
        }
        params["siteId"] = request.siteId
        
        if let language = request.language{
            params["language"] = language
        }
        
        if let children = request.children{
            params["children"] = children
        }
        
        return params
    }
    
    public override func path() -> String {
        return ApiInfoConstants.ApiCall.detailSearch.link
    }
    
}
