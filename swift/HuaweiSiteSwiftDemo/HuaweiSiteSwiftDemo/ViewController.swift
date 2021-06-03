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

import UIKit
import HuaweiSite

class ViewController: UIViewController {
    private let siteClient = SiteClient.shared
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let key = "<<YOUR_API_KEY>>"
        if let encodedKey = key.addingPercentEncoding(withAllowedCharacters: .alphanumerics){
            let apiContext: ApiContext = ApiContext().set(apiKey: encodedKey).build()
            SiteClient.provideApiContext(with: apiContext)
        }
    }
    
    //MARK: - Actions
    
    @IBAction func textSearchAction(_ sender: Any) {
        self.callTextSearch()
    }
    
    @IBAction func nearbySearchAction(_ sender: Any) {
        self.callNearbySearch()
    }
    
    @IBAction func detailSearchAction(_ sender: Any) {
        self.callDetailSearch()
    }
    
    @IBAction func querySuggestionAction(_ sender: Any) {
        self.callQuerySuggestion()
    }
    
    @IBAction func queryAutocompleteAction(_ sender: Any) {
        self.callQueryAutocomplete()
    }
    
    @IBAction func geocodeAction(_ sender: Any) {
        self.callGeocode()
    }
    
    @IBAction func reverseGeocodeAction(_ sender: Any) {
        self.callReverseGeocode()
    }
    
    @IBAction func timezoneAction(_ sender: Any) {
        self.callTimezone()
    }
    
    //MARK: - Huawei Site Functions
    
    func callTextSearch(){
        let request: TextSearchRequest = TextSearchRequest(query: "hotel", location: Coordinate(lat: 50.705085, lng:3.159491), radius: 500, hwPoiType: HwLocationType.HOTEL, countryCode: "FR", language: "en", pageSize: 1, pageIndex: 1, children: true)
        siteClient.textSearch(with: request){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                self?.showAlert(title: "Error", message: error.localizedDescription)
                return
            }
            if let result = result {
                print(result)
                self?.showAlert(title: "TextSearchResponse", message: "Success!")
            }
        }
    }
    
    //You may call text search request for custom api config details.
    func callTextSearchwithCustomApiContext(){
        let customApiContext:ApiContext = ApiContext()
            .set(maxRetry: 5)
            .set(retryInterval: 2)
            .set(timeoutInterval: 2).build()
        let request: TextSearchRequest = TextSearchRequest(query: "hotel", location: Coordinate(lat: 50.705085, lng:3.159491), radius: 500, hwPoiType: HwLocationType.HOTEL, countryCode: "FR", language: "en", pageSize: 1, pageIndex: 1, children: true)
        siteClient.textSearch(with: request, apiContext: customApiContext){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                self?.showAlert(title: "Error", message: error.localizedDescription)
                return
            }
            if let result = result {
                print(result)
                self?.showAlert(title: "TextSearchResponse", message: "Success!")
            }
        }
    }
    
    func callNearbySearch(){
        let request: NearbySearchRequest = NearbySearchRequest(location: Coordinate(lat: 48.8815, lng: 2.4444))
        siteClient.nearbySearch(with: request){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                self?.showAlert(title: "Error", message: error.localizedDescription)
                return
            }
            if let result = result {
                print(result)
                self?.showAlert(title: "NearbySearchResponse", message: "Success!")
            }
        }
    }
    
    func callDetailSearch(){
        let request = DetailSearchRequest(siteId: "EB731B7298F1E2EEDC42532CFD3B8E32", language: "en", children: true)
        siteClient.detailSearch(with: request){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                self?.showAlert(title: "Error", message: error.localizedDescription)
                return
            }
            if let result = result {
                print(result)
                self?.showAlert(title: "DetailSearchResponse", message: "Success!")
            }
        }
    }
    
    func callQuerySuggestion(){
        let request = QuerySuggestionRequest(query: "Accés a l' Aeroport", location: Coordinate(lat: 41.300621, lng: 2.0797638), radius: 10000, bounds: CoordinateBounds(northeast: Coordinate(lat: 41.50, lng: 2.181), southwest: Coordinate(lat: 41.099, lng: 2.0080)), poiTypes: [LocationType.GEOCODE, LocationType.ESTABLISHMENT], countryCode: "ES", language: "en", children: true)
        siteClient.querySuggestion(with: request){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                self?.showAlert(title: "Error", message: error.localizedDescription)
                return
            }
            if let result = result {
                print(result)
                self?.showAlert(title: "QuerySuggestionResponse", message: "Success!")
            }
        }
    }
    
    func callQueryAutocomplete(){
        let request = QueryAutocompleteRequest(query: "Accés a l' Aeroport", location: Coordinate(lat: 41.300621, lng: 2.0797638), radius: 10000, language: "en", children: true)
        siteClient.queryAutocomplete(with: request){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                self?.showAlert(title: "Error", message: error.localizedDescription)
                return
            }
            if let result = result {
                print(result)
                self?.showAlert(title: "QueryAutocompleteResponse", message: "Success!")
            }
        }
    }
    
    func callGeocode(){
        let request = GeocodeRequest(address: "Cleary Garden,Queen Victoria St,London", bounds: CoordinateBounds(northeast: Coordinate(lat: 51.512, lng: -0.0953), southwest: Coordinate(lat: 50.512 , lng: -1.0953)), language: "en")
        
        siteClient.geocode(with: request){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                self?.showAlert(title: "Error", message: error.localizedDescription)
                return
            }
            if let result = result {
                print(result)
                self?.showAlert(title: "GeocodeResponse", message: "Success!")
            }
        }
    }
    
    func callReverseGeocode(){
        let request = ReverseGeocodeRequest(location: Coordinate(lat: 18.0527, lng: 77.2155), language: "en", returnPoi: true)
        
        siteClient.reverseGeocode(with: request){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                self?.showAlert(title: "Error", message: error.localizedDescription)
                return
            }
            if let result = result {
                print(result)
                self?.showAlert(title: "ReverseGeocodeResponse", message: "Success!")
            }
        }
    }
    
    
    func callTimezone(){
        let request = TimezoneRequest(location: Coordinate(lat: 12.242585, lng: 30.23235), timestamp: 1577435043, language: "en")
        
        siteClient.timezone(with: request){[weak self] (result, error) in
            guard self != nil else {return}
            if let error = error {
                self?.showAlert(title: "Error", message: error.localizedDescription)
                return
            }
            if let result = result {
                print(result)
                self?.showAlert(title: "TimezoneResponse", message: "Success!")
            }
        }
    }
    
    func showAlert(title: String, message: String?) -> Void {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
    }
}

