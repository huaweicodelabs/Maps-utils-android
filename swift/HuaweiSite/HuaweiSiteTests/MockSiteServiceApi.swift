/*
 Copyright 2021. Huawei Technologies Co., Ltd. All rights reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import XCTest
@testable import HuaweiSite
/// Mock Api
class MockSiteClientApi: NSObject, SiteClientProtocol {
    
    /// textSearch
    /// - Parameters:
    ///   - request: TextSearchRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completion: Completion Handler.
    func textSearch(with request: TextSearchRequest, apiContext: ApiContext?=nil, completionHandler: @escaping (TextSearchResponse?, NSError?) -> Void) {
        let bodyData = """
        {
            "returnCode": "0",
            "sites": [
                {
                    "formatAddress": "320 Boulevard Gambetta, 59200 Tourcoing, France",
                    "address": {
                        "country": "France",
                        "streetNumber": "320",
                        "countryCode": "FR",
                        "tertiaryAdminArea": "Tourcoing",
                        "postalCode": "59200",
                        "locality": "Tourcoing",
                        "adminArea": "Hauts-de-France",
                        "subAdminArea": "North",
                        "thoroughfare": "Boulevard Gambetta"
                    },
                    "distance": 0.09,
                    "poi": {
                        "hwPoiTypes": [
                            "HOTEL"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "+33 3 20703800",
                        "poiTypes": [
                            "LODGING"
                        ],
                        "phone": "+33 3 20703800",
                        "websiteUrl": "www.comfortlillelunion.com",
                        "childrenNodes": []
                    },
                    "viewport": {
                        "southwest": {
                            "lng": 3.1574828752354693,
                            "lat": 50.70381396679441
                        },
                        "northeast": {
                            "lng": 3.1614993247645304,
                            "lat": 50.70635763320559
                        }
                    },
                    "name": "Comfort Hotel Lille L'Union",
                    "siteId": "97B3140EF918D0E9D4AE654FC882A624",
                    "location": {
                        "lng": 3.1594911,
                        "lat": 50.7050858
                    }
                }
            ],
            "totalCount": 6,
            "returnDesc": "OK"
        }
        """
        let jsonDecode = JSONDecoder()
        do {
            let result = try jsonDecode.decode(TextSearchResponse.self, from: bodyData.data(using: String.Encoding.utf8)!)
            completionHandler(result, nil)
        } catch let error {
            Log.error("body param to json convert error: \(error.localizedDescription)")
        }
    }
    
    
    /// nearbySearch
    /// - Parameters:
    ///   - request: NearbySearchRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completion: Completion Handler.
    func nearbySearch(with request: NearbySearchRequest, apiContext: ApiContext?=nil, completionHandler: @escaping (NearbySearchResponse?, NSError?) -> Void) {
        let bodyData = """
        {
            "returnCode": "0",
            "sites": [
                {
                    "formatAddress": "10 Rue de la Fraternité, 93230 Romainville, France",
                    "address": {
                        "country": "France",
                        "streetNumber": "10",
                        "countryCode": "FR",
                        "tertiaryAdminArea": "Romainville",
                        "postalCode": "93230",
                        "locality": "Romainville",
                        "adminArea": "Ile-de-France",
                        "subAdminArea": "Seine-Saint-Denis",
                        "thoroughfare": "Rue de la Fraternité"
                    },
                    "distance": 501.74,
                    "poi": {
                        "hwPoiTypes": [
                            "HOTEL"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "+33 1 48594614",
                        "poiTypes": [
                            "LODGING"
                        ],
                        "phone": "+33 1 48594614",
                        "websiteUrl": ""
                    },
                    "viewport": {
                        "southwest": {
                            "lng": 2.4435441736542383,
                            "lat": 48.875777066794406
                        },
                        "northeast": {
                            "lng": 2.447411826345762,
                            "lat": 48.87832073320559
                        }
                    },
                    "name": "Confort Hôtel Romainville",
                    "siteId": "81239733893FD360FD8DAEB7A89654CF",
                    "location": {
                        "lng": 2.445478,
                        "lat": 48.8770489
                    }
                }
            ],
            "totalCount": 60,
            "returnDesc": "OK"
        }
        """
        let jsonDecode = JSONDecoder()
        do {
            let result = try jsonDecode.decode(NearbySearchResponse.self, from: bodyData.data(using: String.Encoding.utf8)!)
            completionHandler(result, nil)
        } catch let error {
            Log.error("body param to json convert error: \(error.localizedDescription)")
        }
    }
    
    /// detailSearch
    /// - Parameters:
    ///   - request: DetailSearchRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completion: Completion Handler.
    func detailSearch(with request: DetailSearchRequest, apiContext: ApiContext?=nil, completionHandler: @escaping (DetailSearchResponse?, NSError?) -> Void) {
        let bodyData = """
        {
            "returnCode": "0",
            "site": {
                "formatAddress": "Accés A L' Aeroport, 08820 El Prat De Llobregat, Catalonia, Spain",
                "address": {
                    "country": "Spain",
                    "countryCode": "ES",
                    "tertiaryAdminArea": "el Prat de Llobregat",
                    "postalCode": "08820",
                    "locality": "El Prat De Llobregat",
                    "adminArea": "Catalonia",
                    "subAdminArea": "Barcelona",
                    "thoroughfare": "Accés A L' Aeroport"
                },
                "utcOffset": 60,
                "poi": {
                    "hwPoiTypes": [
                        "PUBLIC_AUTHORITY"
                    ],
                    "rating": 0.0,
                    "internationalPhone": "+34 902 404704",
                    "priceLevel": 0,
                    "poiTypes": [
                        "AIRPORT"
                    ],
                    "phone": "+34 902 404704",
                    "websiteUrl": "www.aena.es",
                    "childrenNodes": [
                        {
                            "hwPoiTypes": [
                                "PARKING_LOT_SUB"
                            ],
                            "formatAddress": "08820 El Prat de Llobregat, Catalonia, Spain",
                            "name": "Parking Empeados",
                            "siteId": "B45ABF9C6672A468F5FF6E98FB77D385",
                            "location": {
                                "lng": 2.0809846,
                                "lat": 41.3072408
                            }
                        },
                        {
                            "hwPoiTypes": [
                                "PARKING_LOT_SUB"
                            ],
                            "formatAddress": "08820 El Prat de Llobregat, Catalonia, Spain",
                            "name": "Parking Express T2",
                            "siteId": "333A15F7ED6CC3396B8BC41A1E05709A",
                            "location": {
                                "lng": 2.0754701,
                                "lat": 41.3036593
                            }
                        },
                        {
                            "hwPoiTypes": [
                                "AIRLINE_ACCESS"
                            ],
                            "domeAndInt": "3",
                            "formatAddress": "Ronda De Josep Canudas I Busquets, 08820 El Prat De Llobregat, Catalonia, Spain",
                            "name": "Terminal 2 A",
                            "siteId": "D4B2227EE4E8EFD9C5D5C5472E177E70",
                            "location": {
                                "lng": 2.0737697,
                                "lat": 41.3016651
                            },
                            "depAndArr": "2"
                        },
                        {
                            "hwPoiTypes": [
                                "AIRLINE_ACCESS"
                            ],
                            "domeAndInt": "3",
                            "formatAddress": "Accés A L' Aeroport, 08820 El Prat De Llobregat, Catalonia, Spain",
                            "name": "Terminal 1",
                            "siteId": "E32D93D32726345FA3D8EBE778E48CDA",
                            "location": {
                                "lng": 2.0737278,
                                "lat": 41.2889612
                            },
                            "depAndArr": "2"
                        },
                        {
                            "hwPoiTypes": [
                                "AIRLINE_ACCESS"
                            ],
                            "domeAndInt": "3",
                            "formatAddress": "Accés A L' Aeroport, 08820 El Prat De Llobregat, Catalonia, Spain",
                            "name": "Terminal 1",
                            "siteId": "CCE3A601127970D3D61536EBE965F40E",
                            "location": {
                                "lng": 2.0738699,
                                "lat": 41.2887928
                            },
                            "depAndArr": "1"
                        },
                        {
                            "hwPoiTypes": [
                                "AIRLINE_ACCESS"
                            ],
                            "domeAndInt": "3",
                            "formatAddress": "Ronda De Josep Canudas I Busquets, 08820 El Prat De Llobregat, Catalonia, Spain",
                            "name": "Terminal 2 C",
                            "siteId": "E8620C1BCF65863D6DE4093BE519A07C",
                            "location": {
                                "lng": 2.0822349,
                                "lat": 41.3040394
                            },
                            "depAndArr": "1"
                        },
                        {
                            "hwPoiTypes": [
                                "AIRLINE_ACCESS"
                            ],
                            "domeAndInt": "3",
                            "formatAddress": "Ronda De Josep Canudas I Busquets, 08820 El Prat De Llobregat, Catalonia, Spain",
                            "name": "Terminal 2 B",
                            "siteId": "5EE6D872A2804EDCB4F650D2F38710D0",
                            "location": {
                                "lng": 2.078116,
                                "lat": 41.3029938
                            },
                            "depAndArr": "3"
                        }
                    ],
                    "openingHours": {}
                },
                "viewport": {
                    "southwest": {
                        "lng": 2.0505633,
                        "lat": 41.2801418
                    },
                    "northeast": {
                        "lng": 2.1096553,
                        "lat": 41.3147921
                    }
                },
                "name": "Josep Tarradellas Airport Barcelona-El Prat",
                "siteId": "EB731B7298F1E2EEDC42532CFD3B8E32",
                "location": {
                    "lng": 2.0797638,
                    "lat": 41.300621
                }
            },
            "returnDesc": "OK"
        }
        """
        let jsonDecode = JSONDecoder()
        do {
            let result = try jsonDecode.decode(DetailSearchResponse.self, from: bodyData.data(using: String.Encoding.utf8)!)
            completionHandler(result, nil)
        } catch let error {
            Log.error("body param to json convert error: \(error.localizedDescription)")
        }
    }
    
    /// querySuggestion
    /// - Parameters:
    ///   - request: QuerySuggestionRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completion: Completion Handler.
    func querySuggestion(with request: QuerySuggestionRequest, apiContext: ApiContext?=nil, completionHandler: @escaping (QuerySuggestionResponse?, NSError?) -> Void) {
        let bodyData = """
        {
            "returnCode": "0",
            "sites": [
                {
                    "formatAddress": "el Prat de Llobregat, Spain",
                    "address": {
                        "country": "Spain",
                        "countryCode": "ES",
                        "tertiaryAdminArea": "el Prat de Llobregat",
                        "locality": "el Prat de Llobregat",
                        "adminArea": "Catalonia",
                        "subAdminArea": "Barcelona"
                    },
                    "distance": 1676.7956912688678,
                    "poi": {
                        "hwPoiTypes": [
                            "ROUTE"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "POINT_OF_INTEREST"
                        ],
                        "childrenNodes": []
                    },
                    "name": "Accés a l'Aeroport",
                    "prediction": {
                        "matchedKeywords": [
                            {
                                "offset": 0,
                                "value": "Accés a l"
                            }
                        ],
                        "description": "Accés a l'Aeroport el Prat de Llobregat, Spain",
                        "matchedWords": [
                            {
                                "offset": 0,
                                "value": "Accés a l'Aeroport"
                            },
                            {
                                "offset": 20,
                                "value": "el Prat de Llobregat"
                            },
                            {
                                "offset": 42,
                                "value": "Spain"
                            }
                        ]
                    },
                    "siteId": "486417936A10D071664FB469D64E6EA6",
                    "location": {
                        "lng": 2.0679226,
                        "lat": 41.2884661
                    }
                },
                {
                    "formatAddress": "Viladecans, Spain",
                    "address": {
                        "country": "Spain",
                        "countryCode": "ES",
                        "tertiaryAdminArea": "Viladecans",
                        "locality": "Viladecans",
                        "adminArea": "Catalonia",
                        "subAdminArea": "Barcelona"
                    },
                    "distance": 2320.74678977947,
                    "poi": {
                        "hwPoiTypes": [
                            "ROUTE"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "POINT_OF_INTEREST"
                        ],
                        "childrenNodes": []
                    },
                    "name": "Accés a l'Aeroport",
                    "prediction": {
                        "matchedKeywords": [
                            {
                                "offset": 0,
                                "value": "Accés a l"
                            }
                        ],
                        "description": "Accés a l'Aeroport Viladecans, Spain",
                        "matchedWords": [
                            {
                                "offset": 0,
                                "value": "Accés a l'Aeroport"
                            },
                            {
                                "offset": 20,
                                "value": "Viladecans"
                            },
                            {
                                "offset": 32,
                                "value": "Spain"
                            }
                        ]
                    },
                    "siteId": "3829B73C5388262500191F1DB20578C2",
                    "location": {
                        "lng": 2.0520229,
                        "lat": 41.3000811
                    }
                },
                {
                    "formatAddress": "Vial Logístico, Viladecans, Spain",
                    "address": {
                        "country": "Spain",
                        "countryCode": "ES",
                        "tertiaryAdminArea": "Viladecans",
                        "postalCode": "08840",
                        "locality": "Viladecans",
                        "adminArea": "Catalonia",
                        "subAdminArea": "Barcelona",
                        "thoroughfare": "Vial Logístico"
                    },
                    "distance": 2357.093283884891,
                    "poi": {
                        "hwPoiTypes": [
                            "BUS_STOP"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "BUS_STATION"
                        ],
                        "phone": "",
                        "websiteUrl": "",
                        "childrenNodes": []
                    },
                    "name": "Accés a l'Aeroport-Aparcament empleats T1",
                    "prediction": {
                        "matchedKeywords": [
                            {
                                "offset": 0,
                                "value": "Accés a l"
                            }
                        ],
                        "description": "Accés a l'Aeroport-Aparcament empleats T1 Vial Logístico, Viladecans, Spain",
                        "matchedWords": [
                            {
                                "offset": 0,
                                "value": "Accés a l'Aeroport-Aparcament empleats T1"
                            },
                            {
                                "offset": 43,
                                "value": "Vial Logístico"
                            },
                            {
                                "offset": 59,
                                "value": "Viladecans"
                            },
                            {
                                "offset": 71,
                                "value": "Spain"
                            }
                        ]
                    },
                    "siteId": "00C164409039D97084FC92CB2FBAF93C",
                    "location": {
                        "lng": 2.05406,
                        "lat": 41.291937
                    }
                },
                {
                    "formatAddress": "Elche, Spain",
                    "address": {
                        "country": "Spain",
                        "countryCode": "ES",
                        "tertiaryAdminArea": "Elche",
                        "locality": "Elche",
                        "adminArea": "Community of Valencia",
                        "subAdminArea": "Alicante"
                    },
                    "distance": 404048.16923002974,
                    "poi": {
                        "hwPoiTypes": [
                            "ROUTE"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "POINT_OF_INTEREST"
                        ],
                        "childrenNodes": []
                    },
                    "name": "Accés a l'Aeroport",
                    "prediction": {
                        "matchedKeywords": [
                            {
                                "offset": 0,
                                "value": "Accés a l"
                            }
                        ],
                        "description": "Accés a l'Aeroport Elche, Spain",
                        "matchedWords": [
                            {
                                "offset": 0,
                                "value": "Accés a l'Aeroport"
                            },
                            {
                                "offset": 20,
                                "value": "Elche"
                            },
                            {
                                "offset": 27,
                                "value": "Spain"
                            }
                        ]
                    },
                    "siteId": "0800EBED339F672A19274677F4716E8D",
                    "location": {
                        "lng": -0.5532922,
                        "lat": 38.2865919
                    }
                },
                {
                    "formatAddress": "Accés A L' Aeroport, El Prat De Llobregat, Spain",
                    "address": {
                        "country": "Spain",
                        "countryCode": "ES",
                        "tertiaryAdminArea": "el Prat de Llobregat",
                        "postalCode": "08820",
                        "locality": "El Prat De Llobregat",
                        "adminArea": "Catalonia",
                        "subAdminArea": "Barcelona",
                        "thoroughfare": "Accés A L' Aeroport"
                    },
                    "distance": 0.0,
                    "poi": {
                        "hwPoiTypes": [
                            "PUBLIC_AUTHORITY"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "+34 902 404704",
                        "poiTypes": [
                            "AIRPORT"
                        ],
                        "phone": "+34 902 404704",
                        "websiteUrl": "www.aena.es",
                        "childrenNodes": []
                    },
                    "name": "Aeroport de Barcelona",
                    "prediction": {
                        "matchedKeywords": [
                            {
                                "offset": 22,
                                "value": "Accés A L"
                            }
                        ],
                        "description": "Aeroport de Barcelona Accés A L' Aeroport, El Prat De Llobregat, Spain",
                        "matchedWords": [
                            {
                                "offset": 0,
                                "value": "Aeroport de Barcelona"
                            },
                            {
                                "offset": 23,
                                "value": "Accés A L' Aeroport"
                            },
                            {
                                "offset": 44,
                                "value": "El Prat De Llobregat"
                            },
                            {
                                "offset": 66,
                                "value": "Spain"
                            }
                        ]
                    },
                    "siteId": "EB731B7298F1E2EEDC42532CFD3B8E32",
                    "location": {
                        "lng": 2.0797638,
                        "lat": 41.300621
                    }
                }
            ],
            "returnDesc": "OK"
        }
        """
        let jsonDecode = JSONDecoder()
        do {
            let result = try jsonDecode.decode(QuerySuggestionResponse.self, from: bodyData.data(using: String.Encoding.utf8)!)
            completionHandler(result, nil)
        } catch let error {
            Log.error("body param to json convert error: \(error.localizedDescription)")
        }
    }
    
    /// queryAutocomplete
    /// - Parameters:
    ///   - request: QueryAutocompleteRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completion: Completion Handler.
    func queryAutocomplete(with request: QueryAutocompleteRequest, apiContext: ApiContext?=nil, completionHandler: @escaping (QueryAutocompleteResponse?, NSError?) -> Void) {
        let bodyData = """
        {
            "returnCode": "0",
            "hotNames": [
                "hotell",
                "hotelli",
                "hotel"
            ],
            "sites": [
                {
                    "formatAddress": "Kemalpaşa, Çukur Çeşme Sokak Türkiye",
                    "address": {
                        "country": "Türkiye",
                        "countryCode": "TR",
                        "tertiaryAdminArea": "Fatih",
                        "subLocality": "Kemalpaşa",
                        "postalCode": "34134",
                        "locality": "Kemalpaşa",
                        "adminArea": "İstanbul",
                        "subAdminArea": "Fatih",
                        "thoroughfare": "Çukur Çeşme Sokak"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "HOTEL"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "+90 212 5129860",
                        "poiTypes": [
                            "LODGING"
                        ],
                        "phone": "+90 212 5129860",
                        "websiteUrl": "www.yigitalp.com"
                    },
                    "name": "Hotel Yiğitalp İstanbul",
                    "prediction": {
                        "matchedKeywords": [
                            {
                                "offset": 0,
                                "value": "Hotel"
                            }
                        ],
                        "description": "Hotel Yiğitalp İstanbul Kemalpaşa, Çukur Çeşme Sokak Türkiye",
                        "matchedWords": [
                            {
                                "offset": 0,
                                "value": "Hotel Yiğitalp İstanbul"
                            },
                            {
                                "offset": 25,
                                "value": "Kemalpaşa"
                            },
                            {
                                "offset": 36,
                                "value": "Çukur Çeşme Sokak"
                            },
                            {
                                "offset": 55,
                                "value": "Türkiye"
                            }
                        ]
                    },
                    "siteId": "2F33DED2AA5A8B3A6C2A4A7920D0650C",
                    "location": {
                        "lng": 28.9557057,
                        "lat": 41.0110975
                    }
                },
                {
                    "formatAddress": "İskenderpaşa, Ahmediye Caddesi Türkiye",
                    "address": {
                        "country": "Türkiye",
                        "countryCode": "TR",
                        "tertiaryAdminArea": "Fatih",
                        "subLocality": "İskenderpaşa",
                        "postalCode": "34080",
                        "locality": "İskenderpaşa",
                        "adminArea": "İstanbul",
                        "subAdminArea": "Fatih",
                        "thoroughfare": "Ahmediye Caddesi"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "HOTEL"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "+90 212 5210400",
                        "poiTypes": [
                            "LODGING"
                        ],
                        "phone": "+90 212 5210400",
                        "websiteUrl": "hotelromeo.com.tr/"
                    },
                    "name": "Hotel Romeo",
                    "prediction": {
                        "matchedKeywords": [
                            {
                                "offset": 0,
                                "value": "Hotel"
                            }
                        ],
                        "description": "Hotel Romeo İskenderpaşa, Ahmediye Caddesi Türkiye",
                        "matchedWords": [
                            {
                                "offset": 0,
                                "value": "Hotel Romeo"
                            },
                            {
                                "offset": 13,
                                "value": "İskenderpaşa"
                            },
                            {
                                "offset": 27,
                                "value": "Ahmediye Caddesi"
                            },
                            {
                                "offset": 45,
                                "value": "Türkiye"
                            }
                        ]
                    },
                    "siteId": "37F6C3991ED251D6ECD2CCFEAD27B2A4",
                    "location": {
                        "lng": 28.948155,
                        "lat": 41.012845
                    }
                }
            ],
            "returnDesc": "OK",
            "predictions": [
                {
                    "matchedKeywords": [
                        {
                            "offset": 0,
                            "value": "hotel"
                        }
                    ],
                    "description": "hotel",
                    "matchedWords": [
                        {
                            "offset": 0,
                            "value": "hotel"
                        }
                    ]
                },
                {
                    "matchedKeywords": [
                        {
                            "offset": 0,
                            "value": "hotel"
                        }
                    ],
                    "description": "hotell",
                    "matchedWords": [
                        {
                            "offset": 0,
                            "value": "hotell"
                        }
                    ]
                },
                {
                    "matchedKeywords": [
                        {
                            "offset": 0,
                            "value": "hotel"
                        }
                    ],
                    "description": "hotelli",
                    "matchedWords": [
                        {
                            "offset": 0,
                            "value": "hotelli"
                        }
                    ]
                }
            ]
        }
        """
        let jsonDecode = JSONDecoder()
        do {
            let result = try jsonDecode.decode(QueryAutocompleteResponse.self, from: bodyData.data(using: String.Encoding.utf8)!)
            completionHandler(result, nil)
        } catch let error {
            Log.error("body param to json convert error: \(error.localizedDescription)")
        }
    }
    
    /// geocode
    /// - Parameters:
    ///   - request: GeocodeRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completion: Completion Handler.
    func geocode(with request: GeocodeRequest, apiContext: ApiContext?=nil, completionHandler: @escaping (GeocodeResponse?, NSError?) -> Void) {
        let bodyData = """
        {
            "returnCode": "0",
            "sites": [
                {
                    "formatAddress": "London, England EC4M 6 the United Kingdom",
                    "address": {
                        "country": "the United Kingdom",
                        "countryCode": "GB",
                        "tertiaryAdminArea": "City of London",
                        "postalCode": "EC4M 6",
                        "locality": "London",
                        "adminArea": "England",
                        "subAdminArea": "London"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "HOUSEHOLD_APPLIANCE_STORE"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "+442073744127",
                        "poiTypes": [
                            "POINT_OF_INTEREST"
                        ],
                        "phone": "+442073744127"
                    },
                    "viewport": {
                        "southwest": {
                            "lng": -0.0975991907594403,
                            "lat": 51.51061936679441
                        },
                        "northeast": {
                            "lng": -0.0935120092405597,
                            "lat": 51.51316303320559
                        }
                    },
                    "name": "Cleary Garden",
                    "siteId": "40845DB43FA1AD20E6E2F6467EE9C3B9",
                    "location": {
                        "lng": -0.0955556,
                        "lat": 51.5118912
                    }
                },
                {
                    "formatAddress": "District 1 La Plata, Maryland, United States",
                    "address": {
                        "country": "United States",
                        "countryCode": "US",
                        "tertiaryAdminArea": "District 1 La Plata",
                        "locality": "District 1 La Plata",
                        "adminArea": "Maryland",
                        "subAdminArea": "Charles"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "ROUTE"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "POINT_OF_INTEREST"
                        ]
                    },
                    "viewport": {
                        "southwest": {
                            "lng": -76.9782735,
                            "lat": 38.5241939
                        },
                        "northeast": {
                            "lng": -76.97685,
                            "lat": 38.524267
                        }
                    },
                    "name": "Queen Victoria St",
                    "siteId": "62752F6A49D3CF4E4402945E54769BB9",
                    "location": {
                        "lng": -76.9782735,
                        "lat": 38.5241939
                    }
                },
                {
                    "formatAddress": "Madison, Ohio, United States",
                    "address": {
                        "country": "United States",
                        "countryCode": "US",
                        "tertiaryAdminArea": "Madison",
                        "locality": "Madison",
                        "adminArea": "Ohio",
                        "subAdminArea": "Franklin"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "ROUTE"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "POINT_OF_INTEREST"
                        ]
                    },
                    "viewport": {
                        "southwest": {
                            "lng": -82.873207,
                            "lat": 39.86547
                        },
                        "northeast": {
                            "lng": -82.8699766,
                            "lat": 39.8669208
                        }
                    },
                    "name": "Queen Victoria St",
                    "siteId": "D5A6C2C26B385C179A72577AD96D41BA",
                    "location": {
                        "lng": -82.8699766,
                        "lat": 39.8667489
                    }
                },
                {
                    "formatAddress": "East Fairfax, Virginia, United States",
                    "address": {
                        "country": "United States",
                        "countryCode": "US",
                        "tertiaryAdminArea": "East Fairfax",
                        "locality": "East Fairfax",
                        "adminArea": "Virginia",
                        "subAdminArea": "Culpeper"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "ROUTE"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "POINT_OF_INTEREST"
                        ]
                    },
                    "viewport": {
                        "southwest": {
                            "lng": -78.0119025,
                            "lat": 38.4474699
                        },
                        "northeast": {
                            "lng": -78.0086494,
                            "lat": 38.4489605
                        }
                    },
                    "name": "Queen Victoria St",
                    "siteId": "D2FA3C6F9859D55DAEA26869D37840A7",
                    "location": {
                        "lng": -78.0086494,
                        "lat": 38.4486085
                    }
                },
                {
                    "formatAddress": "Las Vegas, Nevada, United States",
                    "address": {
                        "country": "United States",
                        "countryCode": "US",
                        "tertiaryAdminArea": "Las Vegas",
                        "locality": "Las Vegas",
                        "adminArea": "Nevada",
                        "subAdminArea": "Clark"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "ROUTE"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "POINT_OF_INTEREST"
                        ]
                    },
                    "viewport": {
                        "southwest": {
                            "lng": -115.319963,
                            "lat": 36.189852
                        },
                        "northeast": {
                            "lng": -115.319254,
                            "lat": 36.192082
                        }
                    },
                    "name": "Queen Victoria St",
                    "siteId": "A74E9A814555BAC395A85B94BB4605CC",
                    "location": {
                        "lng": -115.3192818,
                        "lat": 36.1900254
                    }
                },
                {
                    "formatAddress": "Alvin-Pearland, Texas, United States",
                    "address": {
                        "country": "United States",
                        "countryCode": "US",
                        "tertiaryAdminArea": "Alvin-Pearland",
                        "locality": "Alvin-Pearland",
                        "adminArea": "Texas",
                        "subAdminArea": "Brazoria"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "ROUTE"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "POINT_OF_INTEREST"
                        ]
                    },
                    "viewport": {
                        "southwest": {
                            "lng": -95.262641,
                            "lat": 29.563421
                        },
                        "northeast": {
                            "lng": -95.260921,
                            "lat": 29.564866
                        }
                    },
                    "name": "Queen Victoria St",
                    "siteId": "5A1BA51FC7948F1E28AF4F174C322A70",
                    "location": {
                        "lng": -95.260921,
                        "lat": 29.563421
                    }
                },
                {
                    "formatAddress": "Toronto, Ontario, Canada",
                    "address": {
                        "country": "Canada",
                        "countryCode": "CA",
                        "tertiaryAdminArea": "Toronto",
                        "locality": "Toronto",
                        "adminArea": "Ontario",
                        "subAdminArea": "Toronto"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "ROUTE"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "POINT_OF_INTEREST"
                        ]
                    },
                    "viewport": {
                        "southwest": {
                            "lng": -79.3361322,
                            "lat": 43.676839
                        },
                        "northeast": {
                            "lng": -79.334312,
                            "lat": 43.677297
                        }
                    },
                    "name": "Queen Victoria St",
                    "siteId": "EAF280E7260D6B1F4B71CCB4A8919512",
                    "location": {
                        "lng": -79.3348472,
                        "lat": 43.6771549
                    }
                },
                {
                    "formatAddress": "Queen Victoria St, Desbarats, Ontario, P0R Canada",
                    "address": {
                        "country": "Canada",
                        "countryCode": "CA",
                        "tertiaryAdminArea": "Johnson",
                        "postalCode": "P0R",
                        "locality": "Desbarats",
                        "adminArea": "Ontario",
                        "subAdminArea": "Algoma",
                        "thoroughfare": "Queen Victoria St"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "ORDER_9_AREA_GOVERNMENT_OFFICE"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "+1 705 7826776",
                        "poiTypes": [
                            "CITY_HALL"
                        ],
                        "phone": "+1 705 7826776"
                    },
                    "viewport": {
                        "southwest": {
                            "lng": -83.92527242640996,
                            "lat": 46.344598166794405
                        },
                        "northeast": {
                            "lng": -83.92158757359003,
                            "lat": 46.34714183320559
                        }
                    },
                    "name": "Municipal Government Services Tarbutt & Tarbutt Additional Township Of Office",
                    "siteId": "D3E7F070AB38CE90DB8D73EC508C409A",
                    "location": {
                        "lng": -83.92343,
                        "lat": 46.34587
                    }
                },
                {
                    "formatAddress": "Queen Victoria St, Clarington, Ontario, L1B Canada",
                    "address": {
                        "country": "Canada",
                        "countryCode": "CA",
                        "tertiaryAdminArea": "Clarington",
                        "postalCode": "L1B",
                        "locality": "Clarington",
                        "adminArea": "Ontario",
                        "subAdminArea": "Durham",
                        "thoroughfare": "Queen Victoria St"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "CEMETERY"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "CEMETERY"
                        ],
                        "phone": ""
                    },
                    "viewport": {
                        "southwest": {
                            "lng": -78.57675116848081,
                            "lat": 43.901579166794406
                        },
                        "northeast": {
                            "lng": -78.57322083151918,
                            "lat": 43.90412283320559
                        }
                    },
                    "name": "Bond Head Cemetery",
                    "siteId": "A7F0A2ED2A29003E2FE9A6A9872AE1F2",
                    "location": {
                        "lng": -78.574986,
                        "lat": 43.902851
                    }
                },
                {
                    "formatAddress": "6949, Queen Victoria St, Desbarats, Ontario, P0R Canada",
                    "address": {
                        "country": "Canada",
                        "streetNumber": "6949",
                        "countryCode": "CA",
                        "tertiaryAdminArea": "Johnson",
                        "postalCode": "P0R",
                        "locality": "Desbarats",
                        "adminArea": "Ontario",
                        "subAdminArea": "Algoma",
                        "thoroughfare": "Queen Victoria St"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "CONSTRUCTION_COMPANY"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "+1 705 7826863",
                        "poiTypes": [
                            "ROOFING_CONTRACTOR"
                        ],
                        "phone": "+1 705 7826863"
                    },
                    "viewport": {
                        "southwest": {
                            "lng": -83.92527242640996,
                            "lat": 46.344598166794405
                        },
                        "northeast": {
                            "lng": -83.92158757359003,
                            "lat": 46.34714183320559
                        }
                    },
                    "name": "Karhi Contracting",
                    "siteId": "2AEE1D8A052C7B9C03F23EB3B649A7E4",
                    "location": {
                        "lng": -83.92343,
                        "lat": 46.34587
                    }
                }
            ],
            "returnDesc": "OK"
        }
        """
        let jsonDecode = JSONDecoder()
        do {
            let result = try jsonDecode.decode(GeocodeResponse.self, from: bodyData.data(using: String.Encoding.utf8)!)
            completionHandler(result, nil)
        } catch let error {
            Log.error("body param to json convert error: \(error.localizedDescription)")
        }
    }
    
    /// reverseGeocode
    /// - Parameters:
    ///   - request: ReverseGeocodeRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completion: Completion Handler.
    func reverseGeocode(with request: ReverseGeocodeRequest, apiContext: ApiContext?=nil, completionHandler: @escaping (ReverseGeocodeResponse?, NSError?) -> Void) {
        let bodyData = """
        {
            "returnCode": "0",
            "sites": [
                {
                    "formatAddress": "Shri Ram Commericial Vehicle Finance, Bhalki 585328, India",
                    "address": {
                        "country": "India",
                        "countryCode": "IN",
                        "tertiaryAdminArea": "Bhalki",
                        "subLocality": "Bhalki",
                        "postalCode": "585328",
                        "locality": "Bhalki",
                        "adminArea": "Karnataka",
                        "subAdminArea": "Bidar",
                        "thoroughfare": "Shri Ram Commericial Vehicle Finance"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "DIVERSIFIED_FINANCIAL_SERVICE_COMPANY"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "ACCOUNTING"
                        ]
                    },
                    "viewport": {
                        "southwest": {
                            "lng": 77.21415031502507,
                            "lat": 18.051436166794407
                        },
                        "northeast": {
                            "lng": 77.21682568497492,
                            "lat": 18.05397983320559
                        }
                    },
                    "name": "Shri Ram Commercial Vehicle Finance",
                    "siteId": "3A2375F8861AC70964E69B9BDB68F31E",
                    "location": {
                        "lng": 77.215488,
                        "lat": 18.052708
                    }
                },
                {
                    "formatAddress": "Sri Ram Book Stall, Bhalki 585328, India",
                    "address": {
                        "country": "India",
                        "countryCode": "IN",
                        "tertiaryAdminArea": "Bhalki",
                        "subLocality": "Bhalki",
                        "postalCode": "585328",
                        "locality": "Bhalki",
                        "adminArea": "Karnataka",
                        "subAdminArea": "Bidar",
                        "thoroughfare": "Sri Ram Book Stall"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "BOOKSTORE"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "BOOK_STORE"
                        ]
                    },
                    "viewport": {
                        "southwest": {
                            "lng": 77.21417331473592,
                            "lat": 18.051474166794407
                        },
                        "northeast": {
                            "lng": 77.2168486852641,
                            "lat": 18.05401783320559
                        }
                    },
                    "name": "Sri Ram Book Stall",
                    "siteId": "920B3D29A895D7AA1525F34066368102",
                    "location": {
                        "lng": 77.215511,
                        "lat": 18.052746
                    }
                },
                {
                    "formatAddress": "Pragathi Krishna Gramin Bank Atm, Bhalki 585328, India",
                    "address": {
                        "country": "India",
                        "countryCode": "IN",
                        "tertiaryAdminArea": "Bhalki",
                        "subLocality": "Bhalki",
                        "postalCode": "585328",
                        "locality": "Bhalki",
                        "adminArea": "Karnataka",
                        "subAdminArea": "Bidar",
                        "thoroughfare": "Pragathi Krishna Gramin Bank Atm"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "AUTOMATIC_TELLER_MACHINE"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "ATM"
                        ]
                    },
                    "viewport": {
                        "southwest": {
                            "lng": 77.21411331529903,
                            "lat": 18.05140016679441
                        },
                        "northeast": {
                            "lng": 77.21678868470097,
                            "lat": 18.053943833205594
                        }
                    },
                    "name": "Pragathi Krishna Gramin Bank ATM",
                    "siteId": "1E6F836CA7784061513406C999AA1FC4",
                    "location": {
                        "lng": 77.215451,
                        "lat": 18.052672
                    }
                },
                {
                    "formatAddress": "Sri Laxmi Auto Consultant, Bhalki 585328, India",
                    "address": {
                        "country": "India",
                        "countryCode": "IN",
                        "tertiaryAdminArea": "Bhalki",
                        "subLocality": "Bhalki",
                        "postalCode": "585328",
                        "locality": "Bhalki",
                        "adminArea": "Karnataka",
                        "subAdminArea": "Bidar",
                        "thoroughfare": "Sri Laxmi Auto Consultant"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "TIRE_REPAIR_SHOP"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "POINT_OF_INTEREST"
                        ]
                    },
                    "viewport": {
                        "southwest": {
                            "lng": 77.21418731456089,
                            "lat": 18.05149716679441
                        },
                        "northeast": {
                            "lng": 77.21686268543911,
                            "lat": 18.054040833205594
                        }
                    },
                    "name": "Sri Laxmi Auto Consultant",
                    "siteId": "B370F0E67A6D713453B9FF71FDEC2227",
                    "location": {
                        "lng": 77.215525,
                        "lat": 18.052769
                    }
                },
                {
                    "formatAddress": "SH-75, Karnataka 585328, India",
                    "address": {
                        "country": "India",
                        "countryCode": "IN",
                        "tertiaryAdminArea": "Bhalki",
                        "subLocality": "Bhalki",
                        "postalCode": "585328",
                        "locality": "Karnataka",
                        "adminArea": "Karnataka",
                        "subAdminArea": "Bidar",
                        "thoroughfare": "SH-75"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "HOUSEHOLD_APPLIANCE_STORE"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "POINT_OF_INTEREST"
                        ]
                    },
                    "viewport": {
                        "southwest": {
                            "lng": 77.21422231554253,
                            "lat": 18.051368166794408
                        },
                        "northeast": {
                            "lng": 77.21689768445746,
                            "lat": 18.053911833205593
                        }
                    },
                    "name": "Nandini Building Materials",
                    "siteId": "ACEB2325603842F6A363B0F6D7A432AE",
                    "location": {
                        "lng": 77.21556,
                        "lat": 18.05264
                    }
                },
                {
                    "formatAddress": "India",
                    "address": {
                        "country": "India",
                        "countryCode": "IN",
                        "tertiaryAdminArea": "Bhalki",
                        "subLocality": "Bhalki",
                        "adminArea": "Karnataka",
                        "subAdminArea": "Bidar"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "ADMINISTRATIVE_AREA_LEVEL_4"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "ADMINISTRATIVE_AREA_LEVEL_4"
                        ]
                    },
                    "viewport": {
                        "southwest": {
                            "lng": 77.191685,
                            "lat": 18.017377
                        },
                        "northeast": {
                            "lng": 77.2421886,
                            "lat": 18.0683634
                        }
                    },
                    "name": "Bhalki",
                    "siteId": "9475143D252810C1E13235C37161023C",
                    "location": {
                        "lng": 77.217903,
                        "lat": 18.049
                    }
                },
                {
                    "formatAddress": "India",
                    "address": {
                        "country": "India",
                        "countryCode": "IN",
                        "tertiaryAdminArea": "Bhalki",
                        "adminArea": "Karnataka",
                        "subAdminArea": "Bidar"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "ADMINISTRATIVE_AREA_LEVEL_3"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "ADMINISTRATIVE_AREA_LEVEL_3"
                        ]
                    },
                    "viewport": {
                        "southwest": {
                            "lng": 76.9202153,
                            "lat": 17.8540752
                        },
                        "northeast": {
                            "lng": 77.4140608,
                            "lat": 18.2077448
                        }
                    },
                    "name": "Bhalki",
                    "siteId": "20F9379C73B5A3DDBE0FC1A70D77F87B",
                    "location": {
                        "lng": 77.22496066510465,
                        "lat": 18.03091
                    }
                },
                {
                    "formatAddress": "India",
                    "address": {
                        "country": "India",
                        "countryCode": "IN",
                        "adminArea": "Karnataka",
                        "subAdminArea": "Bidar"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "ADMINISTRATIVE_AREA_LEVEL_2"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "ADMINISTRATIVE_AREA_LEVEL_2"
                        ]
                    },
                    "viewport": {
                        "southwest": {
                            "lng": 76.6906815,
                            "lat": 17.5830836
                        },
                        "northeast": {
                            "lng": 77.655867,
                            "lat": 18.458847
                        }
                    },
                    "name": "Bidar",
                    "siteId": "2444F4ABC13BEEFDA1AC75CD9BD3FD44",
                    "location": {
                        "lng": 77.2486490058066,
                        "lat": 18.0209653
                    }
                },
                {
                    "formatAddress": "India",
                    "address": {
                        "country": "India",
                        "countryCode": "IN",
                        "adminArea": "Karnataka"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "ADMINISTRATIVE_AREA_LEVEL_1"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "ADMINISTRATIVE_AREA_LEVEL_1"
                        ]
                    },
                    "viewport": {
                        "southwest": {
                            "lng": 74.0509625,
                            "lat": 11.5945336
                        },
                        "northeast": {
                            "lng": 78.5876366,
                            "lat": 18.458847
                        }
                    },
                    "name": "Karnataka",
                    "siteId": "76633A6DA68C893C9AE654C7FF506F97",
                    "location": {
                        "lng": 76.16768673911331,
                        "lat": 14.7102713929855
                    }
                },
                {
                    "formatAddress": "",
                    "address": {
                        "country": "India",
                        "countryCode": "IN"
                    },
                    "poi": {
                        "hwPoiTypes": [
                            "COUNTRY"
                        ],
                        "rating": 0.0,
                        "internationalPhone": "",
                        "poiTypes": [
                            "COUNTRY"
                        ]
                    },
                    "viewport": {
                        "southwest": {
                            "lng": 68.1061138,
                            "lat": 6.7604429
                        },
                        "northeast": {
                            "lng": 97.4152924,
                            "lat": 36.95475579999999
                        }
                    },
                    "name": "India",
                    "siteId": "A44719C2043653BB06204386B976C7BC",
                    "location": {
                        "lng": 79.55967674729584,
                        "lat": 22.57785875
                    }
                }
            ],
            "returnDesc": "OK"
        }
        """
        let jsonDecode = JSONDecoder()
        do {
            let result = try jsonDecode.decode(ReverseGeocodeResponse.self, from: bodyData.data(using: String.Encoding.utf8)!)
            completionHandler(result, nil)
        } catch let error {
            Log.error("body param to json convert error: \(error.localizedDescription)")
        }
    }
    
    /// timezone
    /// - Parameters:
    ///   - request: TimezoneRequest instance.
    ///   - apiContext: ApiContext instance incase CP wants to edit for one call only.
    ///   - completion: Completion Handler.
    func timezone(with request: TimezoneRequest, apiContext: ApiContext?=nil, completionHandler: @escaping (TimezoneResponse?, NSError?) -> Void) {
        let bodyData = """
        {
            "returnCode": "0",
            "timeZoneName": "Central African Time",
            "rawOffset": 7200,
            "timeZoneId": "Africa/Khartoum",
            "dstOffset": 0,
            "returnDesc": "OK"
        }
        """
        let jsonDecode = JSONDecoder()
        do {
            let result = try jsonDecode.decode(TimezoneResponse.self, from: bodyData.data(using: String.Encoding.utf8)!)
            completionHandler(result, nil)
        } catch let error {
            Log.error("body param to json convert error: \(error.localizedDescription)")
        }
    }
    
}
