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

/// textSearch request object.
public struct TextSearchRequest {
    /**
     * Search keyword.
     */
    public var query: String
    
    /**
     * Longitude and latitude to which search results need to be biased.
     */
    public var location: Coordinate?
    
    /**
     * Search radius, in meters. The value ranges from 1 to 50000. The default value is 50000.
     */
    public var radius: Int?
    
    /**
     * POI type.
     */
    public var poiType: String?
    
    /**
     * Huawei POI type. This parameter is recommended.
     * NOTE:If both hwPoiType and poiType are set, search results of hwPoiType take precedence.
     */
    public var hwPoiType: String?
    
    /**
     * Country/Region code, which complies with the ISO 3166-1 alpha-2 standard. This parameter is used to specify the
     * country/region where places are searched.
     */
    public var countryCode: String?
    
    /**
     * Language in which search results are displayed. If this parameter is not passed, the local language will be used.
     */
    public var language: String?
    
    /**
     * Number of records on each page. The value ranges from 1 to 20. The default value is 20.
     * NOTE:pageIndex * pageSize <= 60
     */
    public var pageSize: Int?
    
    /**
     * Number of the current page. The value ranges from 1 to 60. The default value is 1.
     * NOTE:pageIndex * pageSize <= 60
     */
    public var pageIndex: Int?
    
    /**
     * Indicates whether to return information about child nodes. The options are true (indicating to return all
     * information about child nodes) and false (indicating that no child information is returned). The default value is
     * false.
     */
    public var children: Bool?
    
    public init(query: String, location: Coordinate? = nil, radius: Int? = nil, poiType: String? = nil, hwPoiType: String? = nil, countryCode: String? = nil, language: String? = nil, pageSize:Int? = nil, pageIndex: Int? = nil, children: Bool? = nil) {
        self.query = query
        
        if let location = location{
            self.location = location
        }
        
        if let radius = radius{
            self.radius = radius
        }
        
        if let poiType = poiType{
            self.poiType = poiType
        }
        
        if let hwPoiType = hwPoiType{
            self.hwPoiType = hwPoiType
        }
        
        if let countryCode = countryCode{
            self.countryCode = countryCode
        }
        
        if let language = language{
            self.language = language
        }
        
        if let pageSize = pageSize{
            self.pageSize = pageSize
        }
        
        if let pageIndex = pageIndex{
            self.pageIndex = pageIndex
        }
        
        if let children = children{
            self.children = children
        }
    }
}
