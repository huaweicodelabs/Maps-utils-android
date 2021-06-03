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

/// reverseGeocode request object.
public struct ReverseGeocodeRequest {
    
    /**
     * Current location of a user.
     */
    public var location: Coordinate
    
    /**
     * Language in which search results are displayed. If this parameter is not passed, the local language will be used.
     */
    public var language: String?

    /**
     * Indicates whether to return the POI. The default value is true.
     */
    public var returnPoi: Bool?
    
    public init(location: Coordinate, language: String? = nil, returnPoi: Bool? = nil) {
        self.location = location
        
        if let language = language{
            self.language = language
        }
        
        if let returnPoi = returnPoi{
            self.returnPoi = returnPoi
        }
    }
}
