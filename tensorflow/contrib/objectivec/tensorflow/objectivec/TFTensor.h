//
//  TF_Tensor.h
//  tensorflow_api
//
//  Created by Stephen Oman on 20/04/2016.
//  Copyright © 2016 Stephen Oman. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TFTypes.h"

@interface TFTensor : NSObject

- (instancetype)initWithDataType:(TFDataType)type dimLengths:(NSArray *) dimLengths numDimensions:(NSInteger)numDimensions data:(NSData *)data;

// This is not right
- (void)deleteTensor;

- (TFDataType)type;
- (NSInteger)dimensions;
- (NSInteger)lengthOfDimension:(NSInteger)dimension;
- (NSInteger)byteSize;
- (NSData *)data;


@end
