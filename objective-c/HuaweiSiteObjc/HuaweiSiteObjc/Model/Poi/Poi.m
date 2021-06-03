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

#import "Poi.h"

@implementation Poi

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (self = [super init]) {
        for (NSString *fieldName in dictionary) {
            if ([fieldName isEqualToString:@"openingHours"]){
                NSDictionary *openingHoursDict = [dictionary objectForKey:fieldName];
                OpeningHours *openingHours = [[OpeningHours alloc] initWithDictionary:openingHoursDict];
                [self setValue:openingHours forKey:fieldName];
            }else if ([fieldName isEqualToString:@"childrenNodes"]){
                NSDictionary *childrenNodesDict = [dictionary objectForKey:fieldName];
                NSMutableArray *childrenNodesArray = [[NSMutableArray alloc]init];
                for (NSDictionary* childrenNodeDict in childrenNodesDict) {
                    ChildrenNode *node = [[ChildrenNode alloc] initWithDictionary:childrenNodeDict];
                    [childrenNodesArray addObject:node];
                }
                [self setValue:childrenNodesArray forKey:fieldName];
            }else{
                [self setValue:[dictionary objectForKey:fieldName] forKey:fieldName];
            }        }
    }
    return self;
}

@end
