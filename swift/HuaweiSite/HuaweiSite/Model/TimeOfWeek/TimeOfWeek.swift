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

/// Weekly Time Model
public class TimeOfWeek: NSObject, Decodable {
    
    /**
     * 0-Sunday
     * 1-Monday
     * 2-Tuesday
     * 3-Wednesday
     * 4-Thursday
     * 5-Friday
     * 6-Saturday
     */
    public var week: Int?
    
    /**
     * 24-hour time point on a day, in hhmm format. The value ranges from 0000 to 2359.
     */
    public var time: String?
    
    private enum CodingKeys: String, CodingKey {
        case week
        case time
    }
    
    /// Json to Object converter
    ///
    /// - Parameter decoder: Json Decoder Object
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.week = try values.decodeIfPresent(Int.self, forKey: .week)
        self.time = try values.decodeIfPresent(String.self, forKey: .time)
    }
    
}
