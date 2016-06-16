//
//  TFSession.m
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


#import "TFSession.h"
#import "TFTypes.h"

#include "tensorflow/core/public/session.h"

#include <string>
#include <vector>

@interface TFSession() {
    tensorflow::Session *tf_session;
}

@end

@implementation TFSession

- (instancetype)init
{
    tf_session = nullptr;
    tensorflow::SessionOptions sessionOptions;
    tensorflow::Status status = tensorflow::NewSession(sessionOptions, &(tf_session));
    //ToDo - Check for errors
    
    return self;
}

- (void) loadGraph:(TFGraphDef *)graph didFailWithError:(NSError *__autoreleasing *)error
{
    if(tf_session) {
        tensorflow::Status status = tf_session->Create([graph getTFGraph]);
        if(!status.ok()) {
            NSString *errorMessage = [NSString stringWithFormat:@"Unable to load graph into session. TensorFlow error: %s", status.error_message().c_str()];
            *error = [NSError errorWithDomain:TENSORFLOW code:TF_UNAVAILABLE userInfo:[NSDictionary dictionaryWithObject:errorMessage forKey:NSLocalizedDescriptionKey]];
        }
    } else {
        *error = [NSError errorWithDomain:TENSORFLOW code:TF_UNAVAILABLE userInfo:[NSDictionary dictionaryWithObject:@"Unable to load graph into session. Session not initialized." forKey:NSLocalizedDescriptionKey]];
    }

}

- (NSArray *)runGraphWithInputs:(NSDictionary *)inputs outputNames:(NSArray *)outputNames targetNodeNames:(NSArray *)targetNodeNames didFailWithError:(NSError *__autoreleasing *)error
{
    // Need to convert parameters to C++ containers before calling
    // the Tensorflow library
    
    // Inputs
    std::vector<std::pair<std::string, tensorflow::Tensor>> inputVector;
    if(inputs != NULL) {
        for(NSString *name in outputNames) {
            std::string str_name = std::string([name UTF8String]);
            tensorflow::Tensor inputTensor;
            inputVector.push_back(std::make_pair(str_name, inputTensor));
        }
    }
    
    // Output Names
    std::vector<std::string> outputNamesVector;
    if(outputNames != NULL) {
        for(NSString *name in outputNames) {
            std::string str_name = std::string([name UTF8String]);
            outputNamesVector.push_back(str_name);
        }
    }
    
    // Target Node Names
    std::vector<std::string> targetNodeNamesVector;
    if(targetNodeNames != NULL) {
        for(NSString *name in targetNodeNames) {
            std::string str_name = std::string([name UTF8String]);
            targetNodeNamesVector.push_back(str_name);
        }
    }
    
    // Output tensors
    std::vector<tensorflow::Tensor> outputs;
    
    
    // Run the graph
    tf_session->Run(inputVector, outputNamesVector, targetNodeNamesVector, &outputs);
    
    // Convert the output to Objective C++
    
    
    return NULL;
}

- (void)closeSession
{
    tf_session->Close();
}

@end
