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

/// AddressDetail model
public class AddressDetail: NSObject, Decodable {
    /**
     * Country/Region code, which complies with the ISO 3166-1 alpha-2 standard.
     */
    public var countryCode: String?
    
    /**
     * Country name.
     */
    public var country: String?
    
    /**
     * Level-1 administrative region in a country, which is generally a province or state.
     */
    public var adminArea: String?
    
    /**
     * Level-2 administrative region in a country, which is generally a city.
     */
    public var subAdminArea: String?
    
    /**
     * Level-3 administrative region of a country.
     */
    public var tertiaryAdminArea: String?
    
    /**
     * District/county to which a place belongs.
     */
    public var subLocality: String?
    
    /**
     * Level-3 administrative region in a country, which is generally a county or district.
     */
    public var locality: String?
    
    /**
     * Street.
     */
    public var thoroughfare: String?
    
    /**
     * Street number.
     */
    public var streetNumber: String?
    
    /**
     * Postal code.
     */
    public var postalCode: String?
    
    private enum CodingKeys: String, CodingKey {
        case countryCode
        case country
        case adminArea
        case subAdminArea
        case tertiaryAdminArea
        case locality
        case subLocality
        case thoroughfare
        case streetNumber
        case postalCode
    }
    
    /// Json to Object converter
    ///
    /// - Parameter decoder: Json Decoder Object
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.countryCode = try values.decodeIfPresent(String.self, forKey: .countryCode)
        self.country = try values.decodeIfPresent(String.self, forKey: .country)
        self.adminArea = try values.decodeIfPresent(String.self, forKey: .adminArea)
        self.subAdminArea = try values.decodeIfPresent(String.self, forKey: .subAdminArea)
        self.tertiaryAdminArea = try values.decodeIfPresent(String.self, forKey: .tertiaryAdminArea)
        self.locality = try values.decodeIfPresent(String.self, forKey: .locality)
        self.subLocality = try values.decodeIfPresent(String.self, forKey: .subLocality)
        self.thoroughfare = try values.decodeIfPresent(String.self, forKey: .thoroughfare)
        self.streetNumber = try values.decodeIfPresent(String.self, forKey: .streetNumber)
        self.postalCode = try values.decodeIfPresent(String.self, forKey: .postalCode)
    }
    
}
