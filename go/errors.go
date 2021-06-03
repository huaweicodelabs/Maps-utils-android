// Copyright 2021. Huawei Technologies Co., Ltd. All rights reserved.

// Licensed under the Apache License, Version 2.0 (the "License")
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     https://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package maps

import "fmt"

type argError struct {
    field   string
    example string
}

type apiError struct {
    returnCode string
    returnDesc string
}

func newArgError(field, example string) *argError {
    return &argError{field: field, example: example}
}

func newAPIError(returnCode, returnDesc string) *apiError {
    return &apiError{returnCode: returnCode, returnDesc: returnDesc}
}

func (argErr *argError) Error() string {
    return fmt.Sprintf("%s field is mandatory. An example value of the argument should be:\n\t%s", argErr.field, argErr.example)
}

func (apiError *apiError) Error() string {
    return fmt.Sprintf("returnCode= %s, returnDesc= %s", apiError.returnCode, apiError.returnDesc)
}
