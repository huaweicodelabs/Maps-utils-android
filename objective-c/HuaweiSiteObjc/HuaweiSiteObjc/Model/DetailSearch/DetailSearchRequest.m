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

#import "DetailSearchRequest.h"

@implementation DetailSearchRequest

- (id) initWithSiteId:(nonnull NSString *) siteId
             language: (nullable NSString *) language
             children: (nullable BOOL *) children{
    if(self = [super init]){
        self.siteId = siteId;
        self.language = language;
        self.children = children;
    }
    return self;
}

- (NSDictionary*) toDictionary{
    NSMutableDictionary *dict = [NSMutableDictionary new];
    if(self.siteId != nil){
        [dict setObject:self.siteId forKey:@"siteId"];
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
