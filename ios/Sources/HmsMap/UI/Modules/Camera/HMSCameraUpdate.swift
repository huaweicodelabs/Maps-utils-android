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

import CoreLocation

/**
 * HMSCameraUpdate represents an update that may be applied to a HMSMapView.
 *
 * It encapsulates some logic for modifying the current camera.
 *
 * It should only be constructed using the factory helper methods below.
 */
public final class HMSCameraUpdate: NSObject {

    /**
     * Controls the camera, which defines how the map is oriented. Modification of this property is
     * instantaneous.
     */
    public var camera: HMSCameraPosition!

    /**
     * Returns a HMSCameraUpdate that sets the zoom to the specified amount.
     */
    public static func zoom(to zoom: Float) -> HMSCameraUpdate {
        let update = HMSCameraUpdate()
        update.camera = HMSCameraPosition(target: nil, zoom: zoom)
        return update
    }

    /**
     * Returns a HMSCameraUpdate that sets the camera target to the specified coordinate.
     */
    public static func setTarget(_ target: CLLocationCoordinate2D) -> HMSCameraUpdate {
        let update = HMSCameraUpdate()
        update.camera = HMSCameraPosition(target: target, zoom: nil)
        return update
    }

    /**
     * Returns a HMSCameraUpdate that sets the camera target and zoom to the specified values.
     */
    public static func setTarget(_ target: CLLocationCoordinate2D, zoom: Float) -> HMSCameraUpdate {
        let update = HMSCameraUpdate()
        update.camera = HMSCameraPosition(target: target, zoom: zoom)
        return update
    }

    /**
     * Returns a HMSCameraUpdate that sets the camera to the specified HMSCameraPosition.
     */
    public static func setCamera(_ camera: HMSCameraPosition) -> HMSCameraUpdate {
        let update = HMSCameraUpdate()
        update.camera = camera
        return update
    }

}
