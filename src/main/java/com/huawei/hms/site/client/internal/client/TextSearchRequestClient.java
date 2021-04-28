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

import com.huawei.hms.site.client.constans.ApiInfoConstants;
import com.huawei.hms.site.client.internal.InvocationContext;
import com.huawei.hms.site.client.model.TextSearchRequest;
import com.huawei.hms.site.client.model.TextSearchResponse;

/**
 * textSearch request client
 *
 * @since 2021-01-21
 */
public class TextSearchRequestClient extends AbstractRequestClient<TextSearchRequest> {
    private static class Holder {
        private static final TextSearchRequestClient INSTANCE = new TextSearchRequestClient();
    }

    private static TextSearchRequestClient getInstance() {
        return Holder.INSTANCE;
    }

    /**
     * textSearch
     *
     * @return TextSearchResponse
     */
    public static TextSearchResponse textQuery(TextSearchRequest request) {
        return getInstance().textSearch(request);
    }

    public TextSearchResponse textSearch(TextSearchRequest request) {
        InvocationContext<TextSearchRequest> context =
            new InvocationContext<>(ApiInfoConstants.SEARCH_BY_TEXT, request);
        try {
            return send(context, TextSearchResponse.class);
        } catch (ClientAccessException ex) {
            TextSearchResponse response = new TextSearchResponse();
            response.updateReturnInfo(ex.getErrorCode());
            return response;
        }
    }
}
