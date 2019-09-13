//
//  UIView+Utility.h
//  FaceBlock
//
//  Created by K Y on 9/13/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Utility)

- (void)addFillingSubview:(UIView *)view;
- (void)addFillingSubview:(UIView *)view padding:(CGFloat)padding;

@end

NS_ASSUME_NONNULL_END
