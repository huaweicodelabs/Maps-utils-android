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

#import "Site.h"

@implementation Site

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (self = [super init]) {
        for (NSString *fieldName in dictionary) {
            if ([fieldName isEqualToString:@"address"]){
                NSDictionary *addressDict = [dictionary objectForKey:fieldName];
                AddressDetail *address = [[AddressDetail alloc] initWithDictionary:addressDict];
                [self setValue:address forKey:fieldName];
            }else if ([fieldName isEqualToString:@"location"]){
                NSDictionary *locationDict = [dictionary objectForKey:fieldName];
                Coordinate *location = [[Coordinate alloc] initWithDictionary:locationDict];
                [self setValue:location forKey:fieldName];
            }else if ([fieldName isEqualToString:@"viewport"]){
                NSDictionary *boundsDict = [dictionary objectForKey:fieldName];
                CoordinateBounds *bounds = [[CoordinateBounds alloc] initWithDictionary:boundsDict];
                [self setValue:bounds forKey:fieldName];
            }else if ([fieldName isEqualToString:@"poi"]){
                NSDictionary *poiDict = [dictionary objectForKey:fieldName];
                Poi *poi = [[Poi alloc] initWithDictionary:poiDict];
                [self setValue:poi forKey:fieldName];
            }else if ([fieldName isEqualToString:@"prediction"]){
                NSDictionary *predictionDict = [dictionary objectForKey:fieldName];
                AutoCompletePrediction *prediction = [[AutoCompletePrediction alloc] initWithDictionary:predictionDict];
                [self setValue:prediction forKey:fieldName];
            }else{
                [self setValue:[dictionary objectForKey:fieldName] forKey:fieldName];
            }
        }
    }
    return self;
}

@end
