//
//  AppDelegate.m
//  FaceBlock
//
//  Created by K Y on 9/13/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "AppDelegate.h"
#import "FBViewController.h"
#import "TabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [_window setRootViewController:[[FBViewController alloc] init]];
    [_window makeKeyAndVisible];
    
    return YES;
}

@end
