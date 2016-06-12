//
//  TFTypes.h
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


#ifndef TFTypes_h
#define TFTypes_h

typedef NS_ENUM(NSInteger, TFDataType) {
    TF_FLOAT = 1,
    TF_DOUBLE = 2,
    TF_INT32 = 3,  // Int32 tensors are always in 'host' memory.
    TF_UINT8 = 4,
    TF_INT16 = 5,
    TF_INT8 = 6,
    TF_STRING = 7,
    TF_COMPLEX64 = 8,  // Single-precision complex
    TF_COMPLEX = 8,    // Old identifier kept for API backwards compatibility
    TF_INT64 = 9,
    TF_BOOL = 10,
    TF_QINT8 = 11,     // Quantized int8
    TF_QUINT8 = 12,    // Quantized uint8
    TF_QINT32 = 13,    // Quantized int32
    TF_BFLOAT16 = 14,  // Float32 truncated to 16 bits.  Only for cast ops.
    TF_QINT16 = 15,    // Quantized int16
    TF_QUINT16 = 16,   // Quantized uint16
    TF_UINT16 = 17,
    TF_COMPLEX128 = 18,  // Double-precision complex
    TF_HALF = 19,
};

typedef NS_ENUM(NSInteger, TFCode) {
    TF_OK = 0,
    TF_CANCELLED = 1,
    TF_UNKNOWN = 2,
    TF_INVALID_ARGUMENT = 3,
    TF_DEADLINE_EXCEEDED = 4,
    TF_NOT_FOUND = 5,
    TF_ALREADY_EXISTS = 6,
    TF_PERMISSION_DENIED = 7,
    TF_UNAUTHENTICATED = 16,
    TF_RESOURCE_EXHAUSTED = 8,
    TF_FAILED_PRECONDITION = 9,
    TF_ABORTED = 10,
    TF_OUT_OF_RANGE = 11,
    TF_UNIMPLEMENTED = 12,
    TF_INTERNAL = 13,
    TF_UNAVAILABLE = 14,
    TF_DATA_LOSS = 15,
};


#endif /* TFTypes_h */
