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
import Foundation

/// Delegate for events on HMSMapView.
public protocol HMSMapViewDelegate: AnyObject {

    /**
     * Called before the camera on the map changes, either due to a gesture, animation (e.g., by a user
     * tapping on the "My Location" button) or by being updated explicitly via the camera or a
     * zero-length animation on layer.
     *
     * @param mapView The map view that was tapped.
    */
    func mapView(willMove mapView: HMSMapView)

    /**
     * Called after the camera on the map changes, either due to a gesture, animation (e.g., by a user
     * tapping on the "My Location" button) or by being updated explicitly via the camera or a
     * zero-length animation on layer.
     *
     * @param mapView The map view that was tapped.
    */
    func mapView(didMove mapView: HMSMapView)

    /**
     * Called after a tap gesture at a particular coordinate, but only if a marker was not tapped.  This
     * is called before deselecting any currently selected marker (the implicit action for tapping on
     * the map).
     */
    func mapView(_ mapView: HMSMapView, didTapAt coordinate: CLLocationCoordinate2D)

    /**
     * Called after a long-press gesture at a particular coordinate.
     *
     * @param mapView The map view that was tapped.
     * @param coordinate The location that was tapped.
     */
    func mapView(_ mapView: HMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D)

    /**
     * Called after a marker has been tapped.
     *
     * @param mapView The map view that was tapped.
     * @param marker The marker that was tapped.
     */
    func mapView(_ mapView: HMSMapView, didTap marker: HMSMarker)

    /**
     * Called after a marker's info window has been tapped.
     */
    func mapView(_ mapView: HMSMapView, didTapInfoWindowOf marker: HMSMarker)

}

// MARK: - Optional Functions
extension HMSMapViewDelegate {

    func mapView(willMove mapView: HMSMapView) {}

    func mapView(didMove mapView: HMSMapView) {}

    func mapView(_ mapView: HMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {}

    func mapView(_ mapView: HMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {}

    func mapView(_ mapView: HMSMapView, didTap marker: HMSMarker) {}

    func mapView(_ mapView: HMSMapView, didTapInfoWindowOf marker: HMSMarker) {}

}
