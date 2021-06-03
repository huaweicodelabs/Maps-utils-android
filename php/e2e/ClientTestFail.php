<?php

/*
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

namespace HuaweiMap;

use HuaweiMap\Model\Common\Coordinate;
use HuaweiMap\Model\Request\Api\DetailSearchRequest;
use HuaweiMap\Model\Request\Api\GeocodeRequest;
use HuaweiMap\Model\Request\Api\NearbySearchRequest;
use HuaweiMap\Model\Request\Api\QueryAutocompleteRequest;
use HuaweiMap\Model\Request\Api\QuerySuggestionRequest;
use HuaweiMap\Model\Request\Api\ReverseGeocodeRequest;
use HuaweiMap\Model\Request\Api\TextSearchRequest;
use HuaweiMap\Model\Request\Api\TimezoneRequest;
use HuaweiMap\Model\Request\ClientConfig;
use PHPUnit_Framework_TestCase;

class ClientTestFail extends PHPUnit_Framework_TestCase
{
    private $config;
    private $client;

    protected function setUp()
    {
        $this->config = new ClientConfig("invalid key");
        $this->client = new Client($this->config);
    }

    public function testFailNearbySearch()
    {
        $this->client = new Client($this->config);
        try {
            $this->client->nearbySearch(new NearbySearchRequest(new Coordinate(0, 0)));
            $this->fail("Should fail but passed.");
        } catch (ApiException $e) {
            $this->assertNotEmpty($e->getReturnCode());
            $this->assertFalse($e->getReturnCode() === "0");
        }
    }

    public function testFailQueryAutoComplete()
    {
        $request = new QueryAutocompleteRequest("");
        try {
            $this->client->queryAutoComplete($request);
            $this->fail("Should fail but passed.");
        } catch (ApiException $e) {
            $this->assertNotEmpty($e->getReturnCode());
            $this->assertFalse($e->getReturnCode() === "0");
        }
    }

    public function testFailTextSearch()
    {
        $request = new TextSearchRequest("");
        try {
            $this->client->textSearch($request);
            $this->fail("Should fail but passed.");
        } catch (ApiException $e) {
            $this->assertNotEmpty($e->getReturnCode());
            $this->assertFalse($e->getReturnCode() === "0");
        }
    }

    public function testFailGeocode()
    {
        $request = new GeocodeRequest("");
        try {
            $this->client->geocode($request);
            $this->fail("Should fail but passed.");
        } catch (ApiException $e) {
            $this->assertNotEmpty($e->getReturnCode());
            $this->assertFalse($e->getReturnCode() === "0");
        }
    }

    public function testFailQuerySuggestion()
    {
        $request = new QuerySuggestionRequest("");
        try {
            $this->client->querySuggestion($request);
            $this->fail("Should fail but passed.");
        } catch (ApiException $e) {
            $this->assertNotEmpty($e->getReturnCode());
            $this->assertFalse($e->getReturnCode() === "0");
        }
    }

    public function testFailReverseGeocode()
    {
        $request = new ReverseGeocodeRequest(new Coordinate(0, 0));
        try {
            $this->client->reverseGeocode($request);
            $this->fail("Should fail but passed.");
        } catch (ApiException $e) {
            $this->assertNotEmpty($e->getReturnCode());
            $this->assertFalse($e->getReturnCode() === "0");
        }
    }

    public function testFailGetTimezone()
    {
        $request = new TimezoneRequest(new Coordinate(0, 0));
        try {
            $this->client->getTimezone($request);
            $this->fail("Should fail but passed.");
        } catch (ApiException $e) {
            $this->assertNotEmpty($e->getReturnCode());
            $this->assertFalse($e->getReturnCode() === "0");
        }
    }

    public function testFailDetailSearch()
    {
        $request = new DetailSearchRequest("");

        try {
            $this->client->detailSearch($request);
            $this->fail("Should fail but passed.");
        } catch (ApiException $e) {
            $this->assertNotEmpty($e->getReturnCode());
            $this->assertFalse($e->getReturnCode() === "0");
        }

    }
}
