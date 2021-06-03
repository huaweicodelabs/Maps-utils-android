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
import CoreLocation

/// Site Service API
/// Before you start using the HuaweiSite SDK, you need to set apiContext instance.
/// By default,
/// - ApiScheme = "https"
/// - BaseUrl = "siteapi.cloud.huawei.com"
/// - ApiKey = "" ### Mandatory ###
/// - maxRetry = Default Max Retry for each api call-> 3
/// - retryInterval = Default Retry Interval -> Starts with one second then multiplies with 1.5 with each call
/// - timeoutInterval = If during a connection attempt the request remains idle for longer than the timeout interval, the request is considered to have timed out. The default timeout interval is 60 seconds.
///
/// ### Usage Example: ###
///
///  ````
///   SiteClient.provideApiContext(with: YOUR_API_CONTEXT_INSTANCE)
///  ````
@objc public class SiteClient: NSObject {
    public typealias CompletionHandler = (_ result: Any?, _ error: NSError?) -> Void
}

// MARK: - SiteClientProtocol
extension SiteClient: SiteClientProtocol{
    
    public static let shared = SiteClient()
    
    /// Before you start using the HuaweiSite SDK, you need to set apiContext instance.
    /// By default,
    /// - ApiScheme = "https"
    /// - BaseUrl = "siteapi.cloud.huawei.com"
    /// - ApiKey = "" ### Mandatory ###
    /// - maxRetry = Default Max Retry for each api call-> 3
    /// - retryInterval = Default Retry Interval -> Starts with one second then multiplies with 1.5 with each call
    /// - timeoutInterval = If during a connection attempt the request remains idle for longer than the timeout interval, the request is considered to have timed out. The default timeout interval is 60 seconds.
    /// - Parameter apiContext: ApiContext instance.
    public static func provideApiContext(with apiContext: ApiContext){
        if(!(apiContext.apiKey.count > 1)){
            Log.error("To activate Huawei Site Service, api key must be provided. ")
        }
        ContextDataCache.set(apiContext: apiContext)
    }
    
    /// textSearch
    /// - Parameters:
    ///   - request: TextSearchRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completionHandler: Completion Handler.
    public func textSearch(with request: TextSearchRequest, apiContext: ApiContext?=nil, completionHandler: @escaping (_ result: TextSearchResponse?, _ error: NSError?) -> Void) {
        textSearchServices(request: request, apiContext: apiContext, completionHandler: { [weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                completionHandler(nil, error)
                return
            }
            if let result = result as? TextSearchResponse{
                completionHandler(result, nil)
            }
        })
    }
    
    /// nearbySearch
    /// - Parameters:
    ///   - request: NearbySearchRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completionHandler: Completion Handler.
    public func nearbySearch(with request: NearbySearchRequest, apiContext: ApiContext?=nil, completionHandler: @escaping (_ result: NearbySearchResponse?, _ error: NSError?) -> Void) {
        nearbySearchServices(request: request, apiContext: apiContext, completionHandler: { [weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                completionHandler(nil, error)
                return
            }
            if let result = result as? NearbySearchResponse{
                completionHandler(result, nil)
            }
        })
    }
    
    /// detailSearch
    /// - Parameters:
    ///   - request: DetailSearchRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completionHandler: Completion Handler.
    public func detailSearch(with request: DetailSearchRequest, apiContext: ApiContext?=nil, completionHandler: @escaping (_ result: DetailSearchResponse?, _ error: NSError?) -> Void) {
        detailSearchServices(request: request, apiContext: apiContext, completionHandler: { [weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                completionHandler(nil, error)
                return
            }
            if let result = result as? DetailSearchResponse{
                completionHandler(result, nil)
            }
        })
    }
    
    /// querySuggestion
    /// - Parameters:
    ///   - request: QuerySuggestionRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completionHandler: Completion Handler.
    public func querySuggestion(with request: QuerySuggestionRequest, apiContext: ApiContext?=nil, completionHandler: @escaping (_ result: QuerySuggestionResponse?, _ error: NSError?) -> Void) {
        querySuggestionServices(request: request, apiContext: apiContext, completionHandler: { [weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                completionHandler(nil, error)
                return
            }
            if let result = result as? QuerySuggestionResponse{
                completionHandler(result, nil)
            }
        })
    }
    
    /// queryAutocomplete
    /// - Parameters:
    ///   - request: QueryAutocompleteRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completionHandler: Completion Handler.
    public func queryAutocomplete(with request: QueryAutocompleteRequest, apiContext: ApiContext?=nil, completionHandler: @escaping (_ result: QueryAutocompleteResponse?, _ error: NSError?) -> Void) {
        queryAutocompleteServices(request: request, apiContext: apiContext, completionHandler: { [weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                completionHandler(nil, error)
                return
            }
            if let result = result as? QueryAutocompleteResponse{
                completionHandler(result, nil)
            }
        })
    }
    
    /// geocode
    /// - Parameters:
    ///   - request: GeocodeRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completionHandler: Completion Handler.
    public func geocode(with request: GeocodeRequest, apiContext: ApiContext?=nil, completionHandler: @escaping (_ result: GeocodeResponse?, _ error: NSError?) -> Void) {
        geocode(request: request, apiContext: apiContext, completionHandler: { [weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                completionHandler(nil, error)
                return
            }
            if let result = result as? GeocodeResponse{
                completionHandler(result, nil)
            }
        })
    }
    
    /// reverseGeocode
    /// - Parameters:
    ///   - request: ReverseGeocodeRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completionHandler: Completion Handler.
    public func reverseGeocode(with request: ReverseGeocodeRequest, apiContext: ApiContext?=nil, completionHandler: @escaping (_ result: ReverseGeocodeResponse?, _ error: NSError?) -> Void) {
        reverseGeocode(request: request, apiContext: apiContext, completionHandler: { [weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                completionHandler(nil, error)
                return
            }
            if let result = result as? ReverseGeocodeResponse{
                completionHandler(result, nil)
            }
        })
    }
    
    /// timezone
    /// - Parameters:
    ///   - request: TimezoneRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completionHandler: Completion Handler.
    public func timezone(with request: TimezoneRequest, apiContext: ApiContext?=nil, completionHandler: @escaping (_ result: TimezoneResponse?, _ error: NSError?) -> Void) {
        timezone(request: request, apiContext: apiContext, completionHandler: { [weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                completionHandler(nil, error)
                return
            }
            if let result = result as? TimezoneResponse{
                completionHandler(result, nil)
            }
        })
    }
}

// MARK: - Text Search Services
extension SiteClient{
    private func textSearchServices(request: TextSearchRequest, apiContext: ApiContext?=nil, completionHandler: @escaping CompletionHandler) {
        let textSearchService = createTextSearchServices(request: request, apiContext: apiContext)
        guard let service = textSearchService else {return}
        
        service.completion = { [weak self] (result, error) in
            guard self != nil else {return}

            if let error = error {
                completionHandler(nil, error as NSError)
                return
            }
            if let serviceResult = result as? TextSearchResponse {
                completionHandler(serviceResult, nil)
            }
        }
        service.call(with: TextSearchResponse.self)
    }
    
    private func createTextSearchServices(request: TextSearchRequest, apiContext: ApiContext?=nil) -> TextSearchRequestClient? {
        let textSearchService: TextSearchRequestClient = TextSearchRequestClient.shared
        textSearchService.apiContext = apiContext
        textSearchService.request = request
        return textSearchService
    }
}

// MARK: - Nearby Search Services
extension SiteClient{
    private func nearbySearchServices(request: NearbySearchRequest, apiContext: ApiContext?=nil, completionHandler: @escaping CompletionHandler) {
        let nearbySearchService = createNearbySearchServices(request: request, apiContext: apiContext)
        guard let service = nearbySearchService else {return}
        
        service.completion = { [weak self] (result, error) in
            guard self != nil else {return}

            if let error = error {
                completionHandler(nil, error as NSError)
                return
            }
            if let serviceResult = result as? NearbySearchResponse {
                completionHandler(serviceResult, nil)
            }
        }
        service.call(with: NearbySearchResponse.self)
    }
    
    private func createNearbySearchServices(request: NearbySearchRequest, apiContext: ApiContext?=nil) -> NearbySearchRequestClient? {
        let nearBySearchService: NearbySearchRequestClient = NearbySearchRequestClient.shared
        nearBySearchService.request = request
        nearBySearchService.apiContext = apiContext
        return nearBySearchService
    }
}

// MARK: - Detail Search Services
extension SiteClient{
    private func detailSearchServices(request: DetailSearchRequest, apiContext: ApiContext?=nil, completionHandler: @escaping CompletionHandler) {
        let detailSearchService = createDetailSearchServices(request: request, apiContext: apiContext)
        guard let service = detailSearchService else {return}
        
        service.completion = { [weak self] (result, error) in
            guard self != nil else {return}

            if let error = error {
                completionHandler(nil, error as NSError)
                return
            }
            if let serviceResult = result as? DetailSearchResponse {
                completionHandler(serviceResult, nil)
            }
        }
        service.call(with: DetailSearchResponse.self)
    }
    
    private func createDetailSearchServices(request: DetailSearchRequest, apiContext: ApiContext?=nil) -> DetailSearchRequestClient? {
        let detailSearchService: DetailSearchRequestClient = DetailSearchRequestClient.shared
        detailSearchService.request = request
        detailSearchService.apiContext = apiContext
        return detailSearchService
    }
}

// MARK: - Query Suggestion Services
extension SiteClient{
    private func querySuggestionServices(request: QuerySuggestionRequest, apiContext: ApiContext?=nil, completionHandler: @escaping CompletionHandler) {
        let querySuggestionService = createQuerySuggestionServices(request: request, apiContext: apiContext)
        guard let service = querySuggestionService else {return}
        
        service.completion = { [weak self] (result, error) in
            guard self != nil else {return}

            if let error = error {
                completionHandler(nil, error as NSError)
                return
            }
            if let serviceResult = result as? QuerySuggestionResponse {
                completionHandler(serviceResult, nil)
            }
        }
        service.call(with: QuerySuggestionResponse.self)
    }
    
    private func createQuerySuggestionServices(request: QuerySuggestionRequest, apiContext: ApiContext?=nil) -> QuerySuggestionRequestClient? {
        let querySuggestionService: QuerySuggestionRequestClient = QuerySuggestionRequestClient.shared
        querySuggestionService.request = request
        querySuggestionService.apiContext = apiContext
        return querySuggestionService
    }
}

// MARK: - Query Autocomplete Services
extension SiteClient{
    private func queryAutocompleteServices(request: QueryAutocompleteRequest, apiContext: ApiContext?=nil, completionHandler: @escaping CompletionHandler) {
        let queryAutocompleteService = createQueryAutocompleteServices(request: request, apiContext: apiContext)
        guard let service = queryAutocompleteService else {return}
        
        service.completion = { [weak self] (result, error) in
            guard self != nil else {return}

            if let error = error {
                completionHandler(nil, error as NSError)
                return
            }
            if let serviceResult = result as? QueryAutocompleteResponse {
                completionHandler(serviceResult, nil)
            }
        }
        service.call(with: QueryAutocompleteResponse.self)
    }
    
    private func createQueryAutocompleteServices(request: QueryAutocompleteRequest, apiContext: ApiContext?=nil) -> QueryAutocompleteRequestClient? {
        let queryAutocompleteService: QueryAutocompleteRequestClient = QueryAutocompleteRequestClient.shared
        queryAutocompleteService.request = request
        queryAutocompleteService.apiContext = apiContext
        return queryAutocompleteService
    }
}

// MARK: - Geocode Services
extension SiteClient{
    private func geocode(request: GeocodeRequest, apiContext: ApiContext?=nil, completionHandler: @escaping CompletionHandler) {
        let geocodeService = createGeocodeServices(request: request, apiContext: apiContext)
        guard let service = geocodeService else {return}
        
        service.completion = { [weak self] (result, error) in
            guard self != nil else {return}

            if let error = error {
                completionHandler(nil, error as NSError)
                return
            }
            if let serviceResult = result as? GeocodeResponse {
                completionHandler(serviceResult, nil)
            }
        }
        service.call(with: GeocodeResponse.self)
    }
    
    private func createGeocodeServices(request: GeocodeRequest, apiContext: ApiContext?=nil) -> GeocodeRequestClient? {
        let geocodeService: GeocodeRequestClient = GeocodeRequestClient.shared
        geocodeService.request = request
        geocodeService.apiContext = apiContext
        return geocodeService
    }
}

// MARK: - Reverse Geocode Services
extension SiteClient{
    private func reverseGeocode(request: ReverseGeocodeRequest, apiContext: ApiContext?=nil, completionHandler: @escaping CompletionHandler) {
        let reverseGeocodeService = createReverseGeocodeServices(request: request, apiContext: apiContext)
        guard let service = reverseGeocodeService else {return}
        
        service.completion = { [weak self] (result, error) in
            guard self != nil else {return}

            if let error = error {
                completionHandler(nil, error as NSError)
                return
            }
            if let serviceResult = result as? ReverseGeocodeResponse {
                completionHandler(serviceResult, nil)
            }
        }
        service.call(with: ReverseGeocodeResponse.self)
    }
    
    private func createReverseGeocodeServices(request: ReverseGeocodeRequest, apiContext: ApiContext?=nil) -> ReverseGeocodeRequestClient? {
        let reverseGeocodeService: ReverseGeocodeRequestClient = ReverseGeocodeRequestClient.shared
        reverseGeocodeService.request = request
        reverseGeocodeService.apiContext = apiContext
        return reverseGeocodeService
    }
}

// MARK: - Timezone Services
extension SiteClient{
    private func timezone(request: TimezoneRequest, apiContext: ApiContext?=nil, completionHandler: @escaping CompletionHandler) {
        let timeZoneService = createTimezoneServices(request: request, apiContext: apiContext)
        guard let service = timeZoneService else {return}
        
        service.completion = { [weak self] (result, error) in
            guard self != nil else {return}

            if let error = error {
                completionHandler(nil, error as NSError)
                return
            }
            if let serviceResult = result as? TimezoneResponse {
                completionHandler(serviceResult, nil)
            }
        }
        service.call(with: TimezoneResponse.self)
    }
    
    private func createTimezoneServices(request: TimezoneRequest, apiContext: ApiContext?=nil) -> TimezoneRequestClient? {
        let timeZoneService: TimezoneRequestClient = TimezoneRequestClient.shared
        timeZoneService.request = request
        timeZoneService.apiContext = apiContext
        return timeZoneService
    }
}
