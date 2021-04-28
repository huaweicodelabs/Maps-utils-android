/*
 * Copyright 2021. Huawei Technologies Co., Ltd. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.huawei.hms.site.client.model;

/**
 * Longitude and Latitude Boundary Model
 *
 * @since 2021-01-21
 */
public class CoordinateBounds {
    /**
     * Coordinates of the northeast corner.
     */
    private Coordinate northeast;

    /**
     * Coordinates of the southwest corner.
     */
    private Coordinate southwest;

    public CoordinateBounds(Coordinate northeast, Coordinate southwest) {
        this.northeast = northeast;
        this.southwest = southwest;
    }

    public Coordinate getNortheast() {
        return northeast;
    }

    public void setNortheast(Coordinate northeast) {
        this.northeast = northeast;
    }

    public Coordinate getSouthwest() {
        return southwest;
    }

    public void setSouthwest(Coordinate southwest) {
        this.southwest = southwest;
    }
}
