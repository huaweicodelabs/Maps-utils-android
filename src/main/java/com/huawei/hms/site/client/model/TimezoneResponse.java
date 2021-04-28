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

import com.huawei.hms.site.client.dto.BaseResponseDTO;

/**
 * textSearch response object.
 *
 * @since 2021-01-21
 */
public class TimezoneResponse extends BaseResponseDTO {
    /**
     * DST offset, in seconds. If the specified timestamp is out of the DST, 0 will be returned.
     */
    private int dstOffset;

    /**
     * Time zone offset of a specified place from UTC, in seconds.
     */
    private int rawOffset;

    /**
     * Time zone ID.
     */
    private String timeZoneId;

    /**
     * Time zone name.
     */
    private String timeZoneName;

    public int getDstOffset() {
        return dstOffset;
    }

    public void setDstOffset(int dstOffset) {
        this.dstOffset = dstOffset;
    }

    public int getRawOffset() {
        return rawOffset;
    }

    public void setRawOffset(int rawOffset) {
        this.rawOffset = rawOffset;
    }

    public String getTimeZoneId() {
        return timeZoneId;
    }

    public void setTimeZoneId(String timeZoneId) {
        this.timeZoneId = timeZoneId;
    }

    public String getTimeZoneName() {
        return timeZoneName;
    }

    public void setTimeZoneName(String timeZoneName) {
        this.timeZoneName = timeZoneName;
    }
}