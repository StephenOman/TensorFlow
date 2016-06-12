//
//  TF_Tensor.m
//  tensorflow_api
//
//  Created by Stephen Oman on 20/04/2016.
//  Copyright © 2016 Stephen Oman. All rights reserved.
//

#import "TFTensor.h"

#include "tensorflow/core/framework/tensor.h"

@interface TFTensor() {

    tensorflow::Tensor tensor;
    
}
@end

@implementation TFTensor

- (instancetype)initWithDataType:(TFDataType)type dimLengths:(NSArray *) dimLengths numDimensions:(NSInteger)numDimensions data:(NSData *)data {

    return self;
}

- (NSInteger)dimensions {
    return tensor.dims();
}

- (NSInteger)lengthOfDimension:(NSInteger)dimension {
    // Note: ignoring loss of precision here in casting from
    // NSInteger to int. Assume that the number of dimensions
    // is always less than the maximum integer value.
    return tensor.dim_size((int)dimension);
}

- (NSInteger)byteSize {
    return tensor.TotalBytes();
}

- (NSData *)data {
    
}

@end
