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

#import "TextSearchRequest.h"

@implementation TextSearchRequest

- (id) initWith:(nonnull NSString *) _query
       location: (nullable Coordinate *) _location
         radius: (nullable NSNumber *) _radius
        poiType: (nullable NSString *) _poiType
      hwPoiType: (nullable NSString *) _hwPoiType
    countryCode: (nullable NSString *) _countryCode
       language: (nullable NSString *) _language
       pageSize: (nullable NSNumber *) _pageSize
      pageIndex: (nullable NSNumber *) _pageIndex
       children: (nullable BOOL *) _children{
    if(self = [super init]){
        self.query = _query;
        self.location = _location;
        self.radius = _radius;
        self.poiType = _poiType;
        self.hwPoiType = _hwPoiType;
        self.countryCode = _countryCode;
        self.language = _language;
        self.pageSize = _pageSize;
        self.pageIndex = _pageIndex;
        self.children = _children;
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
    if(self.countryCode != nil){
        [dict setObject:self.countryCode forKey:@"countryCode"];
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
    if(self.children != nil){
        NSNumber *childrenNmbr = [NSNumber numberWithBool:*(self.children)];
        
        [dict setObject:childrenNmbr forKey:@"children"];
    }
    return dict;
}
@end
