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

/// nearbySearch request client.
public class NearbySearchRequestClient: BaseRequestClient {
    static let shared = NearbySearchRequestClient()

    /**
     * nearbySearch
     */
    private var _request: NearbySearchRequest?
    
    private override init() {
        super.init()
    }
    
    var request: NearbySearchRequest? {
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
        return ApiInfoConstants.ApiCall.nearby.requestMode
    }
    
    override public func createBodyParameters() -> [String: Any] {
        var params: [String: Any] = [:]
        guard let request = request else {
            return params
        }
        let locationParams: [String: Double] = ["lng" : request.location.lng, "lat" : request.location.lat]
        params["location"] = locationParams
        
        if let query = request.query{
            params["query"] = query
        }
        
        if let radius = request.radius{
            params["radius"] = radius
        }
        
        if let poiType = request.poiType{
            params["poiType"] = poiType.uppercased()
        }
        
        if let hwPoiType = request.hwPoiType{
            params["hwPoiType"] = hwPoiType.uppercased()
        }
        
        if let language = request.language{
            params["language"] = language
        }
        
        if let pageSize = request.pageSize{
            params["pageSize"] = pageSize
        }
        
        if let pageIndex = request.pageIndex{
            params["pageIndex"] = pageIndex
        }
        
        return params
    }
    
    public override func path() -> String {
        return ApiInfoConstants.ApiCall.nearby.link
    }
    
}

