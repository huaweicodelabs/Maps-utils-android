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
import com.huawei.hms.site.client.model.DetailSearchRequest;
import com.huawei.hms.site.client.model.DetailSearchResponse;

/**
 * detailSearch request client
 *
 * @since 2021-01-21
 */
public class DetailSearchRequestClient extends AbstractRequestClient<DetailSearchRequest> {
    private static class Holder {
        private static final DetailSearchRequestClient INSTANCE = new DetailSearchRequestClient();
    }

    private static DetailSearchRequestClient getInstance() {
        return Holder.INSTANCE;
    }

    /**
     * searchById
     *
     * @return DetailSearchResponse
     */
    public static DetailSearchResponse detailQuery(DetailSearchRequest request) {
        return getInstance().detailSearch(request);
    }

    public DetailSearchResponse detailSearch(DetailSearchRequest request) {
        InvocationContext<DetailSearchRequest> context =
            new InvocationContext<>(ApiInfoConstants.SEARCH_BY_ID, request);
        try {
            return send(context, DetailSearchResponse.class);
        } catch (ClientAccessException ex) {
            DetailSearchResponse response = new DetailSearchResponse();
            response.updateReturnInfo(ex.getErrorCode());
            return response;
        }
    }
}
