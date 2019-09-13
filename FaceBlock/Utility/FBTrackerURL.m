//
//  NSURL+FB.m
//  FaceBlock
//
//  Created by K Y on 9/13/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "FBTrackerURL.h"

NSString *const FB_ID_TRACKER = @"fbclid";
NSString *const FB_REDIRECT_PREFIX = @"https://lm.facebook.com/l.php?u=";

@interface FBTrackerURL () {
    BOOL _hasTracker;
    NSURLRequest *_cleanRequest;
}

@end

@implementation FBTrackerURL

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Do not instantiate this object with init"
                                   reason:@"Please url initWithURL: or initWithURLRequest:"
                                 userInfo:nil];
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        NSArray *comps = [[url absoluteString] componentsSeparatedByString:FB_ID_TRACKER];
        if (comps.count > 1) {
            _hasTracker = YES;
            comps = [comps.firstObject componentsSeparatedByString:FB_REDIRECT_PREFIX];
            NSString *urlString = [comps.lastObject stringByRemovingPercentEncoding];
            _cleanRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        }
    }
    return self;
}

- (instancetype)initWithURLRequest:(NSURLRequest *)request {
    return [self initWithURL:request.URL];
}

- (BOOL)hasTracker {
    return _hasTracker;
}

- (NSURL *)getCleanURL {
    return _cleanRequest.URL;
}

- (NSURLRequest *)getCleanRequest {
    return _cleanRequest;
}

@end
