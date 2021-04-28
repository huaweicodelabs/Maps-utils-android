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

package com.huawei.hms.site.client.internal.client;

import org.apache.commons.lang3.StringUtils;

import com.huawei.hms.site.client.dto.ErrorCodeDTO;

/**
 * Encapsulates exceptions during interaction with the cloud.
 *
 * @since 2021-01-21
 */
public class ClientAccessException extends Exception {
    private ErrorCodeDTO errorCode;

    private int httpStatus;

    private ClientAccessException(String message) {
        super(message);
    }

    private ClientAccessException(String message, Throwable cause) {
        super(message, cause);
    }

    public ErrorCodeDTO getErrorCode() {
        return errorCode;
    }

    public int getHttpStatus() {
        return httpStatus;
    }

    public static class Builder<T> {
        private ErrorCodeDTO errorCode;

        private String detailExceptionMsg = "";

        private int httpStatus = -1;


        private Throwable cause;

        public static Builder create() {
            return new Builder();
        }

        public Builder setErrorCode(ErrorCodeDTO errorCode) {
            this.errorCode = errorCode;
            return this;
        }

        public Builder setDetailExceptionMsg(String detailExceptionMsg) {
            this.detailExceptionMsg = detailExceptionMsg;
            return this;
        }

        public Builder setHttpStatus(int httpStatus) {
            this.httpStatus = httpStatus;
            return this;
        }

        public Builder setCause(Throwable cause) {
            this.cause = cause;
            return this;
        }

        public ClientAccessException build() {
            if (StringUtils.isEmpty(detailExceptionMsg) || errorCode != null) {
                detailExceptionMsg = errorCode.toString();
            }

            ClientAccessException ex = new ClientAccessException(detailExceptionMsg, cause);
            ex.errorCode = errorCode;
            ex.httpStatus = httpStatus;

            return ex;
        }
    }
}
