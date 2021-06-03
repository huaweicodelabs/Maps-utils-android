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

let Log = Logger(service: "HmsMap")

/// Custom Logger Class to see Api events in panel.
final class Logger {

    /// Status Types to declare success and failure scenarios.
    private struct Status {
        static let debug = "DEBUG"
        static let error = "ERROR"
        static let info = "INFO"
        static let warning = "WARNING"
    }

    /// Service Name
    private var name: String

    /// Service names must added to give more detail in panel.
    /// - Parameters:
    ///   - service: Refers to service declaration.
    init(service: String) {
        self.name = service
    }

    /// Shows error events in console.
    /// - Parameters:
    ///   - file: Refers to file name that the function is in.
    ///   - line: Refers to line number.
    ///   - name: Refers to name of the function.
    ///   - eventType: Refers to InfoType instance.
    ///   - message: Refers to message that can be added in the panel.
    ///   - function: Refers to function that will be used.
    /// - Returns: Void
    func error(file: String = #file, line: Int = #line, function: String = #function, _ message: String) {
        toConsole(file: file, line: line, function: function, message: message, level: Logger.Status.error)
    }

    /// Shows debug events in console.
    /// - Parameters:
    ///   - file: Refers to file name that the function is in.
    ///   - line: Refers to line number.
    ///   - name: Refers to name of the function.
    ///   - eventType: Refers to InfoType instance.
    ///   - message: Refers to message that can be added in the panel.
    ///   - function: Refers to function that will be used.
    /// - Returns: Void
    func debug(file: String = #file, line: Int = #line, function: String = #function, _ message: String) {
        toConsole(file: file, line: line, function: function, message: message, level: Logger.Status.debug)
    }

    /// Shows error events in console.
    /// - Parameters:
    ///   - file: Refers to file name that the function is in.
    ///   - line: Refers to line number.
    ///   - name: Refers to name of the function.
    ///   - eventType: Refers to InfoType instance.
    ///   - message: Refers to message that can be added in the panel.
    ///   - function: Refers to function that will be used.
    /// - Returns: Void
    func info(file: String = #file, line: Int = #line, function: String = #function, _ message: String) {
        toConsole(file: file, line: line, function: function, message: message, level: Logger.Status.info)
    }

    // MARK: - Private Functions

    private func toConsole(file: String = #file, line: Int = #line, function: String = #function, message: String?, level: String) {
        var text = "[\(name)]"
        text += "[\(fileName(with: file)).\(function)] \(level)"
        if let msg = message {
            text += ": \(msg)"
        }
        print(text)
    }

    private func fileName(with path: String) -> String {
        let parser = path.split(separator: "/")
        if let fileName = String(parser.last ?? "").split(separator: ".").first {
            return String(fileName)
        }
        return ""
    }
}
