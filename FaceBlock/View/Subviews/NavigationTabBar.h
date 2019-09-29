//
//  NavigationTabBar.h
//  FaceBlock
//
//  Created by K Y on 9/13/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NavigationTabBarDelegate <NSObject>

- (void)backButtonAction;
- (void)forwardButtonAction;
- (void)otherButtonAction;
- (void)optionsButtonAction;

@end

@interface NavigationTabBar : UITabBar

@property (nullable, nonatomic, weak) id<NavigationTabBarDelegate> navDelegate;

@end

NS_ASSUME_NONNULL_END
