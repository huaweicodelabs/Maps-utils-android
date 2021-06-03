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
 * HMSCoordinateBounds represents a rectangular bounding box on the Earth's surface.
 * HMSCoordinateBounds is immutable and can't be modified after construction.
 */
public final class HMSCoordinateBounds: NSObject {

    /** The North-East corner of these bounds. */
    private(set) var northEast: CLLocationCoordinate2D!

    /** The South-West corner of these bounds. */
    private(set) var southWest: CLLocationCoordinate2D!

    /**
     * Inits the northEast and southWest bounds corresponding to the rectangular region defined by the
     * two corners.
     *
     * It is ambiguous whether the longitude of the box extends from |coord1| to |coord2| or vice-versa;
     * the box is constructed as the smaller of the two variants, eliminating the ambiguity.
     */
    public init(coordinate coord1: CLLocationCoordinate2D, coordinate coord2: CLLocationCoordinate2D) {
        self.northEast = coord1
        self.southWest = coord2
        super.init()
    }

}
