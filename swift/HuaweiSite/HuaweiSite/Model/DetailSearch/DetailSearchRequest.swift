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

/// detailSearch request object.
public struct DetailSearchRequest {
    /**
     * ID of a place.
     */
    public var siteId: String
    
    /**
     * Language in which search results are displayed. If this parameter is not passed, the local language will be used.
     */
    public var language: String?
    
    /**
     * Indicates whether to return information about child nodes. The options are true (indicating to return the IDs of
     * child nodes) and false (indicating that no child information is returned). The default value is false.
     */
    public var children: Bool?
    
    public init(siteId: String, language: String? = nil, children: Bool? = nil) {
        self.siteId = siteId

        if let language = language{
            self.language = language
        }

        if let children = children{
            self.children = children
        }
    }
}
