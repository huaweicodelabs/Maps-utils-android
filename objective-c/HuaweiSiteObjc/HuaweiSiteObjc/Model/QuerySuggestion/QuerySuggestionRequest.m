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

#import "QuerySuggestionRequest.h"

@implementation QuerySuggestionRequest
- (id) initWith:(nonnull NSString *) query
       location: (nullable Coordinate *) location
         radius: (nullable NSNumber *) radius
         bounds: (nullable CoordinateBounds *) bounds
       poiTypes: (nullable NSArray<NSString *> *) poiTypes
    countryCode: (nullable NSString *) countryCode
       language: (nullable NSString *) language
       children: (nullable BOOL *) children{
    if(self = [super init]){
        self.query = query;
        self.location = location;
        self.radius = radius;
        self.bounds = bounds;
        self.poiTypes = poiTypes;
        self.countryCode = countryCode;
        self.language = language;
        self.children = children;
    }
    return self;
}

- (NSDictionary*) toDictionary{
    NSMutableDictionary *dict = [NSMutableDictionary new];
    if(self.query != nil){
        [dict setObject:self.query forKey:@"query"];
    }
    if(self.location != nil){
        NSDictionary *locationDict = [NSDictionary dictionaryWithObjectsAndKeys:self.location.lat,@"lat",self.location.lng,@"lng", nil];
        
        [dict setObject:locationDict forKey:@"location"];
    }
    if(self.radius != nil){
        [dict setObject:self.radius forKey:@"radius"];
    }
    if(self.bounds != nil){
        NSDictionary *northeast = [NSDictionary dictionaryWithObjectsAndKeys:self.bounds.northeast.lat,@"lat",self.bounds.northeast.lng,@"lng", nil];
        NSDictionary *southwest = [NSDictionary dictionaryWithObjectsAndKeys:self.bounds.southwest.lat,@"lat",self.bounds.southwest.lng,@"lng", nil];
        NSMutableDictionary *boundsDict = [NSMutableDictionary new];
        [boundsDict setObject:northeast forKey:@"northeast"];
        [boundsDict setObject:southwest forKey:@"southwest"];
        
        [dict setObject:boundsDict forKey:@"bounds"];
    }
    if(self.poiTypes != nil){
        [dict setObject:[self.poiTypes valueForKeyPath:@"uppercaseString"] forKey:@"poiTypes"];
    }
    if(self.countryCode != nil){
        [dict setObject:self.countryCode forKey:@"countryCode"];
    }
    if(self.language != nil){
        [dict setObject:self.language forKey:@"language"];
    }
    if(self.children != nil){
        NSNumber *childrenNmbr = [NSNumber numberWithBool:*(self.children)];
        
        [dict setObject:childrenNmbr forKey:@"children"];
    }
    return dict;
}

@end
