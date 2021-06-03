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
@testable import HmsMap
import Nimble
import Quick
import SpecLeaks
import XCTest

class ViewControllerLeakTests: QuickSpec {
    override func spec() {
        let container = setupDependencies()

        describe("HmsMap") {
            describe("init") {
                let map = LeakTest {
                    let map = HMSMapView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
                    return map
                }
                it("must not leak") {
                    expect(map).toNot(leak())
                }
            }
        }

        describe("HmsMap") {
            describe("camera") {
                let camera = LeakTest {
                    let pos = HMSCameraPosition(latitude: 41.05, longitude: 29, zoom: 14)
                    return pos
                }
                it("must not leak") {
                    expect(camera).toNot(leak())
                }
            }
        }
    }
}
