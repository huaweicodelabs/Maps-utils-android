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

/// ErrorType enum which can be thrown.
public enum ErrorType: Error {
    case argError(field: String, message: String = "")
    case apiError(returnCode: String, returnDescription: String)
    case jsonError(message: String = "")
}

extension ErrorType: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .argError(let field, let message):
            return NSLocalizedString("Argument Error", comment: "\(field) is mandatory. \(message)")
        case .apiError(let returnCode, let returnDescription):
            return NSLocalizedString("API Error", comment: "returnCode: \(returnCode),returnDescription: \(returnDescription)")
        case .jsonError(let message):
            return NSLocalizedString(message, comment: "")
        }
    }
}

extension ErrorType {
    init?(baseResonse: BaseResponse) {
        if let code = baseResonse.returnCode, let description = baseResonse.returnDesc{
                self = .apiError(returnCode: code, returnDescription: description)
                return 
        }
        return nil
    }
}
