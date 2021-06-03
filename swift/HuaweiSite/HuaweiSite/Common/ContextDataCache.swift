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

/// Stores common data, such as baseUrl and apiKey.
@objc public class ContextDataCache: NSObject {
    
    public static var shared = ContextDataCache()
    
    internal var apiKey:String = ""
    internal var baseUrl:String = ClientConfig.BaseUrl
    internal var apiPath:String = ClientConfig.ApiPath
    internal var apiScheme:String = ClientConfig.ApiScheme
    public var maxRetry = ClientConfig.maxRetry
    public var retryInterval = ClientConfig.retryInterval
    public var timeoutInterval:TimeInterval = ClientConfig.timeoutInterval
    
    private override init() {}
    
    public static func set(apiContext: ApiContext?=nil) {
        guard let apiContext = apiContext else { return }
        if apiContext.apiKey.count > 0{
            ContextDataCache.shared.apiKey = apiContext.apiKey
        }
        
        ContextDataCache.shared.apiScheme = apiContext.apiScheme.count > 0 ? apiContext.apiScheme : ClientConfig.ApiScheme
        ContextDataCache.shared.baseUrl = apiContext.baseUrl.count > 0 ? apiContext.baseUrl : ClientConfig.BaseUrl
        ContextDataCache.shared.apiPath = ClientConfig.ApiPath
        ContextDataCache.shared.maxRetry = apiContext.maxRetry
        ContextDataCache.shared.retryInterval = apiContext.retryInterval
        ContextDataCache.shared.timeoutInterval = apiContext.timeoutInterval
    }
}
