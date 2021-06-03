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

/// nearbySearch request object.
public struct NearbySearchRequest {
    
    /**
     * Current location of a user.
     * mandatory
     */
    public var location: Coordinate
    
    /**
     * Search radius, in meters. The value ranges from 1 to 50000. The default value is 1000.
     */
    public var radius: Int?
   
    /**
     * Search keyword.
     */
    public var query: String?
    
    /**
     * Number of the current page. The value ranges from 1 to 60. The default value is 1.
     * NOTE：pageIndex * pageSize <= 60
     */
    public var pageSize: Int?
    
    /**
      * Number of records on each page. The value ranges from 1 to 20. The default value is 20.
      * NOTE：pageIndex * pageSize <= 60
      */
    public var pageIndex: Int?
    
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
     * Language in which search results are displayed. If this parameter is not passed, the local language will be used.
     */
    public var language: String?
    
    public init(location: Coordinate, radius: Int? = nil, query: String? = nil,  poiType: String? = nil, hwPoiType: String? = nil, language: String? = nil, pageSize:Int? = nil, pageIndex: Int? = nil) {
        
        self.location = location
        
        if let query = query{
            self.query = query
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
        
        if let language = language{
            self.language = language
        }
        
        if let pageSize = pageSize{
            self.pageSize = pageSize
        }
        
        if let pageIndex = pageIndex{
            self.pageIndex = pageIndex
        }
    }
}
