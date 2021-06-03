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

#import "BaseResponse.h"
#import "Site.h"

@implementation BaseResponse

- (id) initWithDescription:(NSString *)_returnCode returnDesc:(NSString *)_returnDesc {
    if(self = [super init]){
        self.returnCode = _returnCode;
        self.returnDesc = _returnDesc;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (self = [super init]) {
        for (NSString *fieldName in dictionary) {
            if ([self respondsToSelector:NSSelectorFromString(fieldName)]) {
                if ([fieldName isEqualToString:@"sites"]){
                    NSDictionary *sitesDict = [dictionary objectForKey:fieldName];
                    NSMutableArray *sitesArray = [[NSMutableArray alloc]init];
                    for (NSDictionary* siteDict in sitesDict) {
                        Site *site = [[Site alloc] initWithDictionary:siteDict];
                        [sitesArray addObject:site];
                    }
                    [self setValue:sitesArray forKey:fieldName];
                }else  if ([fieldName isEqualToString:@"predictions"]){
                    NSDictionary *predictionsDict = [dictionary objectForKey:fieldName];
                    NSMutableArray *predictionsArray = [[NSMutableArray alloc]init];
                    for (NSDictionary* predictionDict in predictionsDict) {
                        AutoCompletePrediction *prediction = [[AutoCompletePrediction alloc] initWithDictionary:predictionDict];
                        [predictionsArray addObject:prediction];
                    }
                    [self setValue:predictionsArray forKey:fieldName];
                }else if ([fieldName isEqualToString:@"site"]){
                    NSDictionary *siteDict = [dictionary objectForKey:fieldName];
                    Site *site = [[Site alloc] initWithDictionary:siteDict];
                    [self setValue:site forKey:fieldName];
                }else{
                    [self setValue:[dictionary objectForKey:fieldName] forKey:fieldName];
                }
            }
        }
    }
    return self;
}

@end
