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

/// Place Model.
public class Site: NSObject, Decodable {
    /**
     * Unique ID of a place.
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
     * Place details.
     */
    public var address: AddressDetail?
    
    /**
     * Longitude and latitude of a place.
     */
    public var location: Coordinate?
    
    /**
     * Viewport of a place.
     */
    public var viewport: CoordinateBounds?
    
    /**
     * Linear distance between a predicted place and the location specified by the input parameter location, in meters.
     */
    public var distance: Double?
    
    /**
     * POI of a place.
     */
    public var poi: Poi?
    
    /**
     * Autocomplete place description.
     */
    public var prediction: AutoCompletePrediction?
    
    /**
     * Difference between the time zone of a place and the UTC time zone, in minutes.
     */
    public var utcOffset: Int?
    
    /// Tag matcher
    private enum CodingKeys: String, CodingKey {
        case siteId
        case name
        case formatAddress
        case address
        case location
        case viewport
        case distance
        case poi
        case prediction
        case utcOffset
    }
    
    /// Json to Object converter
    ///
    /// - Parameter decoder: Json Decoder Object
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.siteId = try values.decodeIfPresent(String.self, forKey: .siteId)
        self.formatAddress = try values.decodeIfPresent(String.self, forKey: .formatAddress)
        self.address = try values.decodeIfPresent(AddressDetail.self, forKey: .address)
        self.location = try values.decodeIfPresent(Coordinate.self, forKey: .location)
        self.viewport = try values.decodeIfPresent(CoordinateBounds.self, forKey: .viewport)
        self.distance = try values.decodeIfPresent(Double.self, forKey: .distance)
        self.poi = try values.decodeIfPresent(Poi.self, forKey: .poi)
        self.prediction = try values.decodeIfPresent(AutoCompletePrediction.self, forKey: .prediction)
        self.utcOffset = try values.decodeIfPresent(Int.self, forKey: .utcOffset)
    }
    
}
