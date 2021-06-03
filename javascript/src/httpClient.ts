/**
    Copyright 2021. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License")
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

import axios, { AxiosError, AxiosInstance, AxiosRequestConfig } from "axios";
import { ClientConfig, RetryOpts } from "./models/common/common";

declare module "axios" {
  interface AxiosRequestConfig {
    retryOpts?: RetryOpts;
  }
}

export class HttpClient {
  private axiosInstance: AxiosInstance;
  private config: ClientConfig;

  constructor(axiosReqConfig: AxiosRequestConfig) {
    this.config = axiosReqConfig;
    this.axiosInstance = axios.create(axiosReqConfig);

    this.axiosInstance.interceptors.request.use((config) => {
      if (config.retryOpts) {
        config.retryOpts.axiosInstance = this.axiosInstance;
      }
      return config;
    });

    this.axiosInstance.interceptors.response.use(
      (response) => {
        return response;
      },
      (error: AxiosError) => {
        const { config, response } = error;
        const { retryOpts } = config;
        const isStatusRetriable = !response || response.status >= 500;
        if (config && retryOpts && isStatusRetriable) {
          if (retryOpts.retryCount! < retryOpts.maxRetry!) {
            return new Promise((resolve) => {
              setTimeout(() => {
                resolve(retryOpts.axiosInstance!(config));
              }, retryOpts.retryInterval! * Math.pow(retryOpts.intervalFactor!, retryOpts.retryCount!++));
            });
          }
        }

        return Promise.reject({
          returnCode: error.response?.data?.returnCode ?? error.code,
          returnDesc: error.response?.data?.returnDesc ?? error.message,
        });
      }
    );
  }

  post<T, R>(url: string, data?: T, clientConfig?: ClientConfig): Promise<R> {
    const finalUrl = `${url}?key=${clientConfig?.apiKey ? clientConfig.apiKey : this.config.apiKey}`;
    const config: AxiosRequestConfig = { ...this.config, ...clientConfig };
    return this.axiosInstance.post(finalUrl, data, config).then((resp) => resp.data);
  }
}
