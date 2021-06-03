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

package com.huawei.hms.site.client.util;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;
import com.google.gson.JsonParser;

/**
 * JSON tool class.
 *
 * @since 2021-01-21
 */
public class JsonUtils {
    private static final Logger LOG = LoggerFactory.getLogger(JsonUtils.class.getName());

    private static Gson gsonInstance;

    private static JsonParser jsonParser;

    static {
        gsonInstance = getGsonBuilder().create();
        jsonParser = new JsonParser();
    }

    private static Gson getGsonInstance() {
        if (gsonInstance == null) {
            gsonInstance = getGsonBuilder().create();
            jsonParser = new JsonParser();
        }
        return gsonInstance;
    }

    private static JsonParser getJsonParser() {
        if (jsonParser == null) {
            jsonParser = new JsonParser();
        }
        return jsonParser;
    }

    private static GsonBuilder getGsonBuilder() {
        return new GsonBuilder().enableComplexMapKeySerialization()
            .serializeSpecialFloatingPointValues()
            .disableHtmlEscaping()
            .setLenient();
    }

    /**
     * JSON to Object
     *
     * @param json json String
     * @param objectClass objectClass
     * @return Object
     */
    public static <T> T json2Object(String json, Class<T> objectClass) {
        if (StringUtils.isEmpty(json) || objectClass == null) {
            return null;
        }
        try {
            return getGsonInstance().fromJson(json, objectClass);
        } catch (JsonParseException e) {
            LOG.error("JsonParseException");
            return null;
        }
    }

    /**
     * Object to Json
     *
     * @param object object
     * @return Json String
     */
    public static <T> String object2Json(T object) {
        if (object == null) {
            return null;
        }
        try {
            return getGsonInstance().toJson(object);
        } catch (JsonParseException e) {
            LOG.error("JsonParseException");
            return null;
        }
    }

    /**
     * jsonString to JsonObject
     *
     * @param jsonString json
     * @return JsonObject
     */
    public static JsonObject string2JsonObject(String jsonString) {
        return getJsonParser().parse(jsonString).getAsJsonObject();
    }
}