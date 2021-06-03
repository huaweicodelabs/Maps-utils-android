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

/// Service Protocol for SiteClient
public protocol SiteClientProtocol: NSObjectProtocol{
    
    /// textSearch
    /// - Parameters:
    ///   - request: TextSearchRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completionHandler: Completion Handler.
    func textSearch(with request: TextSearchRequest, apiContext: ApiContext?, completionHandler: @escaping (_ result: TextSearchResponse?, _ error: NSError?) -> Void)
    
    /// nearbySearch
    /// - Parameters:
    ///   - request: NearbySearchRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completionHandler: Completion Handler.
    func nearbySearch(with request: NearbySearchRequest, apiContext: ApiContext?, completionHandler: @escaping (_ result: NearbySearchResponse?, _ error: NSError?) -> Void)
    
    /// detailSearch
    /// - Parameters:
    ///   - request: DetailSearchRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completionHandler: Completion Handler.
    func detailSearch(with request: DetailSearchRequest, apiContext: ApiContext?, completionHandler: @escaping (_ result: DetailSearchResponse?, _ error: NSError?) -> Void)
    
    /// querySuggestion
    /// - Parameters:
    ///   - request: QuerySuggestionRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completionHandler: Completion Handler.
    func querySuggestion(with request: QuerySuggestionRequest, apiContext: ApiContext?, completionHandler: @escaping (_ result: QuerySuggestionResponse?, _ error: NSError?) -> Void)
    
    /// queryAutocomplete
    /// - Parameters:
    ///   - request: QueryAutocompleteRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completionHandler: Completion Handler.
    func queryAutocomplete(with request: QueryAutocompleteRequest, apiContext: ApiContext?, completionHandler: @escaping (_ result: QueryAutocompleteResponse?, _ error: NSError?) -> Void)
    
    /// geocode
    /// - Parameters:
    ///   - request: GeocodeRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completionHandler: Completion Handler.
    func geocode(with request: GeocodeRequest, apiContext: ApiContext?, completionHandler: @escaping (_ result: GeocodeResponse?, _ error: NSError?) -> Void)
    
    /// reverseGeocode
    /// - Parameters:
    ///   - request: ReverseGeocodeRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completionHandler: Completion Handler.
    func reverseGeocode(with request: ReverseGeocodeRequest, apiContext: ApiContext?, completionHandler: @escaping (_ result: ReverseGeocodeResponse?, _ error: NSError?) -> Void)
    
    /// timezone
    /// - Parameters:
    ///   - request: TimezoneRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completionHandler: Completion Handler.
    func timezone(with request: TimezoneRequest, apiContext: ApiContext?, completionHandler: @escaping (_ result: TimezoneResponse?, _ error: NSError?) -> Void)
    
}
