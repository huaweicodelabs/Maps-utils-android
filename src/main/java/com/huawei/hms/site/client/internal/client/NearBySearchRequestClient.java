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
import com.huawei.hms.site.client.model.NearbySearchRequest;
import com.huawei.hms.site.client.model.NearbySearchResponse;

/**
 * nearbySearch request client
 *
 * @since 2021-01-21
 */
public class NearBySearchRequestClient extends AbstractRequestClient<NearbySearchRequest> {
    private static class Holder {
        private static final NearBySearchRequestClient INSTANCE = new NearBySearchRequestClient();
    }

    private static NearBySearchRequestClient getInstance() {
        return Holder.INSTANCE;
    }

    /**
     * nearbySearch
     *
     * @return NearbySearchResponse
     */
    public static NearbySearchResponse nearbyQuery(NearbySearchRequest request) {
        return getInstance().nearbySearch(request);
    }

    public NearbySearchResponse nearbySearch(NearbySearchRequest request) {
        InvocationContext<NearbySearchRequest> context =
            new InvocationContext<>(ApiInfoConstants.NEARBY_SEARCH, request);
        try {
            return send(context, NearbySearchResponse.class);
        } catch (ClientAccessException ex) {
            NearbySearchResponse response = new NearbySearchResponse();
            response.updateReturnInfo(ex.getErrorCode());
            return response;
        }
    }
}
