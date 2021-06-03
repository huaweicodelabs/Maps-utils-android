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

import CoreGraphics
import CoreLocation

/// An immutable class that aggregates all camera position parameters.
public final class HMSCameraPosition: NSObject {

    /**
     * Location on the Earth towards which the camera points.
     */
    private(set) var target: CLLocationCoordinate2D?

    /**
     * Zoom level. Zoom uses an exponentional scale, where zoom 0 represents the entire world as a
     * 256 x 256 square. Each successive zoom level increases magnification by a factor of 2. So at
     * zoom level 1, the world is 512x512, and at zoom level 2, the entire world is 1024x1024.
     * Range between 2 and 21.
     */
    private(set) var zoom: Float? = 0

    /**
     * Bearing of the camera, in degrees clockwise from true north.
     */
    private(set) var bearing: CGFloat?

    /**
     * The angle, in degrees, of the camera from the nadir (directly facing the Earth). 0 is
     * straight down, 90 is parallel to the ground. Note that the maximum angle allowed is dependent
     * on the zoom. You can think of it as a series of line segments as a function of zoom, rather
     * than a step function. For zoom 16 and above, the maximum angle is 65 degrees. For zoom 10 and
     * below, the maximum angle is 30 degrees.
     */
    private(set) var viewingAngle: CLLocationDirection?

    /**
     * Designated initializer. Configures this HMSCameraPosition with all available camera properties.
     * Building a HMSCameraPosition via this initializer (or by the following convenience constructors)
     * will implicitly clamp camera values.
     *
     * @param target Location on the earth towards which the camera points.
     * @param zoom The zoom level near the center of the screen.
     * @param bearing Bearing of the camera in degrees clockwise from true north.
     * @param viewingAngle The angle, in degrees, of the camera angle from the nadir (directly facing
     *                     the Earth)
     */
    public init(target: CLLocationCoordinate2D?, zoom: Float?, bearing: CGFloat? = nil, viewingAngle: CLLocationDirection? = nil) {
        self.target = target
        self.zoom = zoom
        self.bearing = bearing
        self.viewingAngle = viewingAngle
        super.init()
    }

    /**
     * Designated initializer. Configures this HMSCameraPosition with all available camera properties.
     * Building a HMSCameraPosition via this initializer (or by the following convenience constructors)
     * will implicitly clamp camera values.
     *
     * @param latitude The latitude component of the location towards which the camera points.
     * @param longitude The latitude component of the location towards which the camera points.
     * @param zoom The zoom level near the center of the screen.
     * @param bearing Bearing of the camera in degrees clockwise from true north.
     * @param viewingAngle The angle, in degrees, of the camera angle from the nadir (directly facing
     *                     the Earth)
     */
    public init(latitude: CLLocationDegrees, longitude: CLLocationDegrees, zoom: Float, bearing: CGFloat? = nil, viewingAngle: CLLocationDirection? = nil) {
        self.target = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.zoom = zoom
        self.bearing = bearing
        self.viewingAngle = viewingAngle
        super.init()
    }

    public func zoom(at coordinate: CLLocationCoordinate2D, meters: CLLocationDistance, points: CGFloat) -> Float {
        guard let zoom = zoom else { return 0 }

        return zoom
    }

    /** The maximum zoom (closest to the Earth's surface) permitted by the map camera. */
    public let maxZoomValue: Float = 20

    /** The minimum zoom (farthest from the Earth's surface) permitted by the map camera. */
    public let minZoomValue: Float = 3

    public func setZoom(_ zoom: Float) {
        if zoom < minZoomValue {
            self.zoom = minZoomValue
        } else if zoom > maxZoomValue {
            self.zoom = maxZoomValue
        } else {
            self.zoom = zoom
        }
    }

    public override func isEqual(_ object: Any?) -> Bool {
        if let cameraPosition = object as? HMSCameraPosition {
            return target?.latitude == cameraPosition.target?.latitude &&
                target?.longitude == cameraPosition.target?.longitude &&
                (zoom == cameraPosition.zoom || cameraPosition.zoom == 0) &&
                (bearing == cameraPosition.bearing || cameraPosition.bearing == 0)
        }
        return false
    }

}
