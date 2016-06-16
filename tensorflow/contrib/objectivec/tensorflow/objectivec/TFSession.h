//
//  TFSession.h
//  tensorflow_api
//
//  Created by Stephen Oman on 21/04/2016.
//  Copyright © 2016 Stephen Oman. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License

#import <Foundation/Foundation.h>

#import "TFGraphDef.h"
#import "TFTypes.h"

@interface TFSession : NSObject

- (instancetype)init;

- (void) loadGraph:(TFGraphDef *)graph didFailWithError:(NSError * __autoreleasing *) error;

- (void)closeSession;

- (NSArray *)runGraphWithInputs:(NSDictionary *)inputs outputNames:(NSArray *)outputNames targetNodeNames:(NSArray *)targetNodeNames didFailWithError:(NSError *__autoreleasing *)error;

/*
- (void)runGraph:(TFBuffer *)runOptions inNames:(NSArray *)inNames inTensors:(NSArray *)inputs \
    outNames:(NSMutableArray *)outNames outTensors:(NSMutableArray *)outTensors \
    targetNodes:(NSArray *)targetNodes metaData:(TFBuffer *)metaData status:(TFStatus *)status;

// Partial Run API not implemented
*/

@end
