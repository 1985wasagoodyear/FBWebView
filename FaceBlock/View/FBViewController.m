//
//  FBViewController.m
//  FaceBlock
//
//  Created by K Y on 9/13/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "FBViewController.h"
#import <WebKit/WebKit.h>
#import "UIView+Utility.h"
#import "FBTrackerURL.h"
#import "NavigationTabBar.h"
#import "OptionsViewController.h"

NSString *const BASE_URL = @"https://mbasic.facebook.com";
NSTimeInterval const TIMEOUT_INTERVAL = 180.0;

@interface FBViewController () <WKNavigationDelegate, UIScrollViewDelegate, WKUIDelegate, NavigationTabBarDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) NavigationTabBar *navTabBar;
@property (nonatomic, strong) UITextField *addressField;

@end

@implementation FBViewController

- (instancetype)init {
    self = [super init];
    if (self) {    }
    return self;
}

- (void)loadView {
    [super loadView];
    UIView *view = self.view;
    [view setBackgroundColor:UIColor.whiteColor];
    // build webview
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    _webView = [[WKWebView alloc] initWithFrame:view.frame configuration:config];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    _webView.scrollView.delegate = self;
    _webView.translatesAutoresizingMaskIntoConstraints = NO;
    [view addSubview:_webView];
    
    // build navigation bar
    _navTabBar = [[NavigationTabBar alloc] init];
    _navTabBar.translatesAutoresizingMaskIntoConstraints = NO;
    _navTabBar.navDelegate = self;
    [view addSubview:_navTabBar];
    
    // all subview constraints
    NSArray *constraints = @[
                             [_webView.topAnchor constraintEqualToAnchor:view.layoutMarginsGuide.topAnchor],
                             [_webView.leadingAnchor constraintEqualToAnchor:view.leadingAnchor],
                             [_webView.trailingAnchor constraintEqualToAnchor:view.trailingAnchor],
                             [_navTabBar.topAnchor constraintEqualToAnchor:_webView.bottomAnchor],
                             [_navTabBar.leadingAnchor constraintEqualToAnchor:view.leadingAnchor],
                             [_navTabBar.trailingAnchor constraintEqualToAnchor:view.trailingAnchor],
                             [_navTabBar.bottomAnchor constraintEqualToAnchor:view.bottomAnchor],
                            ];
    [NSLayoutConstraint activateConstraints: constraints];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:BASE_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:TIMEOUT_INTERVAL];
    [_webView loadRequest:request];
}

#pragma mark - NavigationTabBar Delegate Methods

- (void)backButtonAction {
    [_webView goBack];
}

- (void)forwardButtonAction {
    [_webView goForward];
}

- (void)otherButtonAction {
    
}

- (void)optionsButtonAction {
    OptionsViewController *optionsVC = [[OptionsViewController alloc] init];
    [self presentViewController:optionsVC
                       animated:YES
                     completion:nil];
}

#pragma mark - WKNavigationDelegate
 
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    FBTrackerURL *tracker = [[FBTrackerURL alloc] initWithURLRequest:navigationAction.request];
    if ([tracker hasTracker] == YES) {
        decisionHandler(WKNavigationActionPolicyCancel);
        [webView loadRequest:[tracker getCleanRequest]];
        return;
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

#pragma mark - WKUIDelegate

- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}

#pragma mark - UIScrollViewDelegate

@end
