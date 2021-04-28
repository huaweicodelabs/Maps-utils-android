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

/**
 * Cloud-based access interface parameters
 *
 * @since 2021-01-21
 */
public class ApiInfoDTO {
    private ApiInfoDTO() {
    }

    /**
     * service name
     */
    private String name;

    /**
     * URL
     */
    private String url;

    /**
     * Request Method
     */
    private String httpMethod;

    /**
     * Connection timeout interval
     */
    private int httpConnectTimeOut;

    /**
     * Read timeout interval
     */
    private int httpReadTimeOut;

    /**
     * Call timeout interval
     */
    private int httpCallTimeout;

    public String getName() {
        return name;
    }

    public String getHttpMethod() {
        return httpMethod;
    }

    public int getHttpConnectTimeOut() {
        return httpConnectTimeOut;
    }

    public int getHttpReadTimeOut() {
        return httpReadTimeOut;
    }

    public int getHttpCallTimeout() {
        return httpCallTimeout;
    }

    public String getUrl() {
        return url;
    }

    public static class Builder {
        /**
         * service name
         */
        private String name;

        /**
         * URL
         */
        private String url;

        /**
         * Request Method
         */
        private String httpMethod;

        /**
         * Connection timeout interval
         */
        private int httpConnectTimeOut = 3000;

        /**
         * Read timeout interval
         */
        private int httpReadTimeOut = 2000;

        /**
         * Call timeout interval
         */
        private int httpCallTimeout = 5000;

        public Builder() {
        }

        public ApiInfoDTO builder() {
            return new ApiInfoDTO();
        }

        public static Builder create() {
            return new Builder();
        }

        public ApiInfoDTO.Builder setUrl(String url) {
            this.url = url;
            return this;
        }

        public ApiInfoDTO.Builder setName(String name) {
            this.name = name;
            return this;
        }

        public ApiInfoDTO.Builder setHttpMethod(String httpMethod) {
            this.httpMethod = httpMethod;
            return this;
        }

        public ApiInfoDTO.Builder setHttpConnectTimeOut(int httpConnectTimeOut) {
            this.httpConnectTimeOut = httpConnectTimeOut;
            return this;
        }

        public ApiInfoDTO.Builder setHttpReadTimeOut(int httpReadTimeOut) {
            this.httpReadTimeOut = httpReadTimeOut;
            return this;
        }

        public ApiInfoDTO.Builder setHttpCallTimeout(int httpCallTimeout) {
            this.httpCallTimeout = httpCallTimeout;
            return this;
        }

        public ApiInfoDTO build() {
            ApiInfoDTO apiInfo = new ApiInfoDTO();
            apiInfo.name = name;
            apiInfo.url = url;
            apiInfo.httpMethod = httpMethod;
            apiInfo.httpConnectTimeOut = httpConnectTimeOut;
            apiInfo.httpReadTimeOut = httpReadTimeOut;
            apiInfo.httpCallTimeout = httpCallTimeout;

            return apiInfo;
        }
    }

}
