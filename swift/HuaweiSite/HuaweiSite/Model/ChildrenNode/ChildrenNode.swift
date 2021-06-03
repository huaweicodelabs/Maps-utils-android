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

/// ChildrenNode model
public class ChildrenNode: NSObject, Decodable {
    
    /**
     * ID of a place.
     */
    public var siteId: String?
    
    /**
     * Name of a place.
     */
    public var name: String?
    
    /**
     * Formatted detailed address of a place.
     */
    public var formatAddress: String?
    
    /**
     * Longitude and latitude of a place.
     */
    public var location: Coordinate?
    
    /**
     * Huawei POI type.
     */
    public var hwPoiTypes: [String]?
    
    /**
     * Whether an airport terminal is a national or international terminal. The options are as follows:
     * 1：national
     * 2：international
     * 3：national and international
     */
    public var domeAndInt: String?
    
    /**
     * Whether an airport terminal is a departure or arrival terminal. The options are as follows:
     * 1：departure
     * 2：arrival
     * 3：departure and arrival
     */
    public var depAndArr: String?
    
    private enum CodingKeys: String, CodingKey {
        case siteId
        case name
        case formatAddress
        case location
        case hwPoiTypes
        case domeAndInt
        case depAndArr
    }
    
    /// Json to Object converter
    ///
    /// - Parameter decoder: Json Decoder Object
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.siteId = try values.decodeIfPresent(String.self, forKey: .siteId)
        self.name = try values.decodeIfPresent(String.self, forKey: .name)
        self.formatAddress = try values.decodeIfPresent(String.self, forKey: .formatAddress)
        self.location = try values.decodeIfPresent(Coordinate.self, forKey: .location)
        self.hwPoiTypes = try values.decodeIfPresent([String].self, forKey: .hwPoiTypes)
        self.domeAndInt = try values.decodeIfPresent(String.self, forKey: .domeAndInt)
        self.depAndArr = try values.decodeIfPresent(String.self, forKey: .depAndArr)
    }
    
}
