//
//  FBTrackerURL.h
//  FaceBlock
//
//  Created by K Y on 9/13/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBTrackerURL: NSObject

- (instancetype)initWithURL:(NSURL *)url;
- (instancetype)initWithURLRequest:(NSURLRequest *)request;

@property (readonly, getter=hasTracker) BOOL hasTracker;
@property (readonly, getter=getCleanURL) NSURL *cleanURL;
@property (readonly, getter=getCleanRequest) NSURLRequest *cleanURLRequest;

@end

NS_ASSUME_NONNULL_END
