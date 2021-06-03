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
import com.huawei.hms.site.client.model.QueryAutocompleteRequest;
import com.huawei.hms.site.client.model.QueryAutocompleteResponse;

/**
 * searchById request client
 *
 * @since 2021-01-21
 */
public class QueryAutoCompleteRequestClient extends AbstractRequestClient<QueryAutocompleteRequest> {
    private static class Holder {
        private static final QueryAutoCompleteRequestClient INSTANCE = new QueryAutoCompleteRequestClient();
    }

    private static QueryAutoCompleteRequestClient getInstance() {
        return Holder.INSTANCE;
    }

    /**
     * searchById
     *
     * @return DetailSearchResponse
     */
    public static QueryAutocompleteResponse autocompleteQuery(QueryAutocompleteRequest request) {
        return getInstance().queryAutocomplete(request);
    }

    public QueryAutocompleteResponse queryAutocomplete(QueryAutocompleteRequest request) {
        InvocationContext<QueryAutocompleteRequest> context =
            new InvocationContext<>(ApiInfoConstants.QUERY_AUTO_COMPLETE, request);
        try {
            return send(context, QueryAutocompleteResponse.class);
        } catch (ClientAccessException ex) {
            QueryAutocompleteResponse response = new QueryAutocompleteResponse();
            response.updateReturnInfo(ex.getErrorCode());
            return response;
        }
    }
}
