//
//  Constant.h
//  iOSMutipleTarget
//
//  Created by webwerks on 14/08/17.
//  Copyright © 2017 smart. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#ifdef MULTIPLE_TARGETS_BASE
static NSString * const BaseText = @"Base Target";
#elif defined(MULTIPLE_TARGET_ONE)
static NSString * const BaseText = @"Target One";
#elif defined(MULTIPLE_TARGETS_TWO)
static NSString * const BaseText = @"Target Two";

#else
NSAssert(FALSE, @"Target is essential");
#endif


#endif /* Constant_h */
