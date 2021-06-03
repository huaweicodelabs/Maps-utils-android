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

internal typealias JSON = [String: Any]

/// Request management
public class SiteRequestManager {
    //MARK: - Public variables
    public typealias Completion = (_ error: NSError?, _ data: Data?) -> Void
    public var apiContext: ApiContext?{
        didSet {
            guard let apiContext = apiContext else { return }
            self.maxRetry = apiContext.maxRetry
            self.retryInterval = apiContext.retryInterval
            self.timeoutInterval = apiContext.timeoutInterval
        }
    }
    private var path: String
    private var baseUrl: String
    private var params: [String: Any]?
    private var mode: RequestMode = RequestMode.get
    private var url: String?
    private var completionHandler: Completion?
    private var bodyData: Data?
    private var headerValues: [String: String] = [:]
    public var maxRetry: Int = 3
    public var retryInterval: TimeInterval = 1
    public var timeoutInterval: TimeInterval = 1
    private let delegateQueue = DispatchQueue(label: "huawei-site-services-swift")
    
    public var calledUrl: String {
        get { return "\(String(describing: setUrlComponents(url: url).url ?? nil))" }
    }
    
    //MARK: - Initializers
    
    /// Initializes a new object with baseUrl and path.
    /// - Parameters:
    ///   - baseUrl: String value.
    ///   - path: String value.
    public init(baseUrl: String,
                path: String, apiContext: ApiContext?) {
        self.baseUrl = baseUrl
        self.path = path
        self.apiContext = apiContext
    }
    
    /// Initializes a new object with path.
    /// Base url is reached via ContextDataCache class.
    /// - Parameter path: String value.
    convenience init(path: String, apiContext: ApiContext?=nil) {
        if let apiContext = apiContext{
            self.init(baseUrl: apiContext.baseUrl , path: path, apiContext: apiContext)
        }else{
            self.init(baseUrl: ContextDataCache.shared.baseUrl , path: path, apiContext: nil)
        }
    }
    
    //MARK: - Public functions
    /// Builds the connection.
    ///
    /// - Parameter completion: Completion handler instance.
    public func build(_ completion: @escaping Completion) {
        self.completionHandler = completion
        let urlComponents = setUrlComponents(url: url)
        
        guard let url = urlComponents.url else {
            return
        }
        
        generateSession(url)
    }
    
    
    /// Sets url components.
    /// - Parameter url: String value.
    /// - Returns: URLComponents instance.
    public func setUrlComponents(url: String?) -> URLComponents {
        var urlComponents: URLComponents?
        if let url = url {
            urlComponents = URLComponents(string: url)
        }
        if urlComponents == nil {
            urlComponents = URLComponents()
            urlComponents!.scheme = "https"
            urlComponents!.host = baseUrl
            urlComponents!.path = "/" + path
        }
        if let urlQueryItems = getItems(params: params) {
            urlComponents!.queryItems = urlQueryItems
            urlComponents!.percentEncodedQuery = urlComponents?.percentEncodedQuery?.removingPercentEncoding
        }
        return urlComponents!
    }
    
    
    /// Generates session with server using Url
    ///
    /// - Parameter completion: Completion handler instance.
    public func generateSession(_ url: URL) {
        Log.info("Called Url: \(url)")
        
        var request = URLRequest(url: url)
        request.httpMethod = mode.rawValue
        
        for headerValues in headerValues {
            request.addValue(headerValues.value, forHTTPHeaderField: headerValues.key)
        }
        
        if let bodyData = bodyData {
            request.httpBody = bodyData
        }
        
        if self.timeoutInterval != 1{
            request.timeoutInterval = self.timeoutInterval
        }
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {(data, response, error) in
            if let data = data {
                guard let responseStr = String(data: data, encoding: String.Encoding.utf8) else {return}
                Log.info("Called Response: \(responseStr)")
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    self.completionHandler?(nil, data)
                }else if httpResponse.statusCode >= 500{
                    if (self.maxRetry > 0) {
                        self.delegateQueue.asyncAfter(deadline: .now() + self.retryInterval, execute: {
                            self.maxRetry = self.maxRetry - 1
                            self.retryInterval = self.retryInterval * 1.5
                            self.generateSession(url)
                        })
                    }
                }else{
                    guard let data = data else {
                        return
                    }
                    let jsonDecode = JSONDecoder()
                    do {
                        let error = try jsonDecode.decode(BaseResponse.self, from: data)
                        self.completionHandler?(ErrorType(baseResonse: error) as NSError?, nil)
                    } catch let catchError {
                        Log.error("httpResponse StatusCode: \(httpResponse.statusCode)")
                        self.completionHandler?(catchError as NSError, nil)
                    }
                }
            }
        }
        self.delegateQueue.async {
            task.resume()
        }
    }
    
    //MARK: - Internal functions.
    internal func add(params: [String: Any]) {
        self.params = params
    }
    
    internal func add(body: Data) {
        self.bodyData = body
    }
    
    internal func addValue(_ value: String, forHTTPHeaderField: String) {
        headerValues[forHTTPHeaderField] = value
    }
    
    internal func add(mode: RequestMode) {
        self.mode = mode
    }
    
    //MARK: - Private functions.
    private func getItems(params: [String: Any]?) -> [URLQueryItem]? {
        guard let params = params else {return nil}
        var queryItems = [URLQueryItem]()
        for (key, value) in params {
            queryItems.append(URLQueryItem(name: key, value: "\(value)"))
        }
        return queryItems
    }
}
