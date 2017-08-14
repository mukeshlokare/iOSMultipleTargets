//
//  TargetEnvironment.m
//  iOSMutipleTarget
//
//  Created by webwerks on 14/08/17.
//  Copyright © 2017 smart. All rights reserved.
//


#import "TargetEnvironment.h"

@implementation TargetEnvironment

static TargetEnvironment *_sharedEnvironment = nil;

+(TargetEnvironment *) sharedEnvironment {
    @synchronized([TargetEnvironment class]) {
        if(!_sharedEnvironment) {
            _sharedEnvironment =[[self alloc] init];
        }
        return _sharedEnvironment;
    }
    return nil;
}

- (void) setTargetAndEnsureProperFlags{
    
    //Access Info.plist for the Bundle Identifier
    NSString *bundleIdentifier = [[NSBundle mainBundle] infoDictionary][(NSString *)kCFBundleIdentifierKey];
    NSLog(@"Bundle ID: %@", bundleIdentifier);
    
    // Settings of flags with the selected target
    
    #ifdef MULTIPLE_TARGETS_BASE
        NSAssert([@"com.ios.iOSMutipleTarget" isEqualToString:bundleIdentifier], @"Bundle Identifier does not match");
    #elif defined(MULTIPLE_TARGET_ONE)
        NSAssert([@"com.ios.Test" isEqualToString:bundleIdentifier], @"Bundle Identifier does not match");
    #elif defined(MULTIPLE_TARGETS_TWO)
        NSAssert([@"com.ios.TargetTwo" isEqualToString:bundleIdentifier], @"Bundle Identifier does not match");
        NSAssert(FALSE, @"Target is essential");
    #endif
    
}

@end
