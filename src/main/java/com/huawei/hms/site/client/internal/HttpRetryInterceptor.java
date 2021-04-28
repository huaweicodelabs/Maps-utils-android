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

package com.huawei.hms.site.client.internal;

import java.io.IOException;
import java.io.InterruptedIOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.Response;

/**
 * retry Interceptor
 *
 * @since 2021-01-21
 */
public class HttpRetryInterceptor implements Interceptor {
    private static final Logger LOG = LoggerFactory.getLogger(HttpRetryInterceptor.class.getName());

    /**
     * Max retry times
     */
    private int executionCount;

    /**
     * Max retry interval
     */
    private long retryInterval;

    HttpRetryInterceptor(Builder builder) {
        this.executionCount = builder.executionCount;
        this.retryInterval = builder.retryInterval;
    }

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        Response response = doRequest(chain, request);
        int retryNum = 1;
        while ((response == null || !response.isSuccessful()) && retryNum <= executionCount) {
            final long nextInterval = getRetryInterval();
            try {
                Thread.sleep(nextInterval);
            } catch (final InterruptedException e) {
                Thread.currentThread().interrupt();
                LOG.error("InterruptedException:{}", e.toString());
                throw new InterruptedIOException();
            }
            retryNum++;
            // retry the request
            if (null != response) {
                response.close();
            }
            response = doRequest(chain, request);
        }
        return response;
    }

    private Response doRequest(Chain chain, Request request) throws IOException {
        Response response = null;
        response = chain.proceed(request);
        return response;
    }

    /**
     * retry interval
     */
    public long getRetryInterval() {
        return this.retryInterval;
    }

    public static final class Builder {
        private int executionCount;

        private long retryInterval;

        public Builder() {
            executionCount = 3;
            retryInterval = 1000;
        }

        public HttpRetryInterceptor.Builder executionCount(int executionCount) {
            this.executionCount = executionCount;
            return this;
        }

        public HttpRetryInterceptor.Builder retryInterval(long retryInterval) {
            this.retryInterval = retryInterval;
            return this;
        }

        public HttpRetryInterceptor build() {
            return new HttpRetryInterceptor(this);
        }
    }

}
