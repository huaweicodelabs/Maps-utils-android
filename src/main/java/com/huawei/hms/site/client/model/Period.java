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
 * site opening time segment model
 *
 * @since 2021-01-21
 */
public class Period {
    /**
     * Open time of a place.
     */
    private TimeOfWeek open;

    /**
     * Close time of a place.
     */
    private TimeOfWeek close;

    public TimeOfWeek getOpen() {
        return open;
    }

    public void setOpen(TimeOfWeek open) {
        this.open = open;
    }

    public TimeOfWeek getClose() {
        return close;
    }

    public void setClose(TimeOfWeek close) {
        this.close = close;
    }
}
