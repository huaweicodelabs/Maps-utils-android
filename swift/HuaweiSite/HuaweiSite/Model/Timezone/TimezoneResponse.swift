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

/// TimezoneResponse response object.
public class TimezoneResponse: BaseResponse {
    /**
     * DST offset, in seconds. If the specified timestamp is out of the DST, 0 will be returned.
     */
    public var dstOffset: Int?
    
    /**
     * Time zone offset of a specified place from UTC, in seconds.
     */
    public var rawOffset: Int?
    
    /**
     * Time zone ID.
     */
    public var timeZoneId: String?
   
    /**
     * Time zone name.
     */
    public var timeZoneName: String?

    
    private enum CodingKeys: String, CodingKey {
        case dstOffset
        case rawOffset
        case timeZoneId
        case timeZoneName
    }
    
    /// Json to Object converter
    ///
    /// - Parameter decoder: Json Decoder Object
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.dstOffset = try values.decodeIfPresent(Int.self, forKey: .dstOffset)
        self.rawOffset = try values.decodeIfPresent(Int.self, forKey: .rawOffset)
        self.timeZoneId = try values.decodeIfPresent(String.self, forKey: .timeZoneId)
        self.timeZoneName = try values.decodeIfPresent(String.self, forKey: .timeZoneName)
        try super.init(from: decoder)
    }
    
}
