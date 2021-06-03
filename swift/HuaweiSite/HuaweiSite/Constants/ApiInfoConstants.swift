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

/// Cloud-based access interface parameters
public struct ApiInfoConstants {
    
    internal enum ApiCall: String {
        /**
         * searchByText
         */
        case textSearch
        
        /**
         * nearbySearch
         */
        case nearby
        
        /**
         * detailSearch
         */
        case detailSearch
        
        /**
         * querySuggestion
         */
        case querySuggestion
        
        /**
         * queryAutoComplete
         */
        case queryAutocomplete
        
        /**
         * geocode
         */
        case geocode
        
        /**
         * reverseGeocode
         */
        case reverseGeocode
        
        /**
         * getTimezone
         */
        case getTimezone
        
        var requestMode: RequestMode{
            switch self {
            case .textSearch:
                return RequestMode.post
            case .nearby:
                return RequestMode.post
            case .detailSearch:
                return RequestMode.post
            case .querySuggestion:
                return RequestMode.post
            case .queryAutocomplete:
                return RequestMode.post
            case .geocode:
                return RequestMode.post
            case .reverseGeocode:
                return RequestMode.post
            case .getTimezone:
                return RequestMode.post
            }
        }
        
        var link: String {
            switch self {
            case .textSearch:
                return getBaseLink() + "searchByText"
            case .nearby:
                return getBaseLink() + "nearbySearch"
            case .detailSearch:
                return getBaseLink() + "searchById"
            case .querySuggestion:
                return getBaseLink() + "querySuggestion"
            case .queryAutocomplete:
                return getBaseLink() + "queryAutoComplete"
            case .geocode:
                return getBaseLink() + "geocode"
            case .reverseGeocode:
                return getBaseLink() + "reverseGeocode"
            case .getTimezone:
                return "\("mapApi")/\("v1")/\("timezoneService")/" + "getTimezone"
            }
        }
        
        private func getBaseLink() -> String {
            return ContextDataCache.shared.apiPath
        }
    }
    
}
