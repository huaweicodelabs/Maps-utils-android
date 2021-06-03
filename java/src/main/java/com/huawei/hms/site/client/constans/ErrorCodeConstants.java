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

package com.huawei.hms.site.client.constans;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.huawei.hms.site.client.dto.ErrorCodeDTO;

/**
 * Return code constant
 *
 * @since 2021-01-21
 */
public class ErrorCodeConstants {
    private static final Logger LOG = LoggerFactory.getLogger(ErrorCodeConstants.class.getName());

    /**
     * success
     */
    public static final ErrorCodeDTO SUCCESS = new ErrorCodeDTO("0", "OK");

    private static final Map<String, ErrorCodeDTO> CODE_MAP = new HashMap<>();

    private ErrorCodeConstants() {
    }

    /**
     * findErrorCode
     *
     * @param code errorCode
     * @return ErrorCodeDTO
     */
    public static ErrorCodeDTO findErrorCode(String code) {
        ErrorCodeDTO errorCode = CODE_MAP.get(code);
        if (errorCode == null) {
            LOG.error("No matching return code is found. Build a new one, code is {}.", code);
            errorCode = new ErrorCodeDTO(code, "Unknown Code - " + code);
        }

        return errorCode;
    }

    /**
     * Return code on the device side
     */
    public static class Client {
        private Client() {
        }

        /**
         * The network is abnormal.
         */
        public static final ErrorCodeDTO NETWORK_ERROR = new ErrorCodeDTO("070003", "NETWORK_ERROR");

        /**
         * I/O exception
         */
        public static final String IO_ERROR_CODE = "070004";
    }

    /**
     * Return code on the cloud side
     */
    public static class Server {
        private Server() {
        }

        /**
         * The API key or token is invalid or invalid.
         */
        public static final ErrorCodeDTO ILLEGAL_REQUEST = new ErrorCodeDTO("6", "REQUEST_DENIED");

        /**
         * The authentication service is abnormal.
         */
        public static final ErrorCodeDTO NETWORK_ERROR_WITH_SCOPE_SERVER = new ErrorCodeDTO("010001", "UNKNOWN_ERROR");

        /**
         * Incorrect certificate fingerprint.
         */
        public static final ErrorCodeDTO ILLEGAL_FINGERPRINT = new ErrorCodeDTO("010002", "REQUEST_DENIED");

        /**
         * The interface invoking permission is not available.
         */
        public static final ErrorCodeDTO MISSING_MAP_PERMISSIONS = new ErrorCodeDTO("010003", "REQUEST_DENIED");

        /**
         * The query is successful, but no record is found.
         */
        public static final ErrorCodeDTO ZERO_RESULTS = new ErrorCodeDTO("010004", "ZERO_RESULTS");

        /**
         * Authentication failed.
         */
        public static final ErrorCodeDTO REQUEST_DENIED = new ErrorCodeDTO("010005", "REQUEST_DENIED");

        /**
         * The number of API calls exceeds the quota.
         */
        public static final ErrorCodeDTO OVER_QUERY_LIMIT = new ErrorCodeDTO("010006", "OVER_QUERY_LIMIT");

        /**
         * Failed to query the location.
         */
        public static final ErrorCodeDTO QUERY_LOCATION_FAILED = new ErrorCodeDTO("010007", "INVALID_REQUEST");

        /**
         * Cross-area path planning is not supported.
         */
        public static final ErrorCodeDTO HTTP_CODE_UNAUTHORIZED = new ErrorCodeDTO("010009", "INVALID_REQUEST");

        /**
         * Parameter error.
         */
        public static final ErrorCodeDTO BUSINESS_VERIFICATION_FAILED = new ErrorCodeDTO("010010", "INVALID_REQUEST");

        /**
         * The resource is not found.
         */
        public static final ErrorCodeDTO RESOURCE_NOT_FOUND = new ErrorCodeDTO("010011", "NOT_FOUND");

        /**
         * Internal server error.
         */
        public static final ErrorCodeDTO INTERNAL_SERVER_ERROR = new ErrorCodeDTO("010012", "UNKNOWN_ERROR");

        /**
         * Invalid request signature.
         */
        public static final ErrorCodeDTO SIGNATURE_INVALID = new ErrorCodeDTO("010017", "REQUEST_DENIED");

        /**
         * The service is degraded because the server is busy.
         */
        public static final ErrorCodeDTO SEVER_BUSY = new ErrorCodeDTO("010018", "REQUEST_DENIED");

        /**
         * The interface is in arrears.
         */
        public static final ErrorCodeDTO INTERFACE_ARREARS = new ErrorCodeDTO("010024", "OVER_QUERY_LIMIT");

        /**
         * No paid package is subscribed.
         */
        public static final ErrorCodeDTO NO_PAID_PACKAGE = new ErrorCodeDTO("010027", "OVER_QUERY_LIMIT");
    }

    static {
        CODE_MAP.put(SUCCESS.getCode(), SUCCESS);
        CODE_MAP.put(Client.NETWORK_ERROR.getCode(), Client.NETWORK_ERROR);

        CODE_MAP.put(Server.ILLEGAL_REQUEST.getCode(), Server.ILLEGAL_REQUEST);
        CODE_MAP.put(Server.NETWORK_ERROR_WITH_SCOPE_SERVER.getCode(), Server.NETWORK_ERROR_WITH_SCOPE_SERVER);
        CODE_MAP.put(Server.ILLEGAL_FINGERPRINT.getCode(), Server.ILLEGAL_FINGERPRINT);
        CODE_MAP.put(Server.MISSING_MAP_PERMISSIONS.getCode(), Server.MISSING_MAP_PERMISSIONS);
        CODE_MAP.put(Server.ZERO_RESULTS.getCode(), Server.ZERO_RESULTS);
        CODE_MAP.put(Server.REQUEST_DENIED.getCode(), Server.REQUEST_DENIED);
        CODE_MAP.put(Server.OVER_QUERY_LIMIT.getCode(), Server.OVER_QUERY_LIMIT);
        CODE_MAP.put(Server.QUERY_LOCATION_FAILED.getCode(), Server.QUERY_LOCATION_FAILED);
        CODE_MAP.put(Server.HTTP_CODE_UNAUTHORIZED.getCode(), Server.HTTP_CODE_UNAUTHORIZED);
        CODE_MAP.put(Server.BUSINESS_VERIFICATION_FAILED.getCode(), Server.BUSINESS_VERIFICATION_FAILED);
        CODE_MAP.put(Server.RESOURCE_NOT_FOUND.getCode(), Server.RESOURCE_NOT_FOUND);
        CODE_MAP.put(Server.INTERNAL_SERVER_ERROR.getCode(), Server.INTERNAL_SERVER_ERROR);
        CODE_MAP.put(Server.SIGNATURE_INVALID.getCode(), Server.SIGNATURE_INVALID);
        CODE_MAP.put(Server.SEVER_BUSY.getCode(), Server.SEVER_BUSY);
        CODE_MAP.put(Server.INTERFACE_ARREARS.getCode(), Server.INTERFACE_ARREARS);
        CODE_MAP.put(Server.NO_PAID_PACKAGE.getCode(), Server.NO_PAID_PACKAGE);
    }
}
