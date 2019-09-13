//
//  UIView+Utility.m
//  FaceBlock
//
//  Created by K Y on 9/13/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "UIView+Utility.h"

@implementation UIView (Utility)

- (void)addFillingSubview:(UIView *)view {
    [self addFillingSubview:view padding:0.0];
}

- (void)addFillingSubview:(UIView *)view padding:(CGFloat)padding {
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:view];
    NSArray *constraints = @[
                             [view.leadingAnchor constraintEqualToAnchor:self.leadingAnchor
                                                                constant:padding],
                             [view.topAnchor constraintEqualToAnchor:self.topAnchor
                                                            constant:padding],
                             [self.bottomAnchor constraintEqualToAnchor:view.bottomAnchor
                                                               constant:padding],
                             [self.trailingAnchor constraintEqualToAnchor:view.trailingAnchor
                                                                 constant:padding],
                             ];
    [NSLayoutConstraint activateConstraints:constraints];
}

@end
