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

#import "GeocodeRequest.h"

@implementation GeocodeRequest
- (id) initWith:(nonnull NSString *) address
         bounds: (nullable CoordinateBounds *) bounds
       language: (nullable NSString *) language{
    if(self = [super init]){
        self.address = address;
        self.bounds = bounds;
        self.language = language;
    }
    return self;
}

- (NSDictionary*) toDictionary{
    NSMutableDictionary *dict = [NSMutableDictionary new];
    if(self.address != nil){
        [dict setObject:self.address forKey:@"address"];
    }
    if(self.bounds != nil){
        NSDictionary *northeast = [NSDictionary dictionaryWithObjectsAndKeys:self.bounds.northeast.lat,@"lat",self.bounds.northeast.lng,@"lng", nil];
        NSDictionary *southwest = [NSDictionary dictionaryWithObjectsAndKeys:self.bounds.southwest.lat,@"lat",self.bounds.southwest.lng,@"lng", nil];
        NSMutableDictionary *boundsDict = [NSMutableDictionary new];
        [boundsDict setObject:northeast forKey:@"northeast"];
        [boundsDict setObject:southwest forKey:@"southwest"];
        
        [dict setObject:boundsDict forKey:@"bounds"];
    }
    if(self.language != nil){
        [dict setObject:self.language forKey:@"language"];
    }
    return dict;
}
@end
