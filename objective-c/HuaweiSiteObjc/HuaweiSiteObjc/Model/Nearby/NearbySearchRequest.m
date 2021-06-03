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

#import "NearbySearchRequest.h"

@implementation NearbySearchRequest

- (id) initWithLocation:(nonnull Coordinate *) location
                 radius: (nullable NSNumber *) radius
                  query: (nullable NSString *) query
               pageSize: (nullable NSNumber *) pageSize
              pageIndex: (nullable NSNumber *) pageIndex
                poiType: (nullable NSString *) poiType
              hwPoiType: (nullable NSString *) hwPoiType
               language: (nullable NSString *) language{
    if(self = [super init]){
        self.location = location;
        self.radius = radius;
        self.query = query;
        self.pageSize = pageSize;
        self.pageIndex = pageIndex;
        self.poiType = poiType;
        self.hwPoiType = hwPoiType;
        self.language = language;
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
    if(self.poiType != nil){
        [dict setObject:[self.poiType uppercaseString] forKey:@"poiType"];
    }
    if(self.hwPoiType != nil){
        [dict setObject:[self.hwPoiType uppercaseString] forKey:@"hwPoiType"];
    }
    if(self.language != nil){
        [dict setObject:self.language forKey:@"language"];
    }
    if(self.pageSize != nil){
        [dict setObject:self.pageSize forKey:@"pageSize"];
    }
    if(self.pageIndex != nil){
        [dict setObject:self.pageIndex forKey:@"pageIndex"];
    }
    return dict;
}
@end
