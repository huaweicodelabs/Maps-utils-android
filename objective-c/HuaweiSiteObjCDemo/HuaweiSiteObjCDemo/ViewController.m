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

#import "ViewController.h"
#import <HuaweiSiteObjc/SiteClient.h>

@interface ViewController ()

@property SiteClient * siteClient;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Before you start using the HuaweiSite SDK, you need to set apiContext instance.
    NSString *apiKey = [NSString stringWithCString:"<<YOUR_API_KEY>>" encoding:NSUTF8StringEncoding];
    NSString *encodedApiKey = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(nil,(CFStringRef)apiKey,nil,(CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8 ));
    ApiContext *apiContext = [ApiContext alloc];
    apiContext.apiKey = encodedApiKey;
    [SiteClient provideApiContext:apiContext];
    
    self.siteClient = [SiteClient shared];
    
}

//MARK: - Actions
- (IBAction)textSearchAction:(id)sender {
    [self callTextSearch];
}
- (IBAction)nearbySearchAction:(id)sender {
    [self callNearbySearch];
}
- (IBAction)detailSearchAction:(id)sender {
    [self callDetailSearch];
}
- (IBAction)querySuggestionAction:(id)sender {
    [self callQuerySuggestion];
}
- (IBAction)queryAutocompleteAction:(id)sender {
    [self callQueryAutocomplete];
}
- (IBAction)geocodeAction:(id)sender {
    [self callGeocode];
}
- (IBAction)reverseGeocodeAction:(id)sender {
    [self callReverseGeocode];
}
- (IBAction)timezoneAction:(id)sender {
    [self callTimezone];
}

//MARK: - Huawei Site Functions

-(void) callTextSearch{
    NSNumber *lat = [NSNumber numberWithDouble:48.8815];
    NSNumber *lng = [NSNumber numberWithDouble:2.4444];
    TextSearchRequest *request = [[TextSearchRequest alloc] initWith:@"Hotel" location:[[Coordinate alloc] initWithLat:lat lng:lng] radius:nil poiType:kLT_BAR hwPoiType:kHWLT_BAR countryCode:nil language:nil pageSize:nil pageIndex:nil children:nil];
    
    [self.siteClient textSearch:request completionHandler:^(TextSearchResponse* response, NSError* error) {
        if (response){
            NSLog(@"textSearch success! %@", response);
            [self showAlert: @"TextSearchResponse" message:@"Success!"];
        }
        
        if (error){
            NSLog(@"textSearch error! %@", error);
            [self showAlert: @"Error" message:error.localizedDescription];
        }
    }];
    
}

-(void) callTextSearchwithCustomApiContext {
    NSNumber *lat = [NSNumber numberWithDouble:48.8815];
    NSNumber *lng = [NSNumber numberWithDouble:2.4444];
    TextSearchRequest *request = [[TextSearchRequest alloc] initWith:@"Hotel" location:[[Coordinate alloc] initWithLat:lat lng:lng] radius:nil poiType:nil hwPoiType:nil countryCode:nil language:nil pageSize:nil pageIndex:nil children:nil];
    ApiContext *apiContext = [ApiContext alloc];
    NSNumber *maxRetry = [NSNumber numberWithInt:5];
    NSNumber *retryInterval = [NSNumber numberWithDouble:2.0];
    NSNumber *timeoutInterval = [NSNumber numberWithInt:120];
    apiContext.maxRetry = maxRetry;
    apiContext.retryInterval = retryInterval;
    apiContext.timeoutInterval = timeoutInterval;
    [self.siteClient textSearchWithApiContext:request apiContext:apiContext completionHandler:^(TextSearchResponse* response, NSError* error) {
        if (response){
            NSLog(@"textSearch success! %@", response);
            [self showAlert: @"TextSearchResponse" message:@"Success!"];
        }
        
        if (error){
            NSLog(@"textSearch error! %@", error);
            [self showAlert: @"Error" message:error.localizedDescription];
        }
    }];
    
}

-(void) callNearbySearch{
    NSNumber *radius = [NSNumber numberWithInteger:5000];
    NSNumber *lat = [NSNumber numberWithDouble:48.8815];
    NSNumber *lng = [NSNumber numberWithDouble:2.4444];
    NSNumber *pageSize = [NSNumber numberWithInt:1];
    NSNumber *pageIndex = [NSNumber numberWithInt:1];
    NearbySearchRequest *request = [[NearbySearchRequest alloc] initWithLocation:[[Coordinate alloc] initWithLat:lat lng:lng] radius:radius query:@"hotel" pageSize:pageSize pageIndex:pageIndex poiType:kHWLT_HOTEL hwPoiType:kHWLT_HOTEL language:@"en"];
    
    [self.siteClient nearbySearch:request completionHandler:^(NearbySearchResponse* response, NSError* error) {
        if (response){
            NSLog(@"nearbySearch success! %@", response);
            [self showAlert: @"NearbySearchResponse" message:@"Success!"];
        }
        
        if (error){
            NSLog(@"nearbySearch error! %@", error);
            [self showAlert: @"Error" message:error.localizedDescription];
        }
    }];
}

-(void) callDetailSearch{
    BOOL children = YES;
    DetailSearchRequest *request = [[DetailSearchRequest alloc] initWithSiteId:@"EB731B7298F1E2EEDC42532CFD3B8E32" language:@"en" children:&children];
    [self.siteClient detailSearch:request completionHandler:^(DetailSearchResponse* response, NSError* error) {
        if (response){
            NSLog(@"detailSearch success! %@", response);
            [self showAlert: @"DetailSearchResponse" message:@"Success!"];
        }
        
        if (error){
            NSLog(@"detailSearch error! %@", error);
            [self showAlert: @"Error" message:error.localizedDescription];
        }
    }];
}

-(void) callQuerySuggestion{
    NSNumber *radius = [NSNumber numberWithInteger:10000];
    NSNumber *lat = [NSNumber numberWithDouble:41.300621];
    NSNumber *lng = [NSNumber numberWithDouble:2.0797638];
    NSNumber *nlat = [NSNumber numberWithDouble:41.50];
    NSNumber *nlng = [NSNumber numberWithDouble:2.181];
    NSNumber *slat = [NSNumber numberWithDouble:41.099];
    NSNumber *slng = [NSNumber numberWithDouble:2.0080];
    CoordinateBounds *bounds = [[CoordinateBounds alloc] initWith:[[Coordinate alloc] initWithLat:nlat lng:nlng] southwest:[[Coordinate alloc] initWithLat:slat lng:slng]];
    BOOL children = YES;
    NSMutableArray <NSString *> *poiTypes = [NSMutableArray arrayWithObjects:kLT_GEOCODE,kLT_ESTABLISHMENT, nil];
    QuerySuggestionRequest *request = [[QuerySuggestionRequest alloc] initWith:@"Accés a l' Aeroport" location:[[Coordinate alloc] initWithLat:lat lng:lng] radius:radius bounds:bounds poiTypes:poiTypes countryCode:@"ES" language:@"en" children:&children];
    
    [self.siteClient querySuggestion:request completionHandler:^(QuerySuggestionResponse* response, NSError* error) {
        if (response){
            NSLog(@"querySuggestion success! %@", response);
            [self showAlert: @"QuerySuggestionResponse" message:@"Success!"];
        }
        
        if (error){
            NSLog(@"querySuggestion error! %@", error);
            [self showAlert: @"Error" message:error.localizedDescription];
        }
    }];
}

-(void) callQueryAutocomplete{
    NSNumber *radius = [NSNumber numberWithInteger:10000];
    NSNumber *lat = [NSNumber numberWithDouble:41.300621];
    NSNumber *lng = [NSNumber numberWithDouble:2.0797638];
    BOOL children = YES;
    QueryAutocompleteRequest *request = [[QueryAutocompleteRequest alloc] initWith:@"Accés a l' Aeroport" location:[[Coordinate alloc] initWithLat:lat lng:lng]  radius:radius language:@"en" children:&children];
    
    [self.siteClient queryAutocomplete:request completionHandler:^(QueryAutocompleteResponse* response, NSError* error) {
        if (response){
            NSLog(@"queryAutocomplete success! %@", response);
            [self showAlert: @"QueryAutocompleteResponse" message:@"Success!"];
        }
        
        if (error){
            NSLog(@"queryAutocomplete error! %@", error);
            [self showAlert: @"Error" message:error.localizedDescription];
        }
    }];
}

-(void) callGeocode{
    NSNumber *nlat = [NSNumber numberWithDouble:51.512];
    NSNumber *nlng = [NSNumber numberWithDouble:-0.0953];
    NSNumber *slat = [NSNumber numberWithDouble:50.512];
    NSNumber *slng = [NSNumber numberWithDouble:-1.0953];
    CoordinateBounds *bounds = [[CoordinateBounds alloc] initWith:[[Coordinate alloc] initWithLat:nlat lng:nlng] southwest:[[Coordinate alloc] initWithLat:slat lng:slng]];
    GeocodeRequest *request = [[GeocodeRequest alloc] initWith:@"Cleary Garden,Queen Victoria St,London" bounds:bounds language:@"en"];
    
    [self.siteClient geocode:request completionHandler:^(GeocodeResponse* response, NSError* error) {
        if (response){
            NSLog(@"geocode success! %@", response);
            [self showAlert: @"GeocodeResponse" message:@"Success!"];
        }
        
        if (error){
            NSLog(@"geocode error! %@", error);
            [self showAlert: @"Error" message:error.localizedDescription];
        }
    }];
}

-(void) callReverseGeocode{
    NSNumber *lat = [NSNumber numberWithDouble:18.0527];
    NSNumber *lng = [NSNumber numberWithDouble:77.2155];
    BOOL returnPoi = YES;
    ReverseGeocodeRequest *request = [[ReverseGeocodeRequest alloc] initWith:[[Coordinate alloc] initWithLat:lat lng:lng] language:@"en" returnPoi:&returnPoi];
    
    [self.siteClient reverseGeocode:request completionHandler:^(ReverseGeocodeResponse* response, NSError* error) {
        if (response){
            NSLog(@"reverseGeocode success! %@", response);
            [self showAlert: @"ReverseGeocodeResponse" message:@"Success!"];
        }
        
        if (error){
            NSLog(@"reverseGeocode error! %@", error);
            [self showAlert: @"Error" message:error.localizedDescription];
        }
    }];
}

-(void) callTimezone{
    NSNumber *lat = [NSNumber numberWithDouble:12.242585];
    NSNumber *lng = [NSNumber numberWithDouble:30.23235];
    NSNumber *timeStampObj = [NSNumber numberWithDouble: 1577435043];
    TimezoneRequest *request = [[TimezoneRequest alloc] initWith:[[Coordinate alloc] initWithLat:lat lng:lng] timestamp:timeStampObj language:@"en"];
    
    [self.siteClient timezone:request completionHandler:^(TimezoneResponse* response, NSError* error) {
        if (response){
            NSLog(@"timezone success! %@", response);
            [self showAlert: @"TimezoneResponse" message:@"Success!"];
        }
        
        if (error){
            NSLog(@"timezone error! %@", error);
            [self showAlert: @"Error" message:error.localizedDescription];
        }
    }];
}

- (void)showAlert:(NSString *)title message: (NSString*) message{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                       message:message
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    });
}

@end



