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

package com.huawei.hms.site.client.util;

/**
 * Verify object validity.
 *
 * @since 2021-01-21
 */
public class Preconditions {
    public static <T> void checkState(boolean state, T object) {
        if (!state) {
            throw new IllegalStateException(String.valueOf(object));
        }
    }

    public static <T> void checkArgument(boolean result, T object) {
        if (!result) {
            throw new IllegalArgumentException(String.valueOf(object));
        }
    }
}
