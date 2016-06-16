//
//  TFGraphDef.h
//  tensorflow-api
//
//  Created by Stephen Oman on 13/06/2016.
//  Copyright © 2016 Stephen Oman. All rights reserved.
//
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

#import "TFTypes.h"

#include "tensorflow/core/public/session.h"


@interface TFGraphDef : NSObject

// Load a graph from a bundled resource

- (instancetype) init;

- (void) loadGraphFromFileName:(NSString *)filename didFailWithError:(NSError * __autoreleasing *)error;

- (tensorflow::GraphDef) getTFGraph;

@end
