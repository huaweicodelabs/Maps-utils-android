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

/// POI Model.
public class Poi: NSObject, Decodable {
    /**
     * POI type.
     */
    public var poiTypes: [String]?
   
    /**
     * Huawei POI type.
     */
    public var hwPoiTypes: [String]?
    
    /**
     * Phone number.
     */
    public var phone: String?
    
    /**
     * International phone number.
     */
    public var internationalPhone: String?
    
    /**
     * Rating.
     */
    public var rating: Double?
    
    /**
     * Official website.
     */
    public var websiteUrl: String?
    
    /**
     * Opening hours.
     */
    public var openingHours: OpeningHours?
    
    /**
     * Photo URL.
     */
    public var photoUrls: [String]?
    
    /**
     * Price level. The value ranges from 0 to 4.
     */
    public var priceLevel: Int?
    
    /**
     * Business status of a place. The options are as follows:
     * OPEN_NOW：open
     * CLOSE_NOW：closed
     * CLOSED_TEMPORARILY：temporarily closed
     * CLOSED_PERMANENTLY：permanently closed
     */
    public var businessStatus: String?
    
    /**
     * AddressDetail model
     */
    public var childrenNodes: [ChildrenNode]?
    
    private enum CodingKeys: String, CodingKey {
        case poiTypes
        case hwPoiTypes
        case phone
        case internationalPhone
        case rating
        case websiteUrl
        case openingHours
        case photoUrls
        case priceLevel
        case businessStatus
        case childrenNodes
    }
    
    /// Json to Object converter
    ///
    /// - Parameter decoder: Json Decoder Object
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.poiTypes = try values.decodeIfPresent([String].self, forKey: .poiTypes)
        self.hwPoiTypes = try values.decodeIfPresent([String].self, forKey: .hwPoiTypes)
        self.phone = try values.decodeIfPresent(String.self, forKey: .phone)
        self.internationalPhone = try values.decodeIfPresent(String.self, forKey: .internationalPhone)
        self.rating = try values.decodeIfPresent(Double.self, forKey: .rating)
        self.websiteUrl = try values.decodeIfPresent(String.self, forKey: .websiteUrl)
        self.openingHours = try values.decodeIfPresent(OpeningHours.self, forKey: .openingHours)
        self.photoUrls = try values.decodeIfPresent([String].self, forKey: .photoUrls)
        self.priceLevel = try values.decodeIfPresent(Int.self, forKey: .priceLevel)
        self.childrenNodes = try values.decodeIfPresent([ChildrenNode].self, forKey: .childrenNodes)
    }
    
}
