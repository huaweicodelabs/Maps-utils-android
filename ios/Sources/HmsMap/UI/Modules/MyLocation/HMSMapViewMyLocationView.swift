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

import MapKit
import UIKit

public final class HMSMapViewMyLocationView: UIView {

    init(frame: CGRect, mapView: MKMapView) {
        super.init(frame: frame)

        self.addRound()
        self.addShadow()
        self.backgroundColor = .white

        if let userTrackingBarButtonItem = MKUserTrackingBarButtonItem(mapView: mapView).customView {
            self.addSubview(userTrackingBarButtonItem)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}