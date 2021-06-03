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
import com.huawei.hms.site.client.model.GeocodeRequest;
import com.huawei.hms.site.client.model.GeocodeResponse;

/**
 * geocode request client
 *
 * @since 2021-01-21
 */
public class GeoCodeRequestClient extends AbstractRequestClient<GeocodeRequest> {
    private static class Holder {
        private static final GeoCodeRequestClient INSTANCE = new GeoCodeRequestClient();
    }

    private static GeoCodeRequestClient getInstance() {
        return Holder.INSTANCE;
    }

    /**
     * geocode
     *
     * @return GeoCodeResponse
     */
    public static GeocodeResponse geocodeQuery(GeocodeRequest request) {
        return getInstance().geocode(request);
    }

    public GeocodeResponse geocode(GeocodeRequest request) {
        InvocationContext<GeocodeRequest> context = new InvocationContext<>(ApiInfoConstants.GEOCODE, request);
        try {
            return send(context, GeocodeResponse.class);
        } catch (ClientAccessException ex) {
            GeocodeResponse response = new GeocodeResponse();
            response.updateReturnInfo(ex.getErrorCode());
            return response;
        }
    }
}
