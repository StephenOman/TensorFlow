//
//  TFGraphDef.m
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

#import "TFGraphDef.h"

#include <iostream>
#include <fstream>

#include "tensorflow/core/public/version.h"

@interface TFGraphDef() {
    tensorflow::GraphDef tf_GraphDef;
}

@end

@implementation TFGraphDef

- (instancetype) init
{
    return self;
}

- (void) loadGraphFromFileName:(NSString *)filename didFailWithError:(NSError * __autoreleasing *)error
{
    if(error != NULL) {
        
        GOOGLE_PROTOBUF_VERIFY_VERSION;
        
        // Check if the Graph exists
        if([[NSFileManager defaultManager] fileExistsAtPath:filename]) {
            
            // Load the Graph from the specified file
            std::filebuf buffer;
            if(buffer.open([filename cStringUsingEncoding:NSASCIIStringEncoding], std::ios::binary | std::ios::in)) {
                std::istream input(&buffer);
                if(!(tf_GraphDef.ParseFromIstream(&input))) {
                    *error = [NSError errorWithDomain:@TF_VERSION_STRING code:tensorflow::error::NOT_FOUND userInfo:[NSDictionary dictionaryWithObject:@"Unable to parse input file" forKey:NSLocalizedDescriptionKey]];
                } else {
                    *error = [NSError errorWithDomain:@TF_VERSION_STRING code:tensorflow::error::UNAVAILABLE userInfo:[NSDictionary dictionaryWithObject:@"TF_GraphDef not initialized" forKey:NSLocalizedDescriptionKey]];
                    
                }
            } else {
                *error = [NSError errorWithDomain:@TF_VERSION_STRING code:tensorflow::error::DATA_LOSS userInfo:[NSDictionary dictionaryWithObject:@"Unable to load TensorFlow Graph. Error reading file." forKey:NSLocalizedDescriptionKey]];
            }
        } else {
            *error = [NSError errorWithDomain:@TF_VERSION_STRING code:tensorflow::error::NOT_FOUND userInfo:[NSDictionary dictionaryWithObject:@"Unable to load TensorFlow Graph. File not found." forKey:NSLocalizedDescriptionKey]];
        }
    } else {
        NSLog(@"%@", @"Invalid NSError argument");
    }
}

- (tensorflow::GraphDef) getTFGraph {
    return tf_GraphDef;
}

@end
