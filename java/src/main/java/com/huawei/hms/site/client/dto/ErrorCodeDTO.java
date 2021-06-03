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

package com.huawei.hms.site.client.dto;

import java.util.Objects;

/**
 * ErrorCodeDTO
 *
 * @since 2021-01-21
 */
public class ErrorCodeDTO {
    private final String code;

    private final String message;

    public ErrorCodeDTO(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

    public boolean equalsCode(String code) {
        return Objects.equals(this.code, code);
    }

    @Override
    public String toString() {
        return code + " : " + message;
    }
}
