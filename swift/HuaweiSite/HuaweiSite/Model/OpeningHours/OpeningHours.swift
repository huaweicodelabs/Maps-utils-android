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

/// Opening hours model
public class OpeningHours: NSObject, Decodable {
    
    /**
     * Description of weekly opening hours of a place.
     */
    public var texts: [String]?
    
    /**
     * Opening hours of a place.
     */
    public var periods: [Period]?
    
    private enum CodingKeys: String, CodingKey {
        case texts
        case periods
    }
    
    /// Json to Object converter
    ///
    /// - Parameter decoder: Json Decoder Object
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.texts = try values.decodeIfPresent([String].self, forKey: .texts)
        self.periods = try values.decodeIfPresent([Period].self, forKey: .periods)
    }
    
}
