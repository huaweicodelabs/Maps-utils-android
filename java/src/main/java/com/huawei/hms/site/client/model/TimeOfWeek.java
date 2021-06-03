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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Weekly Time Model
 *
 * @since 2021-01-21
 */
public class TimeOfWeek {
    private static final Logger LOG = LoggerFactory.getLogger(TimeOfWeek.class.getName());

    private static final int DAY_TIME_MIN = 0;

    private static final int DAY_MAX = 6;

    private static final int TIME_MAX = 2359;

    /**
     * 0-Sunday
     * 1-Monday
     * 2-Tuesday
     * 3-Wednesday
     * 4-Thursday
     * 5-Friday
     * 6-Saturday
     */
    private int week;

    /**
     * 24-hour time point on a day, in hhmm format. The value ranges from 0000 to 2359.
     */
    private String time;

    public TimeOfWeek() {
    }

    public static TimeOfWeek newInstance(int day, String time) {
        TimeOfWeek mTimeOfWeek = new TimeOfWeek();
        mTimeOfWeek.setDay(day);
        mTimeOfWeek.setTime(time);
        return mTimeOfWeek;
    }

    public int getDay() {
        return week;
    }

    public void setDay(int day) {
        if (day < DAY_TIME_MIN || day > DAY_MAX) {
            LOG.error("TimeOfWeek setDay param Exceeded the range");
            return;
        }
        this.week = day;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        try {
            int timeIntValue = Integer.parseInt(time);
            if (timeIntValue < DAY_TIME_MIN || timeIntValue > TIME_MAX) {
                LOG.error("TimeOfWeek setTime param Exceeded the range");
                return;
            }
        } catch (NumberFormatException e) {
            LOG.error("TimeOfWeek setTime param exception error = {}", e.getMessage());
            return;
        }
        this.time = time;
    }
}
