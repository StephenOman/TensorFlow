//
//  TF_Status.m
//  tensorflow_api
//
//  Created by Stephen Oman on 20/04/2016.
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

#import "TFStatus.h"

#include "tensorflow/core/lib/core/status.h"
#include "tensorflow/core/lib/core/errors.h"
#include "tensorflow/core/lib/core/coding.h"

@interface TFStatus() {

    tensorflow::Status status;

}
@end


@implementation TFStatus

- (instancetype)init {
    return self;
}


- (instancetype)initWithCode:(TFCode)code message:(NSString *)message {

    tensorflow::StringPiece msg = tensorflow::StringPiece([message cStringUsingEncoding:NSASCIIStringEncoding], [message length]);
    
    status = tensorflow::Status(static_cast<::tensorflow::error::Code>(code), msg);
    
    return self;
}

- (TFCode)code {
    return static_cast<TFCode>(status.code());
}

- (NSString *)message {

    return [NSString stringWithCString:status.error_message().c_str() encoding:NSASCIIStringEncoding];
    
}

@end
