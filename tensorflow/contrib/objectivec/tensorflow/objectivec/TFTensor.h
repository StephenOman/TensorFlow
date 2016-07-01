//
//  TF_Tensor.h
//  tensorflow_api
//
//  Created by Stephen Oman on 20/04/2016.
//  Copyright © 2016 Stephen Oman. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "tensorflow/core/public/session.h"

@interface TFTensor : NSObject


- (tensorflow::Tensor) getNativeTensor;

- (instancetype)initWithData:(NSData *)data dimLengths:(NSArray *) dimLengths numDimensions:(NSInteger)numDimensions;

- (TFDataType)type;
- (NSInteger)dimensions;
- (NSInteger)lengthOfDimension:(NSInteger)dimension;
- (NSInteger)byteSize;
- (NSData *)data;

/*
 enum DataType {
 DT_INVALID = 0,
 DT_FLOAT = 1,
 DT_DOUBLE = 2,
 DT_INT32 = 3,
 DT_UINT8 = 4,
 DT_INT16 = 5,
 DT_INT8 = 6,
 DT_STRING = 7,
 DT_COMPLEX64 = 8,
 DT_INT64 = 9,
 DT_BOOL = 10,
 DT_QINT8 = 11,
 DT_QUINT8 = 12,
 DT_QINT32 = 13,
 DT_BFLOAT16 = 14,
 DT_QINT16 = 15,
 DT_QUINT16 = 16,
 DT_UINT16 = 17,
 DT_COMPLEX128 = 18,
 DT_HALF = 19,
 DT_FLOAT_REF = 101,
 DT_DOUBLE_REF = 102,
 DT_INT32_REF = 103,
 DT_UINT8_REF = 104,
 DT_INT16_REF = 105,
 DT_INT8_REF = 106,
 DT_STRING_REF = 107,
 DT_COMPLEX64_REF = 108,
 DT_INT64_REF = 109,
 DT_BOOL_REF = 110,
 DT_QINT8_REF = 111,
 DT_QUINT8_REF = 112,
 DT_QINT32_REF = 113,
 DT_BFLOAT16_REF = 114,
 DT_QINT16_REF = 115,
 DT_QUINT16_REF = 116,
 DT_UINT16_REF = 117,
 DT_COMPLEX128_REF = 118,
 DT_HALF_REF = 119,
 DataType_INT_MIN_SENTINEL_DO_NOT_USE_ = ::google::protobuf::kint32min,
 DataType_INT_MAX_SENTINEL_DO_NOT_USE_ = ::google::protobuf::kint32max
 };
 */

@end
