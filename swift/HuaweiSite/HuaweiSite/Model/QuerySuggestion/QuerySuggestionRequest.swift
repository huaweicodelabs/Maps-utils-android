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

/// querySuggestion request object.
public struct QuerySuggestionRequest {
    /**
     * Search keyword. This parameter is mandatory.
     */
    public var query: String
    
    /**
     * Longitude and latitude to which search results need to be biased.
     * NOTE:If both location and bounds are passed, the value of bounds takes precedence.
     */
    public var location: Coordinate?
    
    /**
     * Search radius, in meters. The value ranges from 1 to 50000. The default value is 50000.
     */
    public var radius: Int?
    
    /**
     * Coordinate bounds to which search results need to be biased.
     * NOTE:If both bounds and location are passed, the value of bounds takes precedence.
     */
    public var bounds: CoordinateBounds?
    
    /**
     * List of POI types.
     */
    public var poiTypes: [String]?
    
    /**
     * Country/region code, which complies with the ISO 3166-1 alpha-2 standard. This parameter is used to specify the
     * country/region where places are searched.
     */
    public var countryCode: String?
    
    /**
     * Language in which search results are displayed. If this parameter is not passed, the local language will be used.
     */
    public var language: String?

    /**
     * Indicates whether to return information about child nodes. The options are true (indicating to return the IDs of
     * child nodes) and false (indicating that no child information is returned). The default value is false.
     */
    public var children: Bool?
    
    public init(query: String, location: Coordinate? = nil, radius: Int? = nil, bounds:CoordinateBounds? = nil, poiTypes: [String]? = nil, countryCode: String? = nil, language: String? = nil, children: Bool? = nil) {
        self.query = query
        
        if let location = location{
            self.location = location
        }
        
        if let radius = radius{
            self.radius = radius
        }
        
        if let bounds = bounds{
            self.bounds = bounds
        }
        
        if let poiTypes = poiTypes{
            self.poiTypes = poiTypes
        }
        
        if let countryCode = countryCode{
            self.countryCode = countryCode
        }
        
        if let language = language{
            self.language = language
        }
        
        if let children = children{
            self.children = children
        }
    }
}
