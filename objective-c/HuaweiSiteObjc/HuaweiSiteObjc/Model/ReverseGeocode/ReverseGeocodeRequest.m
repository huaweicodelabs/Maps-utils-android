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

#import "ReverseGeocodeRequest.h"

@implementation ReverseGeocodeRequest

- (id) initWith:(nonnull Coordinate *) location
       language: (nullable NSString *) language
      returnPoi: (nullable BOOL *) returnPoi{
    if(self = [super init]){
        self.location = location;
        self.language = language;
        self.returnPoi = returnPoi;
    }
    return self;
}

- (NSDictionary*) toDictionary{
    NSMutableDictionary *dict = [NSMutableDictionary new];
    if(self.location != nil){
        NSDictionary *locationDict = [NSDictionary dictionaryWithObjectsAndKeys:self.location.lat,@"lat",self.location.lng,@"lng", nil];
        
        [dict setObject:locationDict forKey:@"location"];
    }
    if(self.language != nil){
        [dict setObject:self.language forKey:@"language"];
    }
    if(self.returnPoi != nil){
        NSNumber *returnPoiNmbr = [NSNumber numberWithBool:*(self.returnPoi)];
        
        [dict setObject:returnPoiNmbr forKey:@"returnPoi"];
    }
    return dict;
}

@end
