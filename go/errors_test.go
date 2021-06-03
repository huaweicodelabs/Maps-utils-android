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

import "testing"

func TestNewArgError_SampleArg(t *testing.T) {
    err := newArgError("Field", "createField")
    ar := &argError{field: "Field", example: "createField"}
    assertDeepEqual(t, ar, err)
}

func TestNewArgError_ErrorStr(t *testing.T) {
    err := newArgError("Field", "createField")
    assertStringsEqual(t, "Field field is mandatory. An example value of the argument should be:\n\tcreateField", err.Error())
}

func TestNewApiError_SampleApiError(t *testing.T) {
    err := newAPIError("200", "Description")
    ar := &apiError{returnCode: "200", returnDesc: "Description"}
    assertDeepEqual(t, ar, err)
}

func TestNewApiError_ErrorStr(t *testing.T) {
    err := newAPIError("200", "Description")
    assertStringsEqual(t, "returnCode= 200, returnDesc= Description", err.Error())
}

func assertStringsEqual(t *testing.T, expected, given string) {
    if given != expected {
        t.Errorf("strings are not equal, given= %v, expected= %v", given, expected)
    }
}
