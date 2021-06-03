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

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.huawei.hms.site.client.common.ContextDataCache;
import com.huawei.hms.site.client.constans.ApiInfoConstants;
import com.huawei.hms.site.client.constans.ErrorCodeConstants;
import com.huawei.hms.site.client.dto.ApiInfoDTO;
import com.huawei.hms.site.client.dto.BaseResponseDTO;
import com.huawei.hms.site.client.dto.ErrorCodeDTO;
import com.huawei.hms.site.client.internal.HttpRetryInterceptor;
import com.huawei.hms.site.client.internal.InvocationContext;
import com.huawei.hms.site.client.util.JsonUtils;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

/**
 * Base class for processing HTTP requests.
 *
 * @since 2021-01-21
 */
public abstract class AbstractRequestClient<R> {
    private static final Logger LOG = LoggerFactory.getLogger(AbstractRequestClient.class.getName());

    /**
     * MediaType
     */
    private static MediaType JSON = MediaType.parse("application/json; charset=utf-8");

    /**
     * method type - POST
     */
    private static final String REQUEST_METHOD_POST = "POST";

    /**
     * HTTP client cache list
     */
    private static Map<String, OkHttpClient> httpClientMap = new HashMap<>();

    /**
     * Send a request
     *
     * @param context       Request Object
     * @param ResponseClass Response Object
     * @param <T>           T
     * @return Response Object
     * @throws ClientAccessException exception
     */
    protected <T extends BaseResponseDTO> T send(InvocationContext<R> context, Class<T> ResponseClass)
            throws ClientAccessException {
        Response httpResponse = null;
        try {
            buildURL(context);

            buildRequestParam(context);

            buildHttpRequest(context);

            buildHttpClient(context);

            httpResponse = context.getHttpClient().newCall(context.getHttpRequest()).execute();
            LOG.info("response code : {}", httpResponse.code());
            if (httpResponse.body() == null || httpResponse.body().contentLength() == 0) {
                throw ClientAccessException.Builder.create()
                        .setErrorCode(ErrorCodeConstants.Client.NETWORK_ERROR)
                        .setDetailExceptionMsg("response.body is null or empty.")
                        .build();
            }

            if (!httpResponse.isSuccessful()) {
                // Abnormal status code. The cloud returns only the response body of the BaseResponse structure and
                // attempts to parse the response body as a BaseResponse instance.
                String responseString = new String(httpResponse.body().bytes(), getCharsetName(httpResponse));
                BaseResponseDTO baseResponse = new Gson().fromJson(responseString, BaseResponseDTO.class);
                ErrorCodeDTO errorCode = ErrorCodeConstants.findErrorCode(baseResponse.getReturnCode());

                // Convert to ClientAccessException
                throw ClientAccessException.Builder.create()
                        .setErrorCode(errorCode)
                        .setHttpStatus(httpResponse.code())
                        .build();
            }

            String responseString = new String(httpResponse.body().bytes(), getCharsetName(httpResponse));

            T response = JsonUtils.json2Object(responseString, ResponseClass);
            return response;
        } catch (ClientAccessException ex) {
            throw ex;
        } catch (IOException ex) {
            throw ClientAccessException.Builder.create()
                    .setErrorCode(new ErrorCodeDTO(ErrorCodeConstants.Client.IO_ERROR_CODE, ex.getMessage()))
                    .build();
        } finally {
            closeHttpResponse(httpResponse);
        }
    }

    /**
     * Build URL
     */
    protected void buildURL(InvocationContext<R> context) throws MalformedURLException {
        String strUrl = ContextDataCache.getBaseUrl() + ApiInfoConstants.getUrlPath(context.getApiInfo());
        LOG.info("buildServiceURL: {}", strUrl);
        context.setUrl(new URL(strUrl));
    }

    /**
     * Construct request parameters, including QueryParam and Header.
     *
     * @param context Request Object
     */
    protected void buildRequestParam(InvocationContext<R> context) {
        context.addRequestHeader("Content-Type", "application/json; charset=UTF-8");
        context.addRequestHeader("Host", context.getUrl().getHost());
        context.addRequestQueryParam("key", ContextDataCache.getApiKey());
    }

    /**
     * Constructing an HttpRequest Instance
     *
     * @param context Request Object
     */
    protected void buildHttpRequest(InvocationContext<R> context) {
        Request.Builder requestBuilder = new Request.Builder().url(context.assembleCompleteURL());

        // Add Header
        for (Map.Entry<String, String> entry : context.getRequestHeaderMap().entrySet()) {
            if (entry.getValue() != null) {
                requestBuilder.addHeader(entry.getKey(), entry.getValue());
            }
        }

        // Adds the body of the POST request.
        if (REQUEST_METHOD_POST.equalsIgnoreCase(context.getApiInfo().getHttpMethod())
                && context.getRequest() != null) {
            String jsonString = JsonUtils.object2Json(context.getRequest());
            RequestBody requestBody = RequestBody.create(JSON, jsonString);
            requestBuilder.post(requestBody);
        }
        Request httpRequest = requestBuilder.build();
        context.setHttpRequest(httpRequest);
    }

    /**
     * Build HttpClient
     *
     * @param context Request Object
     */
    protected synchronized void buildHttpClient(InvocationContext<R> context) {
        ApiInfoDTO apiInfo = context.getApiInfo();
        // Different APIs may have different timeout intervals. Therefore, the host plus three timeout intervals is used
        // as the key value of the HttpClient instance.
        String composeKey = context.getUrl().getHost() + "_" + apiInfo.getHttpCallTimeout() + "_"
                + apiInfo.getHttpConnectTimeOut() + "_" + apiInfo.getHttpReadTimeOut();

        // Obtain the HTTP connection from the cache first.
        OkHttpClient httpClient = httpClientMap.get(composeKey);
        if (httpClient == null) {
            // If no, create an HTTPS connection.
            httpClient = buildHttpClient(apiInfo.getHttpConnectTimeOut(), apiInfo.getHttpReadTimeOut(),
                    apiInfo.getHttpCallTimeout());

            httpClientMap.put(composeKey, httpClient);
        }

        context.setHttpClient(httpClient);
    }

    /**
     * Build HttpClient
     *
     * @param connectTimeout connectTimeout
     * @param readTimeout    readTimeout
     * @return HttpClient
     */
    private OkHttpClient buildHttpClient(int connectTimeout, int readTimeout, int callTimeout) {
        HttpRetryInterceptor httpRetryInterceptor =
                new HttpRetryInterceptor.Builder().executionCount(1).retryInterval(1000).build();
        OkHttpClient.Builder httpClientBuilder = new OkHttpClient.Builder()
                // Set the read timeout.
                .readTimeout(readTimeout, TimeUnit.MILLISECONDS)
                // Set the connect timeout.
                .connectTimeout(connectTimeout, TimeUnit.MILLISECONDS)
                // Set the call timeout.
                .callTimeout(callTimeout, TimeUnit.MILLISECONDS)
                // Set the retryInterceptor.
                .addInterceptor(httpRetryInterceptor);
        return httpClientBuilder.build();
    }

    /**
     * Close Access
     */
    protected void closeHttpResponse(Response httpResponse) {
        if (null != httpResponse && null != httpResponse.body()) {
            httpResponse.body().close();
        }
    }

    protected String getCharsetName(Response response) {
        String charsetName = "UTF-8";
        if (null != response) {
            String contentType = response.headers().get("Content-Type");
            if (null != contentType) {
                int index = contentType.indexOf("charset=");
                if (index != -1) {
                    index = index + 8;
                    charsetName = contentType.substring(index);
                }
            }
        }
        return charsetName;
    }
}
