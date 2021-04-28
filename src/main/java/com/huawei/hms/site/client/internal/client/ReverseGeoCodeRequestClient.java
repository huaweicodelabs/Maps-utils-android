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
import com.huawei.hms.site.client.model.ReverseGeocodeRequest;
import com.huawei.hms.site.client.model.ReverseGeocodeResponse;

/**
 * reverseGeocode request client
 *
 * @since 2021-01-21
 */
public class ReverseGeoCodeRequestClient extends AbstractRequestClient<ReverseGeocodeRequest> {
    private static class Holder {
        private static final ReverseGeoCodeRequestClient INSTANCE = new ReverseGeoCodeRequestClient();
    }

    private static ReverseGeoCodeRequestClient getInstance() {
        return Holder.INSTANCE;
    }

    /**
     * reverseGeocode
     *
     * @return ReverseGeoCodeResponse
     */
    public static ReverseGeocodeResponse reverseGeocodeQuery(ReverseGeocodeRequest request) {
        return getInstance().reverseGeocode(request);
    }

    public ReverseGeocodeResponse reverseGeocode(ReverseGeocodeRequest request) {
        InvocationContext<ReverseGeocodeRequest> context =
            new InvocationContext<>(ApiInfoConstants.REVERSE_GEOCODE, request);
        try {
            return send(context, ReverseGeocodeResponse.class);
        } catch (ClientAccessException ex) {
            ReverseGeocodeResponse response = new ReverseGeocodeResponse();
            response.updateReturnInfo(ex.getErrorCode());
            return response;
        }
    }
}
