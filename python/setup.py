# Copyright 2021. Huawei Technologies Co., Ltd. All rights reserved.

# Licensed under the Apache License, Version 2.0 (the "License")
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     https://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import setuptools

with open("README.md", "r") as fh:
  long_description = fh.read()

setuptools.setup(
  name= "huaweimaps",
  version= "1.0.0a1",
  description= "Python Client for Huawei Site Services.",

  ## README
  long_description= long_description,
  long_description_content_type="text/markdown",
  ## README
  
  url= "https://github.com/<github-path-of-our-package>",
  packages= ['huaweimaps'],
  install_requires= ['requests'],
  license= 'Apache License 2.0',
  classifiers=[
    "Programming Language :: Python :: 3.5",
    "Programming Language :: Python :: 3.6",
    "Programming Language :: Python :: 3.7",
    "Programming Language :: Python :: 3.8",
    "Programming Language :: Python :: 3.9",
    "License :: OSI Approved :: Apache Software License",
    "Operating System :: OS Independent",
    "Intended Audience :: Developers"
  ],
  python_requires= '>=3.5',
)

