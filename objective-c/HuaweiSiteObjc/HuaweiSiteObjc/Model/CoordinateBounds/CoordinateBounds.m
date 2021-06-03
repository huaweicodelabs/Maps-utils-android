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

#import "CoordinateBounds.h"

@implementation CoordinateBounds

- (instancetype) initWith:(Coordinate *)northeast southwest:(Coordinate *)southwest{
    self = [super init];
    if(self){
        self.northeast = northeast;
        self.southwest = southwest;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (self = [super init]) {
        for (NSString *fieldName in dictionary) {
            NSDictionary *locationDict = [dictionary objectForKey:fieldName];
            Coordinate *location = [[Coordinate alloc] initWithDictionary:locationDict];
            [self setValue:location forKey:fieldName];
        }
    }
    return self;
}

@end
