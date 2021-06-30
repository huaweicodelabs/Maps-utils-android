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

class ClientTestSuccess extends PHPUnit_Framework_TestCase
{
    private $config;
    private $client;

    protected function setUp()
    {
        $this->config = new ClientConfig("encoded_valid_api_key");
        $this->config->setMaxRetry(3);
        $this->client = new Client($this->config);
    }

    public function testNearbySearch()
    {
        $this->client = new Client($this->config);
        $request = NearbySearchRequest::fromArray(
                array("query" => "Piazzale Dante",
                        "location" => Coordinate::fromArray(array(
                                "lng" => 10.252502,
                                "lat" => 43.8739168
                        )),
                        "radius" => 5000.0,
                        "hwPoiType" => "NATIONAL_RAILWAY_STATION",
                        "language" => "en",
                        "pageIndex" => 1,
                        "pageSize" => 1
                ));
        try {
            $res = $this->client->nearbySearch($request);
            $this->assertEquals("0", $res->getReturnCode());
        } catch (ApiException $e) {
            echo $e->getReturnDesc();
            $this->fail("Not a successful response");
        }
    }

    public function testQueryAutoComplete()
    {
        $request = QueryAutocompleteRequest::fromArray(
                array("query" => "station",
                        "location" => Coordinate::fromArray(array(
                                "lng" => 10.252502,
                                "lat" => 43.8739168
                        )),
                        "radius" => 10000.,
                        "language" => "en",
                        "children" => false));
        try {
            $res = $this->client->queryAutoComplete($request);
            $this->assertEquals("0", $res->getReturnCode());
        } catch (ApiException $e) {
            $this->fail("Not a successful response");
        }
    }

    public function testTextSearch()
    {
        $request = TextSearchRequest::fromArray(
                array("query" => "Piazzale Dante, 41, 55049 Viareggio, Tuscany, Italy",
                        "location" => Coordinate::fromArray(array("lat" => 10.252502, "lng" => 43.8739168)),
                        "children" => true));
        try {
            $res = $this->client->textSearch($request);
            $this->assertEquals("0", $res->getReturnCode());
        } catch (ApiException $e) {
            $this->fail("Not a successful response");
        }
    }

    public function testGeocode()
    {
        $request = GeocodeRequest::fromArray(
                array("address" => "Piazzale Dante, 41, 55049 Viareggio, Tuscany, Italy",
                        "language" => "en"));
        try {
            $res = $this->client->geocode($request);
            $this->assertEquals("0", $res->getReturnCode());
        } catch (ApiException $e) {
            $this->fail("Not a successful response");
        }
    }

    public function testQuerySuggestion()
    {
        $request = QuerySuggestionRequest::fromArray(
                array("query" => "Piazzale Dante",
                        "location" => Coordinate::fromArray(array(
                                "lng" => 10.252502,
                                "lat" => 43.8739168
                        )),
                        "language" => "en",
                        "children" => true));
        try {
            $res = $this->client->querySuggestion($request);
            $this->assertEquals("0", $res->getReturnCode());
        } catch (ApiException $e) {
            $this->fail("Not a successful response");
        }
    }

    public function testReverseGeocode()
    {
        $request = ReverseGeocodeRequest::fromArray(
                array("location" => Coordinate::fromArray(array(
                        "lng" => 10.252502,
                        "lat" => 43.8739168)),
                        "language" => "en"));
        try {
            $res = $this->client->reverseGeocode($request);
            $this->assertEquals("0", $res->getReturnCode());
        } catch (ApiException $e) {
            $this->fail("Not a successful response");
        }
    }

    public function testGetTimezone()
    {
        $request = TimezoneRequest::fromArray(
                array("location" => Coordinate::fromArray(array(
                        "lng" => 30.23235,
                        "lat" => 12.242585
                )),
                        "timestamp" => 1577435043,
                        "language" => "en"));
        try {
            $res = $this->client->getTimezone($request);
            $this->assertEquals("0", $res->getReturnCode());
        } catch (ApiException $e) {
            $this->fail("Not a successful response");
        }
    }

    public function testDetailSearch()
    {
        $request = DetailSearchRequest::fromArray(
                array("siteId" => "07A9FF43A715A1FEE041A167A8EAD043",
                        "language" => "en",
                        "politicalView" => "CN",
                        "children" => true));

        try {
            $res = $this->client->detailSearch($request);
            $this->assertEquals("0", $res->getReturnCode());
        } catch (ApiException $e) {
            $this->fail("Not a successful response");
        }

    }
}
