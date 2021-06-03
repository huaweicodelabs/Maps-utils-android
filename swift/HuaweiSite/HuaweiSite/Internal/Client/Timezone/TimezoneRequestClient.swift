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

/// TimezoneRequestClient request client.
public class TimezoneRequestClient: BaseRequestClient {
    static let shared = TimezoneRequestClient()
    /**
     * TimezoneRequest
     */
    private var _request: TimezoneRequest?
    
    private override init() {
        super.init()
    }
    
    var request: TimezoneRequest? {
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
        return ApiInfoConstants.ApiCall.getTimezone.requestMode
    }
    
    override public func createBodyParameters() -> [String: Any] {
        var params: [String: Any] = [:]
        guard let request = request else {
            return params
        }
        
        let locationParams: [String: Double] = ["lng" : request.location.lng, "lat" : request.location.lat]
        params["location"] = locationParams
        
        params["timestamp"] = request.timestamp
        
        if let language = request.language{
            params["language"] = language
        }
        
        return params
    }
    
    public override func path() -> String {
        return ApiInfoConstants.ApiCall.getTimezone.link
    }
    
}
