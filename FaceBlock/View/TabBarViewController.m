//
//  TabBarViewController.m
//  FaceBlock
//
//  Created by K Y on 9/13/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "TabBarViewController.h"
#import "FBViewController.h"
#import "OptionsViewController.h"

@interface TabBarViewController ()

@property (nonatomic, strong) UINavigationController *homeVCNav;
@property (nonatomic, strong) FBViewController *homeVC;

@property (nonatomic, strong) UINavigationController *optionsVCNav;
@property (nonatomic, strong) OptionsViewController *optionsVC;

@end

@implementation TabBarViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        // create homepage
        _homeVCNav = [[UINavigationController alloc] init];
        _homeVC = [[FBViewController alloc] init];
        [_homeVCNav setViewControllers:@[_homeVC]];
        _homeVCNav.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured
                          
                                                                           tag:0];
        // create options page
        _optionsVCNav = [[UINavigationController alloc] init];
        _optionsVC = [[OptionsViewController alloc] init];
        [_optionsVCNav setViewControllers:@[_optionsVC]];
        _optionsVCNav.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks
                                                                           tag:0];

        // set all our VC's.
        [self setViewControllers:@[_homeVCNav, _optionsVCNav]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
