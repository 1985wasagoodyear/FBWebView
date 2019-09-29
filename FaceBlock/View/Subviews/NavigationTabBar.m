//
//  NavigationTabBar.m
//  FaceBlock
//
//  Created by K Y on 9/13/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "NavigationTabBar.h"

@interface NavigationTabBar () <UITabBarDelegate>

@property (nonatomic, strong) UITabBarItem *backButton;
@property (nonatomic, strong) UITabBarItem *forwardButton;
@property (nonatomic, strong) UITabBarItem *otherButton;
@property (nonatomic, strong) UITabBarItem *optionsButton;

@end

@implementation NavigationTabBar

- (instancetype)init {
    self = [super init];
    if (self) {
        self.delegate = self;
        _backButton = [[UITabBarItem alloc] initWithTitle:@"back"
                                                    image:nil tag:0];
        _forwardButton = [[UITabBarItem alloc] initWithTitle:@"forward"
                                                       image:nil tag:1];
        _otherButton = [[UITabBarItem alloc] initWithTitle:@"other"
                                                     image:nil tag:2];
        _optionsButton = [[UITabBarItem alloc] initWithTitle:@"options"
                                                       image:nil tag:3];
        [self setItems:@[_backButton, _forwardButton, _otherButton, _optionsButton]];
    }
    return self;
}

- (void)backButtonAction {
    [self.navDelegate backButtonAction];
}

- (void)forwardButtonAction {
    [self.navDelegate forwardButtonAction];
}

- (void)otherButtonAction {
    [self.navDelegate otherButtonAction];
}

- (void)optionsButtonAction {
    [self.navDelegate optionsButtonAction];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    switch (item.tag) {
        case 0:
            [self backButtonAction];
            NSLog(@"back");
            break;
        case 1:
            [self forwardButtonAction];
            NSLog(@"forward");
            break;
        case 2:
            [self otherButtonAction];
            NSLog(@"other");
            break;
        default:
            [self optionsButtonAction];
            NSLog(@"options");
            break;
    }
}

@end
