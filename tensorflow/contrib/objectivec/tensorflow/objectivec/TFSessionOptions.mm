//
//  TF_SessionOptions.m
//  tensorflow_api
//
//  Created by Stephen Oman on 20/04/2016.
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

#import "TFSessionOptions.h"

#include "tensorflow/core/public/session_options.h"

@interface TFSessionOptions () {

    tensorflow::SessionOptions sessionOptions;
    
}
@end


@implementation TFSessionOptions

- (instancetype)init {
    return self;
}

- (void)setTarget:(NSString *)target {
    
    // Note the encoding is strict ASCII.
    // TODO - Check if target string can contain non ASCII chars
    sessionOptions.target = [target cStringUsingEncoding:NSASCIIStringEncoding];
}

- (void)setConfig:(NSData *)proto withStatus:(TFStatus *)status {
    if(!sessionOptions.config.ParseFromArray([proto bytes], [proto length])) {
        status = tensorflow::errors::InvalidArgument("Unparseable ConfigProto");
    }
}

- (void)deleteSessionOptions {
    
}

@end
