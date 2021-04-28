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
import com.huawei.hms.site.client.model.TimezoneRequest;
import com.huawei.hms.site.client.model.TimezoneResponse;

/**
 * getTimezone request client
 *
 * @since 2021-01-21
 */
public class TimezoneRequestClient extends AbstractRequestClient<TimezoneRequest> {
    private static class Holder {
        private static final TimezoneRequestClient INSTANCE = new TimezoneRequestClient();
    }

    private static TimezoneRequestClient getInstance() {
        return Holder.INSTANCE;
    }

    /**
     * getTimezone
     *
     * @return TimezoneResponse
     */
    public static TimezoneResponse timezoneQuery(TimezoneRequest request) {
        return getInstance().getTimezone(request);
    }

    public TimezoneResponse getTimezone(TimezoneRequest request) {
        InvocationContext<TimezoneRequest> context = new InvocationContext<>(ApiInfoConstants.GET_TIME_ZONE, request);
        try {
            return send(context, TimezoneResponse.class);
        } catch (ClientAccessException ex) {
            TimezoneResponse response = new TimezoneResponse();
            response.updateReturnInfo(ex.getErrorCode());
            return response;
        }
    }
}
