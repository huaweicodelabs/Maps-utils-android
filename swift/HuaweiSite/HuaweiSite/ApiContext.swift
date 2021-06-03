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

/// Default Client Config, incase of not not providing by the CP, below apis will be used.
public struct ClientConfig {
    /*
     * Default Api Scheme -> "https"
     */
    public static let ApiScheme = "https"
    /*
     * Default Base Url -> "siteapi.cloud.huawei.com"
     */
    public static let BaseUrl = "siteapi.cloud.huawei.com"
    /*
     * Default Api Path -> "\("mapApi")/\("v1")/\("siteService")/"
     */
    public static let ApiPath = "\("mapApi")/\("v1")/\("siteService")/"
    /*
     * Default Max Retry -> 3
     */
    public static let maxRetry = 3
    /*
     * Default Retry Interval -> Starts with one second then multiplies with 1.5 with each call
     */
    public static let retryInterval:TimeInterval = 1
    /*
     * If during a connection attempt the request remains idle for longer than the timeout interval, the request is considered to have timed out.
     * The default timeout interval is 60 seconds.
     */
    public static let timeoutInterval:TimeInterval = 60
}


/// ApiContext class provide you to start SiteServices.
open class ApiContext {
    
    internal static var shared = ApiContext()
    
    public init(){ }
    
    private(set) var apiScheme: String = "\(ClientConfig.ApiScheme)" {
        didSet {
            Log.info("Api Scheme changed to: \(self.apiScheme)")
        }
    }
    
    private(set) var baseUrl: String = "\(ClientConfig.BaseUrl)" {
        didSet {
            Log.info("Api Host changed to: \(self.baseUrl)")
        }
    }
    
    private(set) var maxRetry = ClientConfig.maxRetry {
        didSet {
            Log.info("Max Retry changed to: \(self.maxRetry)")
        }
    }
    
    private(set) var retryInterval = ClientConfig.retryInterval {
        didSet {
            Log.info("Retry Interval changed to: \(self.retryInterval)")
        }
    }
    
    private(set) var timeoutInterval: TimeInterval = ClientConfig.timeoutInterval {
        didSet {
            Log.info("Timeout Interval changed to: \(self.timeoutInterval)")
        }
    }
    
    private(set) var apiKey: String = ""
    
    public func set(apiScheme: String) -> ApiContext {
        ApiContext.shared.apiScheme = apiScheme
        return self
    }
    
    public func set(apiKey: String) -> ApiContext {
        ApiContext.shared.apiKey = apiKey
        return self
    }
    
    public func set(baseUrl: String) -> ApiContext {
        ApiContext.shared.baseUrl = baseUrl
        return self
    }
    
    public func set(maxRetry: Int) -> ApiContext {
        ApiContext.shared.maxRetry = maxRetry
        return self
    }
    
    public func set(retryInterval: TimeInterval) -> ApiContext {
        ApiContext.shared.retryInterval = retryInterval
        return self
    }
    
    public func set(timeoutInterval: TimeInterval) -> ApiContext {
        ApiContext.shared.timeoutInterval = timeoutInterval
        return self
    }
    
    public func build() -> ApiContext {
        return ApiContext.shared
    }
}
