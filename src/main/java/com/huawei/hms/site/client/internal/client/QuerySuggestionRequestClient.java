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
import com.huawei.hms.site.client.model.QuerySuggestionRequest;
import com.huawei.hms.site.client.model.QuerySuggestionResponse;

/**
 * querySuggestion request client
 *
 * @since 2021-01-21
 */
public class QuerySuggestionRequestClient extends AbstractRequestClient<QuerySuggestionRequest> {
    private static class Holder {
        private static final QuerySuggestionRequestClient INSTANCE = new QuerySuggestionRequestClient();
    }

    private static QuerySuggestionRequestClient getInstance() {
        return Holder.INSTANCE;
    }

    /**
     * querySuggestion
     *
     * @return NearbySearchResponse
     */
    public static QuerySuggestionResponse suggestionQuery(QuerySuggestionRequest request) {
        return getInstance().querySuggestion(request);
    }

    public QuerySuggestionResponse querySuggestion(QuerySuggestionRequest request) {
        InvocationContext<QuerySuggestionRequest> context =
            new InvocationContext<>(ApiInfoConstants.QUERY_SUGGESTION, request);
        try {
            return send(context, QuerySuggestionResponse.class);
        } catch (ClientAccessException ex) {
            QuerySuggestionResponse response = new QuerySuggestionResponse();
            response.updateReturnInfo(ex.getErrorCode());
            return response;
        }
    }
}
