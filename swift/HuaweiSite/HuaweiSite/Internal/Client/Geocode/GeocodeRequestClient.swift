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

/// geocode request client.
public class GeocodeRequestClient: BaseRequestClient {
    static let shared = GeocodeRequestClient()

    /**
     * geocode
     */
    private var _request: GeocodeRequest?
    
    private override init() {
        super.init()
    }
    
    var request: GeocodeRequest? {
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
        return ApiInfoConstants.ApiCall.geocode.requestMode
    }
    
    override public func createBodyParameters() -> [String: Any] {
        var params: [String: Any] = [:]
        guard let request = request else {
            return params
        }
        
        params["address"] = request.address
        
        if let bounds = request.bounds{
            let northeastParams: [String: Double] = ["lng" : bounds.northeast.lng, "lat" : bounds.northeast.lat]
            let southwestParams: [String: Double] = ["lng" : bounds.southwest.lng, "lat" : bounds.southwest.lat]
            let boundsParams: [String: Any] = ["northeast": northeastParams, "southwest": southwestParams]
            params["bounds"] = boundsParams
        }
        
        if let language = request.language{
            params["language"] = language
        }
        
        return params
    }
    
    public override func path() -> String {
        return ApiInfoConstants.ApiCall.geocode.link
    }
    
}
