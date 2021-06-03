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
import MapKit

/**
 * A marker is an icon placed at a particular point on the map's surface. A marker's icon is drawn
 * oriented against the device's screen rather than the map's surface; i.e., it will not necessarily
 * change orientation due to map rotations, tilting, or zooming.
 */
public final class HMSMarker: NSObject {

    /** Marker position. Animated. */
    public var position: CLLocationCoordinate2D!

    /**
     * Title, a short description of the overlay. Some overlays, such as markers, will display the title
     * on the map. The title is also the default accessibility text.
     */
    public var title: String?

    /** Subtitle text, shown beneath the title in the info window when selected. */
    public var subtitle: String?

    /**
     * The map this overlay is on. Setting this property will add the overlay to the map. Setting it to
     * nil removes this overlay from the map. An overlay may be active on at most one map at any given
     * time.
     */
    public var map: HMSMapView? {
        willSet {
            if newValue == nil && map != nil {
                map!.removeAnnotation(pinAnnotationView.annotation!)
            }
        }
        didSet {
            if map != nil {
                addMarker()
            }
        }
    }

    public override init() {
        super.init()
    }

    public init(position: CLLocationCoordinate2D) {
        self.position = position
        super.init()
    }

    internal init(annotation: MKAnnotation, map: HMSMapView) {
        pinAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        self.position = annotation.coordinate
        self.title = annotation.title?!
        self.subtitle = annotation.subtitle?!
        self.map = map
        super.init()
    }

    private var pinAnnotationView: MKAnnotationView!

    private func addMarker() {
        if pinAnnotationView == nil {
            let annotation = HMSAnnotation()
            annotation.coordinate = position
            annotation.title = title
            annotation.subtitle = subtitle

            pinAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        }

        map!.addAnnotation(pinAnnotationView.annotation!)
    }

}
