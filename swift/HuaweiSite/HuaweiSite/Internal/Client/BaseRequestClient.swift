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


/// Base Request Client class that other requests inherit from.
public class BaseRequestClient {
    /// Closure / Completion handler
    public var completion:((_ result: Any?, _ error: NSError?) -> Void)?
    
    /// ApiContext instance.
    public var _apiContext: ApiContext?
    
    /// Calls the api.
    public func call<T>(with response: T.Type) where T : BaseResponse {
        network(with: _apiContext).build { (error, data) in
            self.result(data: data, error: error, type: response)
        }
    }
    
    public func apiKey() -> String{
        if _apiContext != nil, let apiKey = self._apiContext?.apiKey, apiKey.count > 0{
            return apiKey
        }else{
            return ContextDataCache.shared.apiKey
        }
    }
    
    public func url() -> String{
        return network(with: self._apiContext).calledUrl
    }
    
    public func bodyParameters() -> String{
        if let bodyParameters = self.createBodyParameters(){
            return "\(String(describing: bodyParameters))"
        }
        return ""
    }
    
    private func network(with apiContext: ApiContext?=nil) -> SiteRequestManager{
        self._apiContext = apiContext
        let network = SiteRequestManager(path: path(), apiContext: apiContext)
        network.add(params: createParams())
        network.add(mode: requestMode())
        if let apiContext = apiContext{
            network.apiContext = apiContext
        }
        
        if let bodyData = bodyDataToJson(createBodyParameters()) {
            network.addValue("application/json", forHTTPHeaderField: "Content-Type")
            network.addValue("application/json", forHTTPHeaderField: "Accept")
            network.add(body: bodyData)
        }
        return network
    }
    
    private func createParams() -> [String: Any] {
        var params: [String: Any] = [:]
        params.merge(parameters(), uniquingKeysWith: {(_, new) in new})
        return params
    }
    
    private func bodyDataToJson(_ data: [String: Any]?) -> Data? {
        Log.info("Called body parameters: \(String(describing: createBodyParameters()))")
        guard let bodyData = data else {
            return nil
        }
        var jsonData: Data?
        if (!JSONSerialization.isValidJSONObject(data!)) {
            Log.error("body param is not a valid json object.")
        }
        do {
            
            jsonData = try JSONSerialization.data(withJSONObject: bodyData, options: [])
        } catch let error {
            Log.error("body param to json convert error: \(error.localizedDescription)")
        }
        return jsonData
    }
    
    public func requestMode() -> RequestMode {
        return RequestMode.get
    }
    
    
    public func result<T>(data: Data?, error: NSError?, type: T.Type) where T : BaseResponse{
        if let error = error {
            self.completion?(nil, error)
            return
        }
        guard let data = data else {
            return
        }
        let jsonDecode = JSONDecoder()
        do {
            let result = try jsonDecode.decode(type, from: data)
            self.completion?(result, nil)
        } catch let tryError {
            self.completion?(nil, tryError as NSError)
        }
    }
    
    
    public func createBodyParameters() -> [String: Any]? {
        return nil
    }
    
    /// Returns parameter with key value.
    ///
    /// - Returns: params
    public func parameters() -> [String: Any] {
        var params: [String: Any] = [:]
        params["key"] = apiKey()
        return params
    }
    
    /// Sets custom path in child classes.
    ///
    /// - Returns: path
    public func path() -> String {
        return ""
    }
    
}
